1  sudo apt-get update

2  sudo apt-get install python3-pip -y

or 

curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py

sudo python3 get-pip.py

3  pip3 --version



/root# is the most powerful account on a Linux system. It Has full control-> can install software, change permissions, delete any file,

&nbsp;change system configs-> means NO restrictions.



/sudo -> User$ A normal user (e.g. john, Thomas) who has been granted special permission to run commands as root, only when needed.

use sudo before a command to run it as root, Like -> sudo apt update - sudo systemctl restart nginx etc.. Finally -> sudo usermod -aG sudo username.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



The less command can also be used in conjunction with other commands through pipelines. This allows us to view the output of a command directly in the less pager.



Checking a small file

less -F /home/Mandeep/test/first.erl



dmesg | less

less \[options] filename



Searching for a pattern

dmesg | less -p "fail"



Displaying line number

dmesg | less -N



\##

less /etc/passwd



The /etc/passwd file is the core database for all local users on a Linux system. Each entry contains 7 colon-separated fields:



Username (e.g., anshu)

Password placeholder (x indicates encrypted passwords are stored in /etc/shadow).

User ID (UID) – Unique identifier (e.g., 1000 for regular users, 0 for root).

Group ID (GID) – Primary group identifier.

GECOS – Optional user description (e.g., full name).

Home directory (e.g., /home/anshu).

Login shell (e.g., /bin/bash).



\##



getent passwd



Lists all users, including those from external directories.

Essential for debugging authentication issues in networked environments.



\##



compgen -u : compgen command also displays the name of all the users without any additional information.



compgen -c : command to list all commands available if he/she is not the admin on a Linux system and don't have the sudo access.



who:  command will print the info of the currently logged in user.





\## 



word counts

wc state.txt



5  7 58 state.txt



Displays the number of lines in a file.

Command:

$ wc -l state.txt



Count the Number of Words using `wc -w`



This option prints the number of words present in a file. With this option wc command displays two-columnar output, 1st column shows number of words present in a file and 2nd is the file name.

Command:

$ wc -w state.txt





Using -m option 'wc' command displays count of characters from a file.

Command:

$ wc -m state.txt

&nbsp;		



&nbsp;			AWK Command





1\. The -F option sets a custom field separator.

By default, fields are separated by spaces, but we can change this using -F.

Example: Use Space (default separator)



awk -F' ' '{print $1, $4}' employee.txt





2\. You can write your AWK code in a file and execute it with -f.



Example: Create a script file named print\_salary.awk:



{ print $1, "has salary", $4 }

file

Run it using:

awk -f print\_salary.awk employee.txt





3\. The -v option lets you define variables before AWK begins processing.



Example 1: Define a Custom Message

awk -v msg="Employee Details:" 'BEGIN {print msg}'



Example 2: Use Variable in Condition

awk -v limit=40000 '$4 > limit {print $1, $4}' employee.txt





&nbsp;			  AWK Examples



1\. It is used to find and print every line in the employee.txt file that contains the word "manager."



$ awk '/manager/ {print}' employee.txt 



2\. It is used to add line numbers to each line of the employee.txt file and then print the numbered lines to the standard output (your terminal).



$ awk '{print NR,$0}' employee.txt 



3\. In the above example $1 represents Name and $NF represents Salary. We can get the Salary using $NF , where $NF represents last field. 



$ awk '{print $1,$NF}' employee.txt



4\. It is used to print specific lines (from line 3 to line 6, inclusive) of a file named employee.txt, along with their corresponding line numbers.



$ awk 'NR==3, NR==6 {print NR,$0}' employee.txt



5.It is used to read a file line by line, prefix each line with its line number, and then print only the line number followed by the first word of that line.



$ awk '{print NR "- " $1 }' geeksforgeeks.txt 



6\. To print any non empty line if present, 



$ awk 'NF < 0' geeksforgeeks.txt



7\. It is used to find and print the length of the longest line in the file named geeksforgeeks.txt.



$ awk '{ if (length($0) > max) max = length($0) } END { print max }' geeksforgeeks.txt



8\. It is used to count and print the total number of lines in a file.



$ awk 'END { print NR }' geeksforgeeks.txt 



9\. It is used to filter and print only those lines from geeksforgeeks.txt that have more than 10 characters.



$ awk 'length($0) > 10' geeksforgeeks.txt 



10\. It is used to find and print every line from the file geeksforgeeks.txt where the third piece of data (or column) in that line is exactly "B6".



$ awk '{ if($3 == "B6") print $0;}' geeksforgeeks.txt



11\. This command is used to generate and print the squares of numbers from 1 to 6.



$ awk 'BEGIN { for(i=1;i<=6;i++) print "square of", i, "is",i\*i; }' 



**|==================================================================================================================================|**



1\. top 

2\. htop

3\. ps

4\. pstree

5.netstat -tuln

6\. ping

7.df -h

8\. du -sh home

9\. du -sh \*

9\. free -h

10\. journalctl -u ngnix

11\. netstat

12\. lsof -i :8085

13\. head -n 10 /var/log/auth.log

14\. tail -n 10 /var/log/auth.log

15\. ps -ef  -- In this we it doesn't show the memory utilisation 

16\. ps aux  -- In this we it doesn't show the memory utilisation

kill

kill -9 PID  ---- Means forcefully killing processes

kill -STOP --- 

kill -CONT ---

lsblk



