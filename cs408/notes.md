# CS408 Notes

Programming Paradigms
---------------------------
* Functional Programming
	+ Applies functions to parameters to accomplish task
	+ Computation is specified by a call to defined functions which are calls to other functions
  - LISP, Scheme, ML
* Imperative Programming
	+ commands, action oriented
	+ sharp distinction between action and data
	+ no/limited support for abstraction
  - Fortran, Algol60, Pascal, Ada, C
* Logic Programming
	+ Predicate logic calculus
	+ axioms (facts) and rules to deduce new facts
  - prolog, prolog++
* Object Oriented Programming
	+ Programming based on the use of classes as objects
  - java, C++, python, ruby

Compilation and Interpretation
---------------------------
1. The language is brought down to the level of machine 
(compilation)
    Source code -> machine code
    Target code run at later time (run time)
2. The machine is brought up to the level of the language 
(interpretation)
    interpreter takes a program and its input at the same time.
    It scans the program, implementing operations as it encounters them and doing I/O as needed .



### COMPILATION
![Diagram](compilation.png)



Language Evaluation Criteria
---------------------------
* Readability
	+ Orthogonality
	+ Non-orthogonality
	+ Regularity
	+ Generality
	+ Uniformity
	+ Nonuniformity
	+ Syntax Considerations
* Writability
	+ Orthogonality
	+ Abstraction
	+ Expressivity
* Reliability
	+ Type Checking
	+ Exception Handling
	+ Aliasing
	+ Readability and Writability
* Portabiltiy
* Generality
* Completeness

| Characteristic           | Readability | Writablity | Reliability |
|--------------------------|-------------|------------|-------------|
| Simplicity/Orthogonality |      x      |      x     |      x      |
| Control Structures       |      x      |      x     |      x      |
| Data type/Structures     |      x      |      x     |      x      |
| Syntax Design            |      x      |      x     |      x      |
| Support for Abstraction  |             |      x     |      x      |
| Expressivity             |             |      x     |      x      |
| Type Checking            |             |            |      x      |
| Exception Handling       |             |            |      x      |
| Restrictive Aliasing     |             |            |      x      |

Syntax and CFG
---------------------------
### What is the syntax of a language?
> the form or structure of the expressions, statements, and program units

### What is the semantics of a language?
> the meaning of the expressions, statements, and program units

###	What are lexemes?
> Small units (words) of a PL used to build up a statement

###	What are tokens?
> The category of its lexeme


### CFG: series of grammar rules (called productions) such that
* Left hand side which is a single structure name, followed by the metasymbol ->, followed by a right hand side 
* Right hand side can be symbols or other structure names
* Name of structures called nonterminals as they can be broken into further structures
* Words and token symbols are called terminals, as they are never broken
* Grammar rules are called productions
* Symbols used | and sometimes parenthesis (<> or () )
* Derivation: generating language sentences through a series of applications of the rules
* Grammar for Simple Integer Arithmetic Expressions
	+ expr -> expr + expr | expr * expr | (expr) | number
	+ number -> number digit | digit  (note recursion here)
	+ digit -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 
* How many terminals, non-terminals and productions in the previous example? 14, 3, 3?

### Parse Trees
### Ambiguous Grammars
### Leftmost Derivation

# Variable: 6 attributes
 * Name
 * Type
 * Address
 * Value    
 * Scope        Spatial
 * Lifetime    Temporal     (how long is the variable bound to the same memory location)


Binding
---------------------------
* Static - bound to memory cells before execution begins and remains bound to the same memory cell throughout execution.
	+ Advantage - history sensitive
	+ Disadvantage - no recursive functions for languages that use only static variable
* Stack-dynamic - Storage bindings are created for variables when their declaration statements are elaborated, which is during run time
	+ Advantage - allows recursion,saves memory/storage
	+ Disadvantage - run-time allocation/deallocation, loss of history sensitivity.
* Heap-dynamic - Allocated and unallocated by explicit directives, specified by the programmer, which take effect during execution
	+ Advantage: flexibility of efficient memory management
	+ Disadvantage: error-prone use of pointers and references
* Implicit heap-dynamic variables: Allocation and deallocation caused by assignment statements
	+ Advantages - help in writing generic code, highly flexible
  - used in purely interpreted languages
	+ Disadvantages - maintaining all dynamic attributes have a high overhead time, loss of error detection.

Row and Column major Addressing
---------------------------
### Row major addressing
```Java 
Location(a[i][j]) = address(a[1][1]) + (i-1)*n*element_size + (j-1)*element_size 
```
### Column major addressing
```Java 
Location(a[i][j]) = address(a[1][1]) + (j-1)*m*element_size + (i-1)*element_size 
```

Pointers and References
---------------------------
A pointer can point to many different objects during its lifetime, a reference can refer to only one object during its lifetime. 

Dangling Pointer

```C++
int *x,  *y  ;
x = new int [1] ;
*x = 1 ;
y = x;
delete [] x ;
cout << *y ;
```

Functional Side Effect
---------------------------
* When a function changes one of its parameter or a global or nonlocal variable
    + Expression such as a + fun(a) : has a side effect if a is changed by the function fun()

```C++
int a = 4;
int fun1() {
a = 17 ;
return 6; }
void fun2() {
a = a + fun1() ;
}
void main() {
fun2();
}
```

What are the values of a in fun2
in both the scenarios in C/C++ 
Java?
10 and 23


Parameter Passing
---------------------------
### PASS BY VALUE
* Most common mechanism of parameter passing
* Default in C++ and Pascal and essentially the only parameter passing mechanism in C and Java.
* Copy of the actual is passed into function
* Downside is that it uses more memory

### PASS BY RESULT
* Implementation of out-mode parameters
* Before the control is handed back to the caller, the formal parameter is passed to the actual parameter.
* Downside: parameter collision

### PASS BY VALUE RESULT
* Combines the actions of the IN and OUT parameters
* Value of actual parameter is used to initialize the corresponding formal parameter
* Same disadvantages as pass by value and pass by result
* Pascal VAR parameters
* Addresses to which to return the values are always calculated on entry of the subprogram

### PASS BY REFERENCE
* Second implementation for in out mode
* Transmits an access path, usually

