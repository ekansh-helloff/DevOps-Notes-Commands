import sys

print("Total arguments:", len(sys.argv))
print("Script name:", sys.argv[0])
if len(sys.argv) > 1:
    print("Arguments:", sys.argv[1:])
    total = 0
    for arg in sys.argv[1:]:
        try:
            total += int(arg)
        except ValueError:
            print(f"Warning: '{arg}' is not a valid integer and will be skipped.")
    print("Sum =", total)
else:
    print("No arguments provided.")


print("Sum =", total)


# The simplest way to access command line arguments in Python is through the sys module.
#  It provides a list called sys.argv that stores everything you type after python in the command line.

# sys.argv: A list in Python that contains all the command-line arguments.
# sys.argv[0]: Always holds the name of the script being executed (e.g., add.py).
# sys.argv[1:]: Holds the actual arguments you pass (e.g., numbers like 10 20, file names, or other inputs).