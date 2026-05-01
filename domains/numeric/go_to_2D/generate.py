import argparse
import random
from pathlib import Path


def robot_names(num_robots: int) -> list[str]:
    return [f"ROBOT{i}" for i in range(1, num_robots + 1)]


def generate_problem(
    problem_name: str,
    num_robots: int,
    min_coord: float,
    max_coord: float,
    rng: random.Random,
) -> str:
    robots = [f"ROBOT{i}" for i in range(1, num_robots + 1)]

    def rand_float():
        return rng.uniform(min_coord, max_coord)

    target_x = rand_float()
    target_y = rand_float()

    positions = []
    for _ in range(num_robots):
        x = rand_float()
        y = rand_float()

        # avoid exactly starting on target
        if x == target_x and y == target_y:
            x = rand_float()
            y = rand_float()

        positions.append((x, y))

    objects = f"{' '.join(robots)} - robot TARGET - target"

    init_lines = []
    init_lines.extend(f"(is_robot {r})" for r in robots)
    init_lines.append("(is_target TARGET)")

    for r, (x, y) in zip(robots, positions):
        init_lines.append(f"(= (x {r}) {x:.3f})")
        init_lines.append(f"(= (y {r}) {y:.3f})")

    init_lines.append(f"(= (x TARGET) {target_x:.3f})")
    init_lines.append(f"(= (y TARGET) {target_y:.3f})")

    goal_lines = []
    for r in robots:
        goal_lines.append(f"(= (x {r}) (x TARGET))")
        goal_lines.append(f"(= (y {r}) (y TARGET))")

    init = "\n    ".join(init_lines)
    goal = "\n      ".join(goal_lines)

    return f"""(define (problem {problem_name})
  (:domain got_to)

  (:objects {objects})

  (:init
    {init}
  )

  (:goal
    (and
      {goal}
    )
  )
)
"""


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate got_to PDDL problems.")
    parser.add_argument("--base-name", type=str, default="p")
    parser.add_argument("--min-num-robots", type=int, default=1)
    parser.add_argument("--max-num-robots", type=int, default=10)
    parser.add_argument("-r", "--repetitions", type=int, default=1)
    parser.add_argument("-o", "--out", type=str, default="got_to_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)
    parser.add_argument("--min-coord", type=int, default=0)
    parser.add_argument("--max-coord", type=int, default=5)
    args = parser.parse_args()

    if args.min_num_robots < 1:
        raise ValueError("--min-num-robots must be at least 1")
    if args.max_num_robots < args.min_num_robots:
        raise ValueError("--max-num-robots must be >= --min-num-robots")
    if args.max_coord < args.min_coord:
        raise ValueError("--max-coord must be >= --min-coord")

    rng = random.Random(args.seed)
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    for n in range(args.min_num_robots, args.max_num_robots + 1):
        for rep in range(1, args.repetitions + 1):

            problem_name = f"{args.base_name}{n:02}-{rep}"

            text = generate_problem(
                problem_name=problem_name,
                num_robots=n,
                min_coord=args.min_coord,
                max_coord=args.max_coord,
                rng=rng,
            )

            (out_dir / f"{problem_name}.pddl").write_text(text, encoding="utf-8")


if __name__ == "__main__":
    main()
