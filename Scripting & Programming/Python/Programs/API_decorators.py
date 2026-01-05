import time
import requests
from functools import wraps

def retry(max_attempts=3, delay=2, backoff=2):
     """
     Retry decorator for network/API calls.
     - max_attempts: how many times to retry
     - delay: initial delay between retries
     - backoff: multiplier for exponential increase
     """
     def decorator(func):
         @wraps(func)
         def wrapper(*args, **kwargs):
             attempt = 1
             current_delay = delay
             print(f"▶️ Starting function: {func.__name__} \n")
             while attempt <= max_attempts:
                 try:
                     print(f"Attempt {attempt}/{max_attempts} for {func.__name__}()...")
                     result = func(*args, **kwargs)
                     if result.status_code == 200:
                         print("✅ Success!")
                         print(f"\n")
                         return result
                     else:
                         print(f"⚠️ Received status {result.status_code}, retrying...")
                 except requests.exceptions.RequestException as e:
                     print(f"❌ Error: {e}, retrying...")
                 time.sleep(current_delay)
                 attempt += 1
                 current_delay *= backoff  # Exponential increase
             print("🚨 All retries failed.")
             return None
         return wrapper
     return decorator


@retry()
def get_GitHub_status():
     """Simulate GitHub API call"""

     response = requests.request("GET","https://dev.azure.com")
     print(f"Status code is: {response.status_code}")
     return response

@retry()
def get_DevAzure_status():
    
     response = requests.get("https://dev.azure.com")
     print(f"Status code is: {response.status_code}")
     return response

get_GitHub_status()
get_DevAzure_status()

""""
Interview Note: “In my automation framework, I implemented a custom @retry decorator to handle unstable APIs like Jenkins and GitHub.
It retries failed requests with exponential backoff, logs each attempt, and avoids code duplication across multiple scripts.
This improved our reliability for CI/CD pipeline integrations by 30%.”

A decorator in Python is a higher-order function that takes another function as input, adds extra behavior before or after it runs, and returns a new function.
The @wraps decorator preserves the original function’s metadata, while *args and **kwargs make it flexible enough to decorate any function signature.”

“I use timing decorators in my DevOps automation to measure how long each pipeline step or API call takes.
It helps identify slow areas like package installation or API rate limits.
Since it’s a decorator, I can apply it to any function without changing its logic.”
"""