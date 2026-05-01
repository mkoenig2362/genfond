import argparse
import random
from pathlib import Path


def generate_problem(
    problem_name: str,
    num_packages: int,
    min_coord: float,
    max_coord: float,
    include_type_predicates: bool,
    rng: random.Random,
) -> str:
    packages = [f"p{i}" for i in range(1, num_packages + 1)]

    def rand_float():
        return rng.uniform(min_coord, max_coord)

    target_x = 0.0 #rand_float()
    target_y = 0.0 #rand_float()
    gripper_x = rand_float()
    gripper_y = rand_float()

    positions = []
    for _ in range(num_packages):
        x = rand_float()
        y = rand_float()

        if x == target_x and y == target_y:
            x = rand_float()
            y = rand_float()

        positions.append((x, y))

    objects = f"{' '.join(packages)} - package g - gripper t - target"

    init_lines = []

    for p, (x, y) in zip(packages, positions):
        init_lines.append(f"(= (x {p}) {x:.3f})")
        init_lines.append(f"(= (y {p}) {y:.3f})")

    init_lines.append(f"(= (x t) {target_x:.3f})")
    init_lines.append(f"(= (y t) {target_y:.3f})")
    init_lines.append(f"(= (x g) {gripper_x:.3f})")
    init_lines.append(f"(= (y g) {gripper_y:.3f})")

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
    {init}
  )

  (:goal (and
    {goal}
  ))
)
"""


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate delivery2D problems.")

    parser.add_argument("--base-name", type=str, default="p")
    parser.add_argument("--min-num-packages", type=int, default=1)
    parser.add_argument("--max-num-packages", type=int, default=10)

    parser.add_argument("-r", "--repetitions", type=int, default=1)
    parser.add_argument("-o", "--out", type=str, default="delivery2d_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)

    parser.add_argument("--min-coord", type=float, default=0.0)
    parser.add_argument("--max-coord", type=float, default=10.0)

    parser.add_argument("--no-type-predicates", action="store_true")

    args = parser.parse_args()

    if args.min_num_packages < 1:
        raise ValueError("--min-num-packages must be at least 1")

    if args.max_num_packages < args.min_num_packages:
        raise ValueError("--max-num-packages must be >= --min-num-packages")

    if args.max_coord < args.min_coord:
        raise ValueError("--max-coord must be >= --min-coord")

    rng = random.Random(args.seed)

    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    for n in range(args.min_num_packages, args.max_num_packages + 1):
        for rep in range(1, args.repetitions + 1):
            problem_name = f"{args.base_name}{n:02}-{rep}"

            text = generate_problem(
                problem_name=problem_name,
                num_packages=n,
                min_coord=args.min_coord,
                max_coord=args.max_coord,
                include_type_predicates=not args.no_type_predicates,
                rng=rng,
            )

            (out_dir / f"{problem_name}.pddl").write_text(text, encoding="utf-8")


if __name__ == "__main__":
    main()