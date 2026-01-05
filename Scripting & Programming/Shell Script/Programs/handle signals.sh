#!/bin/bash
cleanup() {
echo "Script interrupted. Performing cleanup..."
# Add your cleanup actions here
exit 1
}
# Set up a trap to call the cleanup function when Ctrl+C (SIGINT) is received
trap cleanup SIGINT
# Rest of your script
echo "Running..."
sleep 10
echo "Finished."


Handling signals is important for making scripts robust and ensuring that they handle unexpected interruptions gracefully. You can customize the cleanup function to match your specific needs, like closing files, stopping processes, or logging information before the script exits.

Explanation:

#!/bin/bash: This shebang line specifies the interpreter to be used for running the script.

# 1. cleanup() { ... }: This defines a function named cleanup. Inside this function, you can include any actions that need to be performed when the script is interrupted, such as closing files, releasing resources, or performing other cleanup tasks.
# 2. trap cleanup SIGINT: The trap command is used to set up a signal handler. In this case, it specifies that when the SIGINT signal (Ctrl+C) is received, the cleanup function should be executed.
# 3. echo "Running...", sleep 10, echo "Finished.": These are just sample commands to simulate the execution of a script.