
--------------------------------------
STACK VIRTUAL MACHINE info
--------------------------------------
- the runtine system(virtual machine) is capable of executing the
code and a data area in which values assigned to variables are accessed
through an offset into the data area.
- the implemented virtual machine consists of	
	- data area ( the association between variables and values)
	- program area (manipulate the data area)

#machine orgnization:- 
	the *S-machine*  consists of two stores
	C > Program store( orgnized as an array Read-only) 
	S > Data Store(orgnized as a stack)
	
	registers:-
	IR > instructions register(contains the instruction which is being interpreted
	T > stack top register (contain the address of the top element of the stack )
	PC > program address register(contains the address of the next instruction of be fetched for interpretation) 
	AR > current activation record register(contains the base address of the activation record of the procedure which is being interpreted) 

	* each location of C is capalbe of holding an instruction
	* each location of S is capalble of holding an addressof an integer
	* each instruction consists of three fields
		- opreration code 
		- two parameters

instruction set :-
	the S-codes are the machine language of the S-machines.
	they occupy four bytes each.
	
	1st byte > operation code(op-code)	
	* there are 9 basics instruction each with diffrent op-code

	2nd byte > contains either 0 or 
					1- lexical level  offset
					2-condition code for the conditional jump offset
	
	last 2 bytes > taken as 16-bit integer form an oprand which is a literal value or 
		1- variable offset from a base in stack( what we currently using (?))
		2- S-code instruction locatoin
		3- operation number 
		4- special routine number 

* data access and storage instructions requires and offset within
the activation record 	

S-machine S-code instructions:-
	1. ADD - Addition
	2. SUB - Subtraction
	3. MULT- Multiplication
	4. DIV- Division
	5. PWR - Power 
	6. EQ - test equality 
	7. LT - test less that  
	8. GT - test greater than
	9. LD_INT - load literal value onto stack  (?) 
	10. LD_VAR - load value of variable at level offset (?)
	11. STORE - store value on top of stack into variable location a	t level offset (?)
	12. DATA - ADD NN to stack pointer (?) 
	13. GOTO - JUMP
	14. JMP_FALSE - JUMP if (?)
	15. READ_INT - read integer from user (?) 
	16. WRITE_INT - write integer as an output (?)
	17. HALT - end program (?) 

Memory;-
	saperated into two segments
	1. code segment ( code array ) 
	2. run-time data, expression stack (stack array)
	
