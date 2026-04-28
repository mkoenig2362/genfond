import argparse
import random
from pathlib import Path


def fmt_num(value: int) -> str:
    """Format integer sizes as PDDL floats, e.g. 5 -> 5.0."""
    return f"{float(value):.1f}"


def piece_names(num_pieces: int) -> list[str]:
    return [f"P{i}" for i in range(1, num_pieces + 1)]


def choose_sizes(
    num_pieces: int,
    min_size: int,
    max_size: int,
    mode: str,
    rng: random.Random,
) -> list[int]:
    if mode == "descending":
        # P1 is biggest, then P2, etc. This guarantees the ordered tower is solvable
        # when max_size - min_size + 1 >= num_pieces.
        if max_size - min_size + 1 < num_pieces:
            raise ValueError(
                "descending mode needs at least one distinct size per piece: "
                "max_size - min_size + 1 must be >= num_pieces"
            )
        return list(range(max_size, max_size - num_pieces, -1))

    if mode == "random":
        return [rng.randint(min_size, max_size) for _ in range(num_pieces)]

    if mode == "random-solvable":
        # Sample distinct values and sort descending, so P1 > P2 > ... > Pn.
        if max_size - min_size + 1 < num_pieces:
            raise ValueError(
                "random-solvable mode needs at least one distinct size per piece: "
                "max_size - min_size + 1 must be >= num_pieces"
            )
        values = rng.sample(range(min_size, max_size + 1), num_pieces)
        return sorted(values, reverse=True)

    if mode == "equal":
        # Useful only if your domain has put-equal.
        value = rng.randint(min_size, max_size)
        return [value for _ in range(num_pieces)]

    raise ValueError(f"unknown size mode: {mode}")


def generate_problem(
    problem_name: str,
    num_pieces: int,
    min_size: int,
    max_size: int,
    size_mode: str,
    rng: random.Random,
) -> str:
    pieces = piece_names(num_pieces)
    sizes = choose_sizes(
        num_pieces=num_pieces,
        min_size=min_size,
        max_size=max_size,
        mode=size_mode,
        rng=rng,
    )

    object_lines = [f"    {' '.join(pieces)} - piece", "    T - table"]

    init_lines = []
    for piece, size in zip(pieces, sizes):
        init_lines.append(f"    (= (size {piece}) {fmt_num(size)})")
    init_lines.append("    (clear T)")

    goal_lines = [f"      (stacked {piece})" for piece in pieces]

    return f"""(define (problem {problem_name})
  (:domain towersort)

  (:objects
{chr(10).join(object_lines)}
  )

  (:init
{chr(10).join(init_lines)}
  )

  (:goal (and
{chr(10).join(goal_lines)}))
)
"""


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate towersort PDDL problems.")
    parser.add_argument("--base-name", type=str, default="towersort")
    parser.add_argument("--min-num-pieces", type=int, default=1)
    parser.add_argument("--max-num-pieces", type=int, default=10)
    parser.add_argument("-r", "--repetitions", type=int, default=1)
    parser.add_argument("-o", "--out", type=str, default="towersort_problems")
    parser.add_argument("-s", "--seed", type=int, default=0)
    parser.add_argument("--min-size", type=int, default=1)
    parser.add_argument("--max-size", type=int, default=10)
    parser.add_argument(
        "--size-mode",
        choices=["descending", "random", "random-solvable", "equal"],
        default="random-solvable",
        help=(
            "descending: P1>P2>...; random: any sizes; "
            "random-solvable: random distinct sizes sorted descending; equal: all same size"
        ),
    )
    args = parser.parse_args()

    if args.min_num_pieces < 1:
        raise ValueError("--min-num-pieces must be at least 1")
    if args.max_num_pieces < args.min_num_pieces:
        raise ValueError("--max-num-pieces must be >= --min-num-pieces")
    if args.max_size < args.min_size:
        raise ValueError("--max-size must be >= --min-size")

    rng = random.Random(args.seed)
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    counter = 1
    for n in range(args.min_num_pieces, args.max_num_pieces + 1):
        for _ in range(args.repetitions):
            problem_name = f"{args.base_name}-{counter:02}"
            text = generate_problem(
                problem_name=problem_name,
                num_pieces=n,
                min_size=args.min_size,
                max_size=args.max_size,
                size_mode=args.size_mode,
                rng=rng,
            )
            (out_dir / f"p{counter:02}.pddl").write_text(text, encoding="utf-8")
            counter += 1


if __name__ == "__main__":
    main()
