**1. What is Kernel?**


The kernel is a computer program that is the core of a computer's operating system, with complete control over everything in the system. It manages the following resources of the Linux system:



File management

Process management

I/O management

Memory management

Device management etc.

Complete Linux system = Kernel + GNU system utilities and libraries + other management scripts + installation scripts.



It's a computer program that forms the innermost component of an OS after the Shell.  As soon as the shell converts the user's command into kernel-understandable form, the kernel is responsible for executing the commands with the help of its 2 components which are OS libraries and Device Drivers interacting with Application software and device hardware respectively. Following is an example of a C-program execution flow through the OS till the hardware:



Application Software: A C-program is written that takes input from the keyboard

Operating System:	Shell: The command to execute the program is given by the end-user

Kernel: takes the interpreted command from the shell	OS Libraries: read() function which is invoked due to scanf() call.

Keyboard Device driver: is invoked

Hardware: The user types the input on the keyboard





**2. What is Shell?**



A shell is a special user program that provides an interface for the user to use operating system services. Shell accepts human-readable commands from users and converts them into something which the kernel can understand. It is a command language interpreter that executes commands read from input devices such as keyboards or from files. The shell gets started when the user logs in or starts the terminal.





https://media.geeksforgeeks.org/wp-content/uploads/18834419\_1198504446945937\_35839918\_n-300x291.png



Shell is broadly classified into two categories –



* Command Line Shell
* Graphical shell



**Command Line Shell**

Shell can be accessed by users using a command line interface. A special program called Terminal in Linux/macOS, or Command Prompt in Windows OS is provided to type in the human-readable commands such as "cat", "ls" etc. and then it is being executed. The result is then displayed on the terminal to the user.

Working with a command line shell is a bit difficult for beginners because it’s hard to memorize so many commands. It is very powerful; it allows users to store commands in a file and execute them together. This way any repetitive task can be easily automated. These files are usually called batch files in Windows and Shell Scripts in Linux/macOS systems.



**Graphical Shells**



Graphical shells provide means for manipulating programs based on the graphical user interface (GUI), by allowing for operations such as opening, closing, moving, and resizing windows, as well as switching focus between windows. Window OS or Ubuntu OS can be considered as a good example which provides GUI to the user for interacting with the program.



What is a terminal?

A program which is responsible for providing an interface to a user so that he/she can access the shell. It basically allows users to enter commands and see the output of those commands in a text-based interface. Large scripts that are written to automate and perform complex tasks are executed in the terminal.



What is Shell Script?

A shell script is a file containing a series of commands for the shell to execute. The shell itself is a command-line interpreter (CLI), while a shell script is a saved list of instructions (usually with .sh extension) like myscript.sh



1\. Automate Repetitive Tasks

Shell scripts turn routine jobs like file cleanup, backups, or server updates into one-click actions, saving time and reducing manual effort



2\. Reliable and Consistent

Shell scripts run the exact same steps every time, without mistakes. Once you write and test a script, you can count on it to perform tasks consistently whether it's setting up servers, cleaning up files, or running a deployment. This removes human error and ensures predictable results.



3\. Native Support on Unix/Linux Systems

Shell scripting is natively supported on Unix-based systems, requiring no additional installations. The shell environment (like Bash or Zsh) is pre-installed, allowing scripts to run seamlessly across most Linux distributions and Unix-like operating systems.



4\. Great for Linking Commands to Work Together

Shell scripts make it easy to link different commands together. You can pass the output of one command into another, filter data, or run tasks step by step all in one script. This helps automate complex jobs using simple building blocks.



5\. Ideal for IT, DevOps \& Monitoring

Shell scripts help automate important tasks like checking system health, setting up servers, and scheduling jobs to run at specific times (using tools like cron). In DevOps, they are widely used to speed up deployments and manage infrastructure without doing everything manually.



6\. Lightweight and Easy to Write

They are interpreted, so there is no compile step. You can write a useful script in minutes, and test it instantly perfect for quick fixes and small tasks.



=========================================================================================================================================================================================



Though, if we execute another shell script from a shell script, then local and global variables will be ignored by the new shell. Thus, if we want to make variables truly global, then we have to use the export command. Let's understand this concept using an example -



**Shell script:**



gfg\_1.sh



\#!/bin/sh

NUM=9

echo "gfg\_1 : The value is $NUM"

export NUM

./gfg\_2.sh

gfg\_2.sh



\#!/bin/sh

echo "gfg\_2 : The value is $NUM"



----------------------------------------------------------



Some useful shell variables are -



Variable Name --	Description	 -- Usage

BASH\_VERSION --Holds the version of this instance of bash -- echo $BASH\_VERSION

HOME -- Provides a home directory of the current user -- echo $HOME

HOSTNAME -- Provides computer name -- echo $HOSTNAME

USERNAME	-- Provides username -- echo $USERNAME

-------------------------------------------------------------------------------------

There are two types of variables present within Bash Scripting. Conventionally, If a variable, is declared inside a function then it is generally a local variable and if it is declared outside then it is a global variable. In the case of a bash script, this concept is a little bit different, here any variable whether it is written inside a function or outside a function by default is a global variable. If we want to make a local variable then we need to use the keyword "local".


============================================================



System defined variables  
These are predefined variables or the variables which are created and maintained by Linux bash shell. These variables are loaded when you open a new bash session. These variables are used to define system properties. They are defined in capital letters.  Let's now see some of the system-defined variables:

BASH_VERSION
BASH
PWD
OSTYPE
HOME
LANG
HOSTNAME
PATH
COLUMNS
USER

BASH_VERSION: Displays the name of your current bash version.
BASH: Displays the shell name.
PWD: It stands for “Present working directory”. It displays the path to your present working directory.
OSTYPE: Simply displays the name of the operating system.
HOME: Displays the home directory of the current user.
LANG: Displays the language of the Linux system. Example: LANG: en_IN
HOSTNAME: Displays the name of the host. Example: kali
PATH: It displays an ordered list of paths (separated by colons). Example:
COLUMNS: Displays the length of the column used to show output on the terminal.
USER: Displays the current user. Example: root

=================================================================

Special variable	Result stored
$$	It represents the process ID of the current shell of the user. Example: 1692
$?	It returns the exit status of the last executed command. Example: 127--> This is the exit status if the command was not found.
$0	It represents the script name.
$1-$9	$1 to $9 represents the 1st to 9th argument passed with the script.
${10}-${n}	It represents the 10th argument to the nth argument passed with the script.
$#	It represents the length of any value or the number of arguments passed to the given script.
$@ or $*	It represents the list of all arguments that are passed to the script
=======================================

Syntax to get the length of the array:

{#arrayName[@]}

#!/bin/bash
fruits=("apple" "banana" "cherry" "date")
for fruit in "${fruits[@]}"; do
echo "Current fruit: $fruit"
done


Syntax to get a particular array element:

{arrayName[index]}

Syntax to get the length of a particular array element:

{#arrayName[index]}

============================================================================

Table of difference between bash script and shell script

Sr. No.	Bash Script	Shell Script
01	The bash script is a script that is specifically created for Bash.   //	The shell script is a script that can be executed in any shell, depending on the shebang and compatibility.
02	Bash scripting is a subset of shell scripting.  //	Shell scripting is a method to automate tasks as a collection of shell commands.
03	The bash script is one form of shell script.	//  Shells may be one of Korn, C shell, Bourne, Bash, etc.
04	Bash is an acronym for Bourne Again SHell and was developed by Brian Fox.	//  The original Unix Shell (sh) was developed by Stephen Bourne.
05	Bash has more features as compared to traditional sh.	//   The original Bourne Shell has fewer features compared to Bash.
06	We can use shebang, “#!/bin/bash” if we want to use Bash.	//        We can use shebang, “#!/bin/sh” if we want to use the default system shell or Bourne shell.
07	Bash is more programmer-friendly as compared to traditional sh.	//      Traditional sh is less programmer-friendly as compared to Bash.

========================================================

Table:

User Type	Permissions	Binary	Value
Owner	    rwx	        111	       7
Group	    rw-	        110	       6
Others	    rw-     	110	       6

E.g -- chmod 766 file.sh
          **421**
rwx	        111	       7
rw-	        110	       6
r-x         101        5
r--     	110	       4
-wx         011        3
-w-         010        2
--x         001        1

------------------------------------

Examples of Using the Symbolic mode:

Read, write and execute permissions to the file owner:
chmod u+rwx [file_name]

Remove write permission for the group and others:
chmod go-w [file_name]

Read and write for Owner, and Read-only for the group and other:
chmod u+rw,go+r [file_name]

if [ -e "$file" ]; then: This line starts an if statement. The condition [ -e "$file" ] checks if the file specified by the value of the file variable exists. The -e flag is used to check for file existence.

Example:1 ##

#!/bin/bash

echo "Enter the word to search for:"
read target_word
echo "Enter the filename:"
read filename
count=$(grep -o -w "$target_word" "$filename" | wc -l)
echo "The word '$target_word' appears $count times in '$filename'. "


Standard Output (stdout): This is the default output stream where a command's regular output goes. It's displayed on the terminal by default. You can redirect it to a file using >.
Standard Error (stderr): This is the output stream for error messages and warnings. It's displayed on the terminal by default as well

-->    cleanup() { ... }: This defines a function named cleanup. Inside this function, you can include any actions that need to be performed when the script is interrupted, such as closing files, releasing resources, or performing other cleanup tasks.

--->  trap cleanup SIGINT: The trap command is used to set up a signal handler. In this case, it specifies that when the SIGINT signal (Ctrl+C) is received, the cleanup function should be executed.

Example:2##

#!/bin/bash
input_file="input.txt"
output_file="output.txt"
sort "$input_file" | uniq > "$output_file"
echo "Duplicate lines removed successfully."

The script uses the sort command to sort the lines in the input file. Sorting the lines ensures that duplicate lines are grouped together.
The sorted lines are then passed through the uniq command, which removes consecutive duplicate lines. The output of this process is redirected to the output file.
After the duplicates are removed, the script prints a success message.

Example:3 ##

#!/bin/bash
# Function to generate a random password
generate_password() {
tr -dc 'A-Za-z0-9!@#$%^&*()_+{}[]' < /dev/urandom | fold -w 12 | head -n 1
}

# Call the function and store the generated password
password=$(generate_password)
echo "Generated password: $password"

tr -dc 'A-Za-z0-9!@#$%^&*()_+{}[]' < /dev/urandom uses the tr command to delete (-d) characters not in the specified set of characters (A-Za-z0-9!@#$%^&*()_+{}[]) from the random data provided by /dev/urandom.
fold -w 12 breaks the filtered random data into lines of width 12 characters each.
head -n 1 selects the first line, effectively giving us a random sequence of characters of length 12.


Example:4 ##

#!/bin/bash
num1=10
num2=5

#Arithmetic Expansion ($((...)))

result=$((num1 + num2))
echo "Sum: $result"

#Using expr Command

sum=$(expr $num1 + $num2)
echo "Sum: $sum"

#Using let Command

let "sum = num1 + num2"
echo "Sum: $sum"

==================

Example:5 ##

#!/bin/bash
directory="$1"
if [ -z "$directory" ]; then
echo "Usage: $0 <directory>"
exit 1
fi

if [ ! -d "$directory" ]; then
echo "Error: '$directory' is not a valid directory."
exit 1
fi

cd "$directory" || exit 1
for file in *; do
if [ -f "$file" ]; then
newname=$(echo "$file" | tr 'A-Z' 'a-z')
[ "$file" != "$newname" ] && mv "$file" "$newname"
fi
done

directory="$1": This line assigns the first command-line argument to the variable directory.
if [ -z "$directory" ]; then: This line checks if the directory variable is empty (no argument provided when running the script).
echo "Usage: $0 <directory>": If the directory is empty, this line prints a usage message with the script's name ($0).
exit 1: This line exits the script with an exit code of 1, indicating an error occurred.
fi: This marks the end of the first if statement.
if [ ! -d "$directory" ]; then: This line checks if the specified directory does not exist (-d tests for a directory).
echo "Error: '$directory' is not a valid directory.": If the specified directory doesn't exist, this line prints an error message.
exit 1: Exits the script with an exit code of 1.
fi: Marks the end of the second if statement.
cd "$directory" || exit 1: Changes the current working directory to the specified directory. If the directory change fails (e.g., non-existent directory), the script exits with an error code.
for file in *; do: Ifor file in *; do:nitiates a loop that iterates over all items in the current directory (* matches all filenames).
if [ -f "$file" ]; then: Checks if the current loop iteration item is a regular file (-f tests for a regular file).
newname=$(echo "$file" | tr 'A-Z' 'a-z'): Converts the current filename ($file) to lowercase using the tr command and stores the result in the newname variable.
[ "$file" != "$newname" ] && mv "$file" "$newname": Compares the original filename with the new lowercase filename. If they are different, it renames the file using the mv command.
fi: Marks the end of the inner if statement.
done: Marks the end of the loop.

===========

Example: 6 ##

#!/bin/bash
directory="/path/to/your/directory"
total_size=$(du -csh "$directory" | grep total | awk '{print $1}')
echo "Total size of files in $directory: $total_size"