# Final Exam Topics

## Memory Management

### Memory Management
* Ideal Memory
  + Infinitely Large
  + Infinitely Fast
  + Non-volatile
  + Inexpensive
* No such a memory, most computers has a memory hierarchy
* Memory hierarchy –
  + Small, fast, very expensive registers
	+ Volatile, expensive cache memory
	+ Megabyte medium-speed, medium-speed RAM
	+ Tens or hundreds of gigabits of slow cheap, non-volatile disk storage (Hard Disks)
* Memory management is a part of the operating system which manages the memory hierarchy

### Types
#### Mono-programming without Swapping or Paging
  + There is only memory sharing between a user program and the operating system in this system
  + Only one program could be loaded in the memory.

#### Multiprogramming with Fixed Partition
* Memory is divided into n (possibly unequal size) partitions – can be done manually when the system started.
* Fixed memory partitions with separate
  input queues for each partition
  + When a job arrives, it can be put into the queue
  for the smallest partition that is large enough to
  hold it.
* Fixed memory partitions with a single input
  queue.
  + Whenever a partition becomes free, the closest to the
  queue that fits in it, is chosen and loaded into the empty
  partition and run – wasting memory. Or
  + Search the whole queue to find out a job which is the
  best fit to the free partition. – discriminate against small
  jobs.

### Modeling Multiprogramming
* Simple Unrealistic Model
  + Assumption: all five process never be waiting for I/O at same time.
  + If the average processes use 20% computing
time and 80% use for waiting I/O. With five
processes in the memory at once, the CPU
should be busy 100%


* Probabilistic model
	+  p - a fraction of time a process is waiting for
I/O.
	+  If there are n processes in the memory at
once, the probability that all n processes are
waiting for I/O is pn.
	+  Then, the CPU utilization is given by
	+  CPU utilization = 1 – pn (the probability that
at least one of processes is using CPU)


* Two general approaches for memory management
(depending on the available hardware)
  1. Swapping – bringing in each process in its entirety,
running it for a while, then putting it back on the disk.
  2. Virtual Memory – allows programs to run while partially
loaded in the memory.


### Swapping
Main difference between fixed partition and variable
partition
* Variable partition
	+  The number, location, and size of the partitions vary
dynamically
	+  Need to keep track of partition information dynamically for
memory allocation and de-allocation
	+  Might create multiple holes – Combine them all into one big
hole (memory compaction: expensive cycle)
* Fixed partition
	+  The number, location, and size of the partitions fixed.
	+  OS knows the address of each process.
	+  Simple to manage the memory.

How much memory should be allocated for a
  process when it is created or swapped?
  +  If processes are created with a fixed size – simple
  +  But processes are usually changing their sizes by
  dynamically allocating memory – Dynamic memory
  allocation (heap), recursion
* Allocate extra memory space for each process
* Use adjacent hole for managing the growing size
  +  If there is not enough memory space for a process
  based on the dynamically changing size, the
  process might be swapped out or killed.

### Bitmaps
  Memory is divided up into allocation units
(words ~ k bytes)
*  Corresponding to each allocation unit is a bit
in the bitmap
  + If the unit is free, corresponding bit = 0 and
  + If unit is occupied, corresponding bit = 1.


* Size of the allocation unit is an important
  design issue
  + The smaller the allocation unit, the larger the
  bitmap.
  + The larger the allocation unit, the smaller the
  bitmap – But memory may be wasted in the last
  unit of the process if the process size is not an
  exact multiple of the allocation unit.


* Advantage with Bitmaps
  + Simple way to keep track of memory words in a
  fixed amount of memory since the size of bitmap
  depends only on the size of memory and size of
  the allocation units.
* Disadvantage with Bitmaps
  + To allocate memory for the process with k unit
  size, first, the memory manager needs to search
  the bitmap to find out k consecutive 0 bits in the
  map.


### Free List
* With free-list, maintain a linked list of
allocated and free memory segments.
* Each entry in the list keeps information: hole
or process, starting address, length and a
pointer to the next entry

* If the list of segments is kept sorted by
address value, it is simple to update the
list when a process terminates or is
swapped out from memory.


* Algorithms for allocating memory for a process
(Assume that the list of segments is kept sorted by
address value).
	+ First Fit – The memory manager scans the list of
segments from the beginning until it finds a hole that is big
enough.
	+ Next Fit – It works the same way as first fit. But next time it
is called, it starts searching the list from the place where it
left off last time.
	+ Best Fit – It searches the entire list and takes the smallest
hole that fit for the process.
	+ Worst Fit – It always takes the largest free hole


### Page Replacement
When a page fault occurs, OS needs to do
the following steps:
1. Choose a victim page currently allocated in a
page frame
2. If the page has been modified in the memory,
rewrite it to the disk
3. A page is allocated into the page frame which
was used by the victim page
4. Change page table

The NRU algorithm removes a page at random from
the lowest numbered nonempty class.

#### First In First Out (FIFO)
* Replace the oldest page frame

#### The Least Recently Used
* Replace the page that has not been used for
the longest period of time.

### Belady’s Anomaly
* Intuitively, it might seem that the more page
frames the memory has, the fewer page
faults a program will cause. This is not
always the case – Belady’s Anomaly
* Belady shows the case with FIFO cases; the
more page frames the memory has, the more
page faults a program causes.

### Stack Algorithm
A paging system can be characterized by three
items
1. The reference string of the executing process
2. The page replacement algorithm
3. The number of page frames available in memory


### Page Size
Mathematical Analysis
S: average size of process (byte)
P: the size of page (byte)
E: Each page table entry needs (byte) per page.

S/P - Average number of pages per process
S/P*E - Average page table space for each process
P/2 - wasted memory in average in the last page of the process

### Segmentation
* Segmentation is a logical entity, which the
programmer knows and uses as a logical
entity.
* Segmentation is a memory management
scheme that supports the user’s view of
memory!!
* A logical address space is a collection of segments.
Each segment has a name and a length.
* Each segment might have a different size.
* A segment might contain a procedure, an array, a
stack, or a collection of scalar variables; but usually
it does not contain a mixture of different types
* Normally, the user program is compiled, and the
compiler automatically constructs segments
reflecting the input program.

#### Reason for segmentation with paging
* If the segments are large, then keeping them in the
physical memory might be wasting memory space.
* If a segment’s virtual space is larger than physical
space, it is not even possible to keep them in the
physical memory.
* A solution is the segmentation with paging – each
segment is divided into pages

## File Systems
Three essential requirements for long term
information storage
1. To store a very large amount of information
2. To store information permanently
3. To share the information with multiple
processes

### File Access
* Sequential Access –
	+ read all bytes/records from the beginning
	+ cannot jump around, could rewind or back up
	+ Read operation changes pointer to the next
location for read. (magnetic tape)
* Random Access –
	+ bytes/records read in any order
	+ Seek operation can move the pointer to the
location (disk)

### Directories
To keep track of files, file systems have directories
which themselves are files.
* Single-level directory System – one directory
containing all files
* Two-level directory System – Giving each user a
private directory
* Hierarchical directory System – User can create a
directory to group their files in a logical way

### File System Layout
* When the Computer is Booted
	+ The BIOS reads in and executes the MBR.
	+ MBR (Master Boot Record)
* Sector 0 of the disk
* Used to boot the computer
* locates the active partition
* Read in the first block (boot block) and execute it
* The program in the boot block loads the OS contained
in that partition (active partition)
* The System Layout of a disk partition varies
strongly from file system to file system.
	+ Super block – key parameters about the file
system:
	+ Free space management
	+ Directories

### Implementing Files (Contiguous Allocation)
Two significant advantages with contiguous file
allocation
* Simple implementation because keeping
track of where a file’s blocks are is reduced to
remembering two numbers:
	+ disk address of the first block
	+ the number of blocks in the file
* The read performance is excellent
	+ only one seek is needed to read the entire file.

### Implementing Directories
Searching Directories
* If a directory is designed in a linear way, for
extremely long directory, linear searching can
be slow.
* To speed up the search
	+ Use hash table in each directory
	+ Use cache

## Deadlock

### Condition
A deadlock situation can arise if and only if the
following four conditions hold simultaneously
in a system. (Coffman et al.)
1. Mutual exclusion
2. Hold and wait
3. No preemption
4. Circular wait

Deadlock Detection and Recovery
(Detection with Multiple resources of each type)
We need matrices for deadlock detection algorithm.
* Existing resource matrix – At present, the number of resources
per each type.
* Available resource matrix – At present, the number of resources
per each type available, with some of the resources are assigned
to processes (not available).
* Current allocation matrix – At present, which resources are
currently held by processes
* Request matrix – At present, how many resources are needed
for processes to finish their job.

### A Deadlock detection algorithm
1. All processes start with unmarked.
2. Look for an unmarked process Pi, for which the ith
row of R is less than or equal to A.
3. If such a process is found, add the ith row of C to A,
mark the process and go back to step 1.
4. If no such process exists, the algorithm terminates

### Deadlock Avoidance
* The system must be able to decide whether
granting a resource is safe or not and only
make allocation when it is safe.
* Is there any algorithm that can always avoid
deadlock by making the right choice all the
time?
	+ Yes, when certain information is available in
advance.
* A state is said to be a safe state
	+ If it is not deadlocked and
	+ there is some scheduling order in which every
process can run to completion even if all of them
suddenly request their maximum number of
resources immediately.

### The algorithm for checking if a state is safe or not
1. Look for a row of vector R, whose unmet resource needs
are all smaller than or equal to A. If no such row exists,
the system might have a deadlock later as some
processes might never run to completion.
2. Assume the process (of the row) requests all the
resources it needs and finishes. Mark that process as
terminated and add all its resources to the A vector.
3. Repeat step 1 and 2 until either all processes are
terminated (safe state) or until a deadlock occurs
(unsafe).

### Deadlock Prevention
* Actually, deadlock avoidance is essentially
impossible, since it requires information
about future requests which is not known.
* Deadlock prevention is a method to attack
one of four deadlock condition.
1. Mutual exclusion
2. Hold and wait
3. No preemption
4. Circular wait

#### Attacking Mutual Exclusion
* The mutual-exclusion condition must hold for
non-preemptive resources such as printer,
CD writer.
* But preemptive resources do not require
mutual exclusion such as read only file.

#### Attacking the hold and wait
##### Approach 1
* Each process requests all resources before
starting execution.
* If everything is available, all resources
(requested by the process) are located and
finish its job.
* If some resources are not available, no
resources are allocated to the process.
###### Problem with Approach 1
* Many processes do not know how many resources
they will need before start execution.
##### Approach 2
* Allows a process to request resources only when
the process has none.
* To get a new resource, first, release all the
resources currently holds and request all at time
same time.
###### Disadvantage with Approach 2
* Starvation is possible

#### Attacking No Preemption
##### Approach 1
* If a process holding some resources requests
another resources that cannot be immediately
allocated it, then all resources currently being hold
are preempted.
* Preempted resources are intentionally released and
enter the available resources list.
* The process will be restarted only when it can regain
its old resources as well as the new ones that it is
requesting
##### Approach 2
* If a process requests some resources, first checks whether they
are available or not
* If they are, allocate them to the process.
* If they are not available, check whether they are allocated to
some other process that is waiting for additional resources.
* If so, preempt the desired resources from the waiting process
and allocate them to the requesting process.
* If the resources are not either available or held by waiting
process, the requesting process must wait.

#### Attacking the Circular Wait Condition)
##### Approach 1
* A process can hold only one resource.
* If a process needs another resource, the process
needs to release the first one.
* But sometimes this approach is not acceptable
##### Approach 2
* Global number is provided to each resource
* A process can request resources whenever they
want, but all requests must made in numerical order.
