def my_decorator(func):
    def wrapper():
        print("Something is happening before the function is called.")
        func()
        print("Something is happening after the function is called.")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()


#--------Timing Decorator — Measure Function Execution Time--------------------------------------

import time
from functools import wraps

def time_it(func):
    """Decorator to measure how long a function takes to execute"""
    @wraps(func)
    def wrapper(*args, **kwargs):
        start_time = time.time()
        print(f"⏳ Starting '{func.__name__}'...")
        
        result = func(*args, **kwargs)  # Execute original function
        
        end_time = time.time()
        duration = end_time - start_time
        print(f"✅ Finished '{func.__name__}' in {duration:.3f} seconds\n")
        
        return result
    return wrapper

# Example usage with a slow function

@time_it
def slow_task():
    time.sleep(2)
    print("Doing something slow...")

# Another example with arguments

@time_it
def add_numbers(a, b):
    time.sleep(1)
    return a + b

# Run them

slow_task()
print(add_numbers(10, 20))