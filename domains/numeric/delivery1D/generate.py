import argparse
import os
import random
from pathlib import Path


def package_positions(num_packages: int, target_x: int, mode: str, max_coord: int) -> list[int]:
    """Create initial x-coordinates for packages."""
    if mode == "increasing":
        # Deterministic, easy to inspect: p1=1, p2=2, ...; avoid all packages already at target.
        return [i + 1 for i in range(num_packages)]

    if mode == "around-target":
        # Alternates left/right around target: target-1, target+1, target-2, target+2, ...
        positions = []
        step = 1
        while len(positions) < num_packages:
            positions.append(max(0, target_x - step))
            if len(positions) < num_packages:
                positions.append(min(max_coord, target_x + step))
            step += 1
        return positions

    if mode == "random":
        positions = []
        for _ in range(num_packages):
            x = random.randint(-max_coord, max_coord)
            positions.append(x)
        return positions

    raise ValueError(f"unknown position mode: {mode}")


def generate_problem(
    problem_name: str,
    num_packages: int,
    target_x: int,
    gripper_x: int,
    max_coord: int,
    position_mode: str,
    include_type_predicates: bool,
) -> str:
    packages = [f"p{i}" for i in range(1, num_packages + 1)]
    positions = package_positions(num_packages, target_x, position_mode, max_coord)

    objects = f"{' '.join(packages)} - package g - gripper t - target"

    init_lines = []
    for p, x in zip(packages, positions):
        init_lines.append(f"(= (x {p}) {float(x):.1f})")
    init_lines.append(f"(= (x t) {float(target_x):.1f})")
    init_lines.append(f"(= (x g) {float(gripper_x):.1f})")

    if include_type_predicates:
        init_lines.extend(f"(is_p {p})" for p in packages)
        init_lines.append("(is_g g)")
        init_lines.append("(is_t t)")

    init_lines.append("(free)")

    goal_lines = [f"(= (x {p}) (x t))" for p in packages]
    goal_lines.append("(free)")
    goal_lines.extend(f"(not (holding {p}))" for p in packages)

    init = "\n    ".join(init_lines)
    goal = "\n    ".join(goal_lines)

    return f"""(define (problem {problem_name})
  (:domain delivery)
  (:objects {objects})
  (:init
    {init})
  (:goal (and
    {goal}))
)
"""


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate 1D delivery PDDL problems.")
    parser.add_argument("--base-name", type=str, default="delivery1d")
    parser.add_argument("--min-num-packages", type=int, default=1)
    parser.add_argument("--max-num-packages", type=int, default=10)
    parser.add_argument("-r", "--repetitions", type=int, default=1,
                        help="number of problems for each package count")
    parser.add_argument("-o", "--out", type=str, default="delivery1d_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)
    parser.add_argument("--target-x", type=int, default=0)
    parser.add_argument("--gripper-x", type=int, default=0)
    parser.add_argument("--max-coord", type=int, default=10)
    parser.add_argument(
        "--position-mode",
        choices=["increasing", "around-target", "random"],
        default="increasing",
        help="how to choose package initial positions",
    )
    parser.add_argument(
        "--no-type-predicates",
        action="store_true",
        help="omit (is_p ...), (is_g g), and (is_t t) from init",
    )
    args = parser.parse_args()

    if args.min_num_packages < 1:
        raise ValueError("--min-num-packages must be at least 1")
    if args.max_num_packages < args.min_num_packages:
        raise ValueError("--max-num-packages must be >= --min-num-packages")

    random.seed(args.seed)
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    for n in range(args.min_num_packages, args.max_num_packages + 1):
        for rep in range(1, args.repetitions + 1):
            index = f"{n:03}-{rep}"
            problem_name = f"{args.base_name}-{index}"
            text = generate_problem(
                problem_name=problem_name,
                num_packages=n,
                target_x=args.target_x,
                gripper_x=args.gripper_x,
                max_coord=args.max_coord,
                position_mode=args.position_mode,
                include_type_predicates=not args.no_type_predicates,
            )
            (out_dir / f"p{index}.pddl").write_text(text, encoding="utf-8")


if __name__ == "__main__":
    main()
