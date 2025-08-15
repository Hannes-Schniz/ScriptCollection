# Script Collection

A collection of different script references and functional scripts.

## Bash script references:

Here is a collection of functions and methodes to complete certain tasks like drawing borders around lines of texts or reading from/writing to files.

[Bash resources](./bashFunctCollection.md)


## Kitty

### kitten ssh

I wanted a ssh tool, that would not only open my ssh connection in a new window without blocking my original window from further use. I also wanted to have a history of all the commands, that I execute on the remote machine. 

The wrapper starts the actual script in headless mode, so the original window stays untouched.

The script then creates a log file of all commands executed on the remote machine. 

Example output:

```bash 
example@1.1.1.1's password: 
> ************
example@example:~$ ll
total 120
drwxr-x--- 11 example example  4096 Aug 15 21:23 ./
drwxr-xr-x  3 root  root   4096 Sep 20  2023 ../
-rw-------  1 example example    51 Jan 22  2025 .Xauthority
-rw-------  1 example example 28487 Jun  1 23:18 .bash_history
-rw-r--r--  1 example example   220 Jan  7  2023 .bash_logout
-rw-r--r--  1 example example  3771 Jan  7  2023 .bashrc
drwx------  3 example example  4096 Sep 17  2023 .cache/
drwxrwxr-x  5 example example  4096 Oct  8  2023 .config/
-rw-------  1 example example    20 Dec 22  2024 .lesshst
drwxrwxr-x  3 example example  4096 Sep 17  2023 .local/
-rw-r--r--  1 example example   807 Jan  7  2023 .profile
-rw-rw-r--  1 example example    75 May 31 12:51 .selected_editor
drwx------  2 example example  4096 May 31 12:11 .ssh/
-rw-r--r--  1 example example     0 Sep 17  2023 .sudo_as_admin_successful
drwxrwxr-x  4 example example  4096 Aug 15 21:23 .terminfo/
-rw-------  1 example example 13675 Jun  1 23:15 .viminfo
-rw-rw-r--  1 example example   165 Sep 21  2023 .wget-hsts
drwxr-xr-x  2 root  root   4096 May 31 12:48 data/
drwxrwxr-x  2 example example  4096 Dec  1  2024 downloads/
-rw-r--r--  1 root  root      0 Oct 20  2023 errors
drwx------  3 example example  4096 Sep 17  2023 snap/
example@example:~$ exit
Shared connection to 1.1.1.1 closed.
```
