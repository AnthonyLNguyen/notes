# CS408 Notes
<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [CS408 Notes](#cs408-notes)
	- [Programming Paradigms](#programming-paradigms)
	- [Compilation and Interpretation](#compilation-and-interpretation)
		- [Compilation](#compilation)
	- [Language Evaluation Criteria](#language-evaluation-criteria)
	- [Syntax and CFG](#syntax-and-cfg)
		- [Syntax](#syntax)
			- [What is the syntax of a language?](#what-is-the-syntax-of-a-language)
			- [What is the semantics of a language?](#what-is-the-semantics-of-a-language)
			- [What are lexemes?](#what-are-lexemes)
			- [What are tokens?](#what-are-tokens)
		- [CFG: series of grammar rules (called productions) such that](#cfg-series-of-grammar-rules-called-productions-such-that)
		- [Parse Trees](#parse-trees)
		- [Ambiguous Grammars](#ambiguous-grammars)
		- [Leftmost Derivation](#leftmost-derivation)
	- [Variable - 6 attributes](#variable-6-attributes)
	- [Binding](#binding)
	- [Row and Column major Addressing](#row-and-column-major-addressing)
		- [Row major addressing](#row-major-addressing)
		- [Column major addressing](#column-major-addressing)
	- [Pointers and References](#pointers-and-references)
	- [Functional Side Effect](#functional-side-effect)
	- [Subprograms](#subprograms)
		- [Subprograms](#subprograms)
			- [What are subprograms?](#what-are-subprograms)
			- [Parameter Passing](#parameter-passing)
				- [Pass by Value](#pass-by-value)
				- [Pass by Result](#pass-by-result)
				- [Pass by Value Result](#pass-by-value-result)
				- [Pass by Reference](#pass-by-reference)
			- [Overloaded Subprograms](#overloaded-subprograms)
			- [Activation Record](#activation-record)

<!-- /TOC -->
---------------------------
## Programming Paradigms
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

---------------------------
## Compilation and Interpretation
1. The language is brought down to the level of machine
(compilation)
    + Source code -> machine code
    + Target code run at later time (run time)
2. The machine is brought up to the level of the language
(interpretation)
    + interpreter takes a program and its input at the same time.
    + It scans the program, implementing operations as it encounters them and doing I/O as needed.

### Compilation
![Compilation Diagram](compilation.png)


---------------------------
## Language Evaluation Criteria
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
* Portability
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





---------------------------
## Syntax and CFG
### Syntax
#### What is the syntax of a language?
* the form or structure of the expressions, statements, and program units

#### What is the semantics of a language?
* the meaning of the expressions, statements, and program units

####	What are lexemes?
* Small units (words) of a PL used to build up a statement

####	What are tokens?
* The category of its lexeme

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




---------------------------
## Variable - 6 attributes
 * Name
 * Type
 * Address
 * Value    
 * Scope        Spatial
 * Lifetime    Temporal     (how long is the variable bound to the same memory location)




---------------------------
## Binding
* Static - bound to memory cells before execution begins and remains bound to the same memory cell throughout execution.
	+ Advantage - history sensitive
	+ Disadvantage - no recursive functions for languages that use only static variable
* Stack-dynamic - Storage bindings are created for variables when their declaration statements are elaborated, which is during run time
	+ Advantage - allows recursion, saves memory/storage
	+ Disadvantage - run-time allocation/deallocation, loss of history sensitivity.
* Heap-dynamic - Allocated and unallocated by explicit directives, specified by the programmer, which take effect during execution
	+ Advantage: flexibility of efficient memory management
	+ Disadvantage: error-prone use of pointers and references
* Implicit heap-dynamic variables: Allocation and deallocation caused by assignment statements
	+ Advantages - help in writing generic code, highly flexible
  - used in purely interpreted languages
	+ Disadvantages - maintaining all dynamic attributes have a high overhead time, loss of error detection.




---------------------------
## Row and Column major Addressing
### Row major addressing
```Java
Location(a[i][j]) = address(a[1][1]) + (i-1)*n*element_size + (j-1)*element_size
```
### Column major addressing
```Java
Location(a[i][j]) = address(a[1][1]) + (j-1)*m*element_size + (i-1)*element_size
```




---------------------------
## Pointers and References
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




---------------------------
## Functional Side Effect
* When a function changes one of its parameter or a global or nonlocal variable
    + Expression such as `a + fun(a)`  has a side effect if a is changed by the function `fun()`

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
Java?10 and 23





---------------------------
## Subprograms
### Subprograms
#### What are subprograms?
* Definition
    + A description of the actions of the subprogram abstraction
* Subprogram call
    + an explicit request that the subprogram be executed
* Subprogram header
    + The first line of the definition, including the name, the kind of subprogram and the formal parameters.

* Why are parameters called formal parameters?
    + Arguments != parameters
        - Arguments are informal parameters, their values are being sent into the subprogram.
        - parameters are formal parameters, no value (like your egress) Placeholder for you are code.

* The parameter profile of a subprogram is the number, order, and type of its parameters
* the protocol of a subprogram is its parameter profile plus something else RETURN TYPE

#### Parameter Passing
##### Pass by Value
* Most common mechanism of parameter passing
* Default in C++ and Pascal and essentially the only parameter passing mechanism in C and Java.
* Copy of the actual is passed into function
* Downside is that it uses more memory

##### Pass by Result
* Implementation of out-mode parameters
* Before the control is handed back to the caller, the formal parameter is passed to the actual parameter.
* Downside: parameter collision

##### Pass by Value Result
* Combines the actions of the IN and OUT parameters
* Value of actual parameter is used to initialize the corresponding formal parameter
* Same disadvantages as pass by value and pass by result
* Pascal VAR parameters
* Addresses to which to return the values are always calculated on entry of the subprogram

##### Pass by Reference
* Second implementation for in out mode
* Transmits an access path, usually

#### Overloaded Subprograms
* Subprograms with same name and referencing environment but different in number, order, or type of parameters
    + Also called polymorphism (static and dynamic)
        - static - operator overloading. The body must know at compile time. Binding the meaning of the function or operator to the body of statements at compile time
* Mixing call by value and call by reference in the exact same parameter list is also invalid


#### Activation Record
* The only ARI's you see are of active subprograms
    + Active subprograms are ones that have begun execution, but hasn't finished it
    + once finished ARI is removed from the stack
* Drawing Runtime Stack
    + Look at which subprogram you are in, what are the currently active ones, draw stack in order they were called

* Dynamic Link Pointer Use (in statically scoped languages):
    + To tear down the ARI stack on subprogram completion

* A static chain is a chain of static links that connects certain activation record instances.

* Every local variable has a chain offset of 0

* However many static links you follow in the ARI to get to the place where the variable is declared is the offset
    + Local offset - count from bottom of subs ARI to the location below the one with the var in it
