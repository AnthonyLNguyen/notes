# CS431 Notes

Processing and Threads
----------------------

### The Processes
* Multiprogramming
    + Several jobs are loaded in memory
    + illusion of parallelism - *Pseudo parallelism*
* CPU switches from one process to another based on chosen scheduling algorithm and process state

### The Process Model
#### Two different points of view. 
* Real Model - multiprogramming (rapidly switching back and forth) 
* Conceptual Model - each process has its own virtual CPU, PC, registers, stack pointer

* With the CPU switching back and forth among the processes, its computation time will not be uniform. 
* The computation time is also based on the process type - I/O bounded, CPU bounded.

### Process Creation
* <b style="color: red;">System initialization<b>- when an OS is booted, typically <u>several processes</u> are created.
    + Foreground processes
    + Background processes (daemons)
* __Execution of a process creation system call by a running process__- a running process issues system calls to create one or more new processes.
* __A user creates a new process__- in interactive systems, users can start a program by typing a command or (double) clicking an icon.
* __Initiation of a batch job__- mainframe computer
