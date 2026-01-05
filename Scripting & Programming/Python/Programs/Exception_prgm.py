def new_func1():
    try:
            denominator = 0
            result = 10 / denominator
    except ZeroDivisionError:
        print("Division by zero is not allowed.")
    else:
        print("Division successful:", result)
        print("Execution completed.")
    finally:
        print("Execution completed.")

new_func1()