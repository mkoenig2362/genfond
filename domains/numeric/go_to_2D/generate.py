import argparse
import random
from pathlib import Path


def fmt_num(value: int) -> str:
    return f"{float(value):.1f}"


def robot_names(num_robots: int) -> list[str]:
    return [f"ROBOT{i}" for i in range(1, num_robots + 1)]


def choose_positions_2d(num_robots, target_x, target_y, min_coord, max_coord, mode, rng):
    if mode == "increasing":
        return [(min_coord + i, min_coord + i) for i in range(num_robots)]

    if mode == "around-target":
        positions = []
        step = 1
        while len(positions) < num_robots:
            positions.append((max(min_coord, target_x - step), max(min_coord, target_y - step)))
            if len(positions) < num_robots:
                positions.append((min(max_coord, target_x + step), min(max_coord, target_y + step)))
            step += 1
        return positions

    if mode == "random":
        positions = []
        for _ in range(num_robots):
            x = rng.randint(min_coord, max_coord)
            y = rng.randint(min_coord, max_coord)
            if min_coord < max_coord and x == target_x and y == target_y:
                x = x + 1 if x < max_coord else x - 1
            positions.append((x, y))
        return positions

    raise ValueError(f"unknown position mode: {mode}")


def generate_problem(problem_name, num_robots, target_x, target_y, min_coord, max_coord, position_mode, rng):
    robots = robot_names(num_robots)
    positions = choose_positions_2d(
        num_robots, target_x, target_y, min_coord, max_coord, position_mode, rng
    )

    objects = f"{' '.join(robots)} - robot TARGET - target"

    init_lines = []
    init_lines.extend(f"(is_robot {r})" for r in robots)
    init_lines.append("(is_target TARGET)")

    for r, (x, y) in zip(robots, positions):
        init_lines.append(f"(= (x {r}) {fmt_num(x)})")
        init_lines.append(f"(= (y {r}) {fmt_num(y)})")

    init_lines.append(f"(= (x TARGET) {fmt_num(target_x)})")
    init_lines.append(f"(= (y TARGET) {fmt_num(target_y)})")

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
    parser = argparse.ArgumentParser(description="Generate 2D got_to PDDL problems.")
    parser.add_argument("--base-name", type=str, default="p")
    parser.add_argument("--min-num-robots", type=int, default=1)
    parser.add_argument("--max-num-robots", type=int, default=10)
    parser.add_argument("-r", "--repetitions", type=int, default=1)
    parser.add_argument("-o", "--out", type=str, default="got_to_2d_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)

    parser.add_argument("--target-x", type=int, default=0)
    parser.add_argument("--target-y", type=int, default=0)
    parser.add_argument("--min-coord", type=int, default=0)
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
    if not (args.min_coord <= args.target_y <= args.max_coord):
        raise ValueError("--target-y must be between --min-coord and --max-coord")

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
                target_y=args.target_y,
                min_coord=args.min_coord,
                max_coord=args.max_coord,
                position_mode=args.position_mode,
                rng=rng,
            )
            (out_dir / f"p{counter:02}.pddl").write_text(text, encoding="utf-8")
            counter += 1


if __name__ == "__main__":
    main()