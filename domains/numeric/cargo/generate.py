import argparse
import random
from pathlib import Path


def fmt_num(value: int) -> str:
    """Format integer coordinates as PDDL-friendly floats, e.g. -2 -> -2.0."""
    return f"{float(value):.1f}"


def robot_names(num_robots: int) -> list[str]:
    return [f"ROBOT{i}" for i in range(1, num_robots + 1)]


def choose_positions(
    num_robots: int,
    target_x: int,
    min_coord: int,
    max_coord: int,
    mode: str,
    rng: random.Random,
) -> list[int]:
    if mode == "increasing":
        return [min_coord + i for i in range(num_robots)]

    if mode == "around-target":
        positions = []
        step = 1
        while len(positions) < num_robots:
            left = max(min_coord, target_x - step)
            right = min(max_coord, target_x + step)
            positions.append(left)
            if len(positions) < num_robots:
                positions.append(right)
            step += 1
        return positions

    if mode == "random":
        positions = []
        for _ in range(num_robots):
            x = rng.randint(min_coord, max_coord)
            # Keep most instances non-trivial when possible.
            if min_coord < max_coord and x == target_x:
                x = x + 1 if x < max_coord else x - 1
            positions.append(x)
        return positions

    raise ValueError(f"unknown position mode: {mode}")


def generate_problem(
    problem_name: str,
    num_robots: int,
    target_x: int,
    min_coord: int,
    max_coord: int,
    position_mode: str,
    rng: random.Random,
) -> str:
    robots = robot_names(num_robots)
    positions = choose_positions(
        num_robots=num_robots,
        target_x=target_x,
        min_coord=min_coord,
        max_coord=max_coord,
        mode=position_mode,
        rng=rng,
    )

    objects = f"{' '.join(robots)} - robot TARGET - target"

    init_lines = []
    init_lines.extend(f"(is_robot {r})" for r in robots)
    init_lines.append("(is_target TARGET)")
    for r, x in zip(robots, positions):
        init_lines.append(f"(= (x {r}) {fmt_num(x)})")
    init_lines.append(f"(= (x TARGET) {fmt_num(target_x)})")

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
    parser.add_argument("--target-x", type=int, default=0)
    parser.add_argument("--min-coord", type=int, default=-10)
    parser.add_argument("--max-coord", type=int, default=10)
    parser.add_argument(
        "--position-mode",
        choices=["increasing", "around-target", "random"],
        default="random",
    )
    args = parser.parse_args()

    if args.min_num_robots < 1:
        raise ValueError("--min-num-robots must be at least 1")
    if args.max_num_robots < args.min_num_robots:
        raise ValueError("--max-num-robots must be >= --min-num-robots")
    if args.max_coord < args.min_coord:
        raise ValueError("--max-coord must be >= --min-coord")
    if not (args.min_coord <= args.target_x <= args.max_coord):
        raise ValueError("--target-x must be between --min-coord and --max-coord")

    rng = random.Random(args.seed)
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    counter = 1
    for n in range(args.min_num_robots, args.max_num_robots + 1):
        for _ in range(args.repetitions):
            problem_name = f"{args.base_name}{counter}"
            text = generate_problem(
                problem_name=problem_name,
                num_robots=n,
                target_x=args.target_x,
                min_coord=args.min_coord,
                max_coord=args.max_coord,
                position_mode=args.position_mode,
                rng=rng,
            )
            (out_dir / f"p{counter:02}.pddl").write_text(text, encoding="utf-8")
            counter += 1


if __name__ == "__main__":
    main()
