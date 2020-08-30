/* data segment */
int  data_offset = 0;/* initial offset */
int data_location() {return data_offset++;}/* reserves a data location*/

/* code segment */
int code_offset = 0;/* intial offset */ 

int reserve_loc(){ /* reserves a code location */
return code_offset++;
}
int gen_label(){ /* return current offset */
return code_offset;
}

void gen_code(enum code_ops operation, int arg){/* generates code at current location */ 
code[code_offset].op = operation;
code[code_offset++].arg = arg; 
}
/* generated code at a reserved location */
void back_patch(int addr, enum code_ops operation, int arg){
code[addr].op = operation;
code[addr].arg = arg; 
}

/* print Code to stdio */
void print_code(){
	int i = 0; 

	while(i < code_offset){
		printf("%3ld: %-10s%4ld\n", i,op_name[(int) code[i].op], code[i].arg);
	i++;
	}
}

