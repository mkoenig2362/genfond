import argparse
import random
from pathlib import Path


def fmt_num(value: int) -> str:
    """Format integer numeric values as PDDL floats, e.g. 4 -> 4.0."""
    return f"{float(value):.1f}"


def fire_names(num_fires: int) -> list[str]:
    return [f"F{i}" for i in range(1, num_fires + 1)]


def choose_burning_values(
    num_fires: int,
    min_burning: int,
    max_burning: int,
    mode: str,
    rng: random.Random,
) -> list[int]:
    if mode == "increasing":
        return [min(max_burning, min_burning + i) for i in range(num_fires)]

    if mode == "decreasing":
        return [max(min_burning, max_burning - i) for i in range(num_fires)]

    if mode == "random":
        return [rng.randint(min_burning, max_burning) for _ in range(num_fires)]

    raise ValueError(f"unknown burning mode: {mode}")


def generate_problem(
    problem_name: str,
    num_fires: int,
    min_burning: int,
    max_burning: int,
    burning_mode: str,
    initial_location: str,
    initial_carrying: int,
    rng: random.Random,
) -> str:
    fires = fire_names(num_fires)
    burning_values = choose_burning_values(
        num_fires=num_fires,
        min_burning=min_burning,
        max_burning=max_burning,
        mode=burning_mode,
        rng=rng,
    )

    objects = []
    objects.extend(f"    {f} - fire" for f in fires)
    objects.append("    R - river")

    init_lines = []
    for f, burning in zip(fires, burning_values):
        init_lines.append(f"(= (burning {f}) {fmt_num(burning)})")

    init_lines.append(f"(= (carrying) {fmt_num(initial_carrying)})")

    if initial_location == "river":
        init_lines.append("(at R)")
    elif initial_location == "first-fire":
        init_lines.append("(at F1)")
    elif initial_location == "random-fire":
        init_lines.append(f"(at {rng.choice(fires)})")
    else:
        raise ValueError(f"unknown initial location: {initial_location}")

    # The domain uses (same ?f ?l) under a negation to prevent fly-to-fire(F1,F1).
    # Add only reflexive fire facts, so (not (same F1 R)) and (not (same F1 F2)) remain true.
    init_lines.extend(f"(same {f} {f})" for f in fires)

    goal_lines = [f"(= (burning {f}) 0.0)" for f in fires]

    objects_text = "\n".join(objects)
    init_text = "\n    ".join(init_lines)
    goal_text = "\n    ".join(goal_lines)

    return f"""(define (problem {problem_name})
  (:domain waterdrone)

  (:objects
{objects_text}
  )

  (:init
    {init_text}
  )

  (:goal (and
    {goal_text}
  ))
)
"""


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate waterdrone PDDL problems.")
    parser.add_argument("--base-name", type=str, default="waterdrone")
    parser.add_argument("--min-num-fires", type=int, default=1)
    parser.add_argument("--max-num-fires", type=int, default=10)
    parser.add_argument("-r", "--repetitions", type=int, default=1)
    parser.add_argument("-o", "--out", type=str, default="waterdrone_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)

    parser.add_argument("--min-burning", type=int, default=1)
    parser.add_argument("--max-burning", type=int, default=5)
    parser.add_argument(
        "--burning-mode",
        choices=["random", "increasing", "decreasing"],
        default="random",
    )
    parser.add_argument(
        "--initial-location",
        choices=["river", "first-fire", "random-fire"],
        default="river",
    )
    parser.add_argument("--initial-carrying", type=int, default=0)

    args = parser.parse_args()

    if args.min_num_fires < 1:
        raise ValueError("--min-num-fires must be at least 1")
    if args.max_num_fires < args.min_num_fires:
        raise ValueError("--max-num-fires must be >= --min-num-fires")
    if args.min_burning < 0:
        raise ValueError("--min-burning must be non-negative")
    if args.max_burning < args.min_burning:
        raise ValueError("--max-burning must be >= --min-burning")
    if args.initial_carrying < 0:
        raise ValueError("--initial-carrying must be non-negative")

    rng = random.Random(args.seed)
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    counter = 1
    for num_fires in range(args.min_num_fires, args.max_num_fires + 1):
        for _ in range(args.repetitions):
            problem_name = f"{args.base_name}-{counter}"
            text = generate_problem(
                problem_name=problem_name,
                num_fires=num_fires,
                min_burning=args.min_burning,
                max_burning=args.max_burning,
                burning_mode=args.burning_mode,
                initial_location=args.initial_location,
                initial_carrying=args.initial_carrying,
                rng=rng,
            )
            (out_dir / f"p{counter:02}.pddl").write_text(text, encoding="utf-8")
            counter += 1


if __name__ == "__main__":
    main()
