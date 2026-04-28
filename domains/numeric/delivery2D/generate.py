import argparse
import random
from pathlib import Path


def fmt_num(value: int) -> str:
    return f"{float(value):.1f}"


def package_positions_2d(
    num_packages: int,
    target_x: int,
    target_y: int,
    mode: str,
    max_coord: int,
) -> list[tuple[int, int]]:
    if mode == "increasing":
        return [(i + 1, i + 1) for i in range(num_packages)]

    if mode == "around-target":
        positions = []
        step = 1
        while len(positions) < num_packages:
            positions.append((target_x - step, target_y - step))
            if len(positions) < num_packages:
                positions.append((target_x + step, target_y + step))
            step += 1
        return positions

    if mode == "random":
        return [
            (
                random.randint(0, max_coord),
                random.randint(0, max_coord),
            )
            for _ in range(num_packages)
        ]

    raise ValueError(f"unknown position mode: {mode}")


def generate_problem(
    problem_name: str,
    num_packages: int,
    target_x: int,
    target_y: int,
    gripper_x: int,
    gripper_y: int,
    max_coord: int,
    position_mode: str,
    include_type_predicates: bool,
) -> str:
    packages = [f"p{i}" for i in range(1, num_packages + 1)]
    positions = package_positions_2d(
        num_packages=num_packages,
        target_x=target_x,
        target_y=target_y,
        mode=position_mode,
        max_coord=max_coord,
    )

    objects = f"{' '.join(packages)} - package g - gripper t - target"

    init_lines = []

    for p, (x, y) in zip(packages, positions):
        init_lines.append(f"(= (x {p}) {fmt_num(x)})")
        init_lines.append(f"(= (y {p}) {fmt_num(y)})")

    init_lines.append(f"(= (x t) {fmt_num(target_x)})")
    init_lines.append(f"(= (y t) {fmt_num(target_y)})")
    init_lines.append(f"(= (x g) {fmt_num(gripper_x)})")
    init_lines.append(f"(= (y g) {fmt_num(gripper_y)})")

    if include_type_predicates:
        init_lines.extend(f"(is_p {p})" for p in packages)
        init_lines.append("(is_g g)")
        init_lines.append("(is_t t)")

    init_lines.append("(free)")

    goal_lines = []
    for p in packages:
        goal_lines.append(f"(= (x {p}) (x t))")
        goal_lines.append(f"(= (y {p}) (y t))")

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
    parser = argparse.ArgumentParser(description="Generate 2D delivery PDDL problems.")

    parser.add_argument("--base-name", type=str, default="delivery2d")
    parser.add_argument("--min-num-packages", type=int, default=1)
    parser.add_argument("--max-num-packages", type=int, default=10)

    parser.add_argument(
        "-r",
        "--repetitions",
        type=int,
        default=1,
        help="number of problems for each package count",
    )

    parser.add_argument("-o", "--out", type=str, default="delivery2d_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)

    parser.add_argument("--target-x", type=int, default=0)
    parser.add_argument("--target-y", type=int, default=0)
    parser.add_argument("--gripper-x", type=int, default=0)
    parser.add_argument("--gripper-y", type=int, default=0)

    parser.add_argument("--max-coord", type=int, default=10)

    parser.add_argument(
        "--position-mode",
        choices=["increasing", "around-target", "random"],
        default="random",
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

    if args.max_coord < 0:
        raise ValueError("--max-coord must be non-negative")

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
                target_y=args.target_y,
                gripper_x=args.gripper_x,
                gripper_y=args.gripper_y,
                max_coord=args.max_coord,
                position_mode=args.position_mode,
                include_type_predicates=not args.no_type_predicates,
            )

            path = out_dir / f"p{index}.pddl"
            path.write_text(text, encoding="utf-8")


if __name__ == "__main__":
    main()