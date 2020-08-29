#include <stdio.h> // for I/O
	

/* operation codes */
// 17 ops
enum op_code = {ADD,SUB,MULT,DIV,PWR,EQ,LT,GT,LD_INT,LD_VAR,STORE,DATA,GOTO,JMP_FALSE
		,READ_INT,WRITE_INT,HALT};

/* instruction structure */
struct instruction{
	enum op_code op;
	int arg;
};

/* stack machine registers initialization */
int pc = 0; // program address register ( the address of the next instruction)
struct  instruction ir; // current instruction register 
int top = 0; // top of stack register 
int ar = 0;

/* memory ? */
struct instruction code[999];
int stack[999];

/* fetch and execute ops, aka interpreter */
void execution_fetch_cycle(){
	do{
		ir = code[pc++]; 
		switch(ir.op){
		case HALT 	:printf("halt \n"); break; 
		case ADD	:stack[top-1] = stack[top-1] + stack[top]; 
				top--;
				break;
		case SUB	:stack[top] = stack[top-1] - stack[top];
				top--;
				break;
		case MULT	:stack[top] = stack[top-1] * stack[top]; 
				top--;
				break;
		case DIV	:stack[top] = stack[top-1] / stack[top];
				top--;
				break;
		case PWR	:stack[top] = stack[top-1] * stack[top];
				top--;	
				break;
		case EQ		:if(stack[top-1] == stack[top]){
					stack[--top] = 1;
				}else{
					stack[--top] = 0;
				} break;
		case LT		:if(stack[top-1] <  stack[top]{
					stack[--top] = 1;
				}else{
					stack[--top] = 0;
				} break;
		case GT		:if(stack[top-1] > stack[top]){
					stack[--top] = 1;
				}else{
					stack[--top] = 0;
				} break;
		case LD_INT	:stack[++top] = ir.arg; break;	
		case LD_VAR	:stack[++top] = stack[ar+ir.arg]; break;
		case DATA	:top = top+ir.arg; break; //(?)
		case GOTO	: pc = ir.arg; break;
		case JMP_FALSE	:if(stack[top--] == 0){
					pc = ir.arg;
				} break;
		case STORE	:stack[ir.arg] = stack[top--]; break;
		case WRITE_INT	:printf("Output : %d \n", stack[top--]); break;
		case READ_INT	:printf("Input : ");
				 scanf("%d", &stack[ar+ir.arg]);
		default		:printf(" Internal Error: Memory Dump\n");
				break;
		}
	}
	while(ir.op != HALT);
}






