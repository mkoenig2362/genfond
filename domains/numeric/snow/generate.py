import argparse
import os
import random
from pathlib import Path


def format_objects(num_walkways: int, num_driveways: int) -> str:
    walkways = " ".join(f"W_{i}" for i in range(1, num_walkways + 1))
    driveways = " ".join(f"D_{i}" for i in range(1, num_driveways + 1))

    lines = []
    if walkways:
        lines.append(f"    {walkways} - ww")
    if driveways:
        lines.append(f"    {driveways} - dw")
    return "\n".join(lines)


def format_init(walkway_snow: list[int], driveway_snow: list[int]) -> str:
    lines = []
    for i, amount in enumerate(walkway_snow, start=1):
        lines.append(f"    (= (snow W_{i}) {float(amount):.1f})")
    for i, amount in enumerate(driveway_snow, start=1):
        lines.append(f"    (= (snow D_{i}) {float(amount):.1f})")
    return "\n".join(lines)


def format_goal(num_walkways: int, num_driveways: int) -> str:
    goals = []
    for i in range(1, num_walkways + 1):
        goals.append(f"           (= (snow W_{i}) 0.0)")
    for i in range(1, num_driveways + 1):
        goals.append(f"           (= (snow D_{i}) 0.0)")
    return "\n".join(goals)


def generate_problem(
    name: str,
    num_walkways: int,
    num_driveways: int,
    min_snow: int,
    max_snow: int,
    rng: random.Random,
) -> str:
    walkway_snow = [rng.randint(min_snow, max_snow) for _ in range(num_walkways)]
    driveway_snow = [rng.randint(min_snow, max_snow) for _ in range(num_driveways)]

    return f"""(define (problem {name})
  (:domain snow)

  (:objects
{format_objects(num_walkways, num_driveways)}
  )

  (:init
{format_init(walkway_snow, driveway_snow)}
  )

  (:goal (and
{format_goal(num_walkways, num_driveways)}))
)
"""


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate Snow PDDL problems with increasing numbers of objects."
    )
    parser.add_argument("--base-name", type=str, default="snow")
    parser.add_argument("--min-num-walkways", type=int, default=1)
    parser.add_argument("--max-num-walkways", type=int, default=10)
    parser.add_argument("--num-driveways", type=int, default=1)
    parser.add_argument("--min-snow", type=int, default=1)
    parser.add_argument("--max-snow", type=int, default=10)
    parser.add_argument(
        "-r", "--repetitions", type=int, default=1,
        help="number of problems for each number of walkways"
    )
    parser.add_argument("-s", "--seed", type=int, default=0)
    parser.add_argument("-o", "--output-dir", type=str, default=".")
    args = parser.parse_args()

    if args.min_num_walkways < 1:
        raise ValueError("--min-num-walkways must be at least 1")
    if args.max_num_walkways < args.min_num_walkways:
        raise ValueError("--max-num-walkways must be >= --min-num-walkways")
    if args.num_driveways < 1:
        raise ValueError("--num-driveways must be at least 1")
    if args.min_snow < 0:
        raise ValueError("--min-snow must be non-negative")
    if args.max_snow < args.min_snow:
        raise ValueError("--max-snow must be >= --min-snow")

    rng = random.Random(args.seed)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    for num_walkways in range(args.min_num_walkways, args.max_num_walkways + 1):
        for rep in range(1, args.repetitions + 1):
            index = f"{num_walkways:03}-{rep}"
            name = f"{args.base_name}-{index}"
            problem = generate_problem(
                name=name,
                num_walkways=num_walkways,
                num_driveways=args.num_driveways,
                min_snow=args.min_snow,
                max_snow=args.max_snow,
                rng=rng,
            )
            path = output_dir / f"p{index}.pddl"
            path.write_text(problem, encoding="utf-8")


if __name__ == "__main__":
    main()
