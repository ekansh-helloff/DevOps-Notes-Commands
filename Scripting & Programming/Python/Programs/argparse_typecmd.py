import argparse
def parse_arguments():
    parser = argparse.ArgumentParser(
        description="Process output message argument."
    )
    parser.add_argument(
        "-k", "--output",
        type=str,
        help="Show output message"
    )
    return parser.parse_args()

def main():
    args = parse_arguments()
    if args.output:
        print(f"Output: {args.output}")

if __name__ == "__main__":
    main()

    