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

    # --- Random float positions ---
    def rand_float():
        return rng.uniform(min_coord, max_coord)

    # Target position (random float)
    target_x = rand_float()

    # Robot positions (random floats, try to avoid trivial cases)
    positions = []
    for _ in range(num_robots):
        x = rand_float()
        if x == target_x:
            x = rand_float()
        positions.append(x)

    # --- Objects ---
    objects = f"{' '.join(robots)} - robot TARGET - target"

    # --- Init ---
    init_lines = []
    init_lines.extend(f"(is_robot {r})" for r in robots)
    init_lines.append("(is_target TARGET)")

    for r, x in zip(robots, positions):
        init_lines.append(f"(= (x {r}) {x:.3f})")

    init_lines.append(f"(= (x TARGET) {target_x:.3f})")

    # --- Goal ---
    goal_lines = [f"(= (x {r}) (x TARGET))" for r in robots]

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
    parser.add_argument("--max-coord", type=int, default=10)
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
