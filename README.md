# NOX
![nox logo](https://imgur.com/fbVBC0k.png)
> programming language written in C .



lately i have become intersted in  the history of computing and it's relation to mathmatics so i decided to learn both. by creating Nox.
nox is a programming language written in C, using tools like bison&flex, and has it's own Virtual stack machine.
the end goal of NOX is to support linear optimization problems.

*(😅im learning as i go, so if there is any misinformation please contact me/pull request, thanks!)*
## Build Nox

#### Linux:

 ### install [bison](https://www.gnu.org/software/bison/) & [flex](https://github.com/westes/flex/) & [gcc](https://gcc.gnu.org/) .( you probaly have them installed 😉)
```sh
$ sudo apt-get install bison flex gcc
```
### clone this repository & build
```sh
$ git clone https://github.com/abdullahMosibah/NOX.git
$ cd NOX
$ bison -dv NoxBison.y
$ gcc -c NoxBison.tab.c
$ flex NoxLex.l
$ gcc -c lex.yy.c
$ gcc -o nox lex.yy.o NoxBison.tab.o -lm
```

Now you can run NOX interpreter and start coding 

```c
./nox
```

Or pass in .nox file to the compiler
```c
./nox file_name.nox
```
 
## NOX syntax

NOX program consists of 2 segments.

declarations : where you declare your variables.
commands     : where you write commands like if, while etc.
```c
let
    declarations
in
    commands
end
```
note: in the delarations section you don't need ' ; ' but you do need ' . ' after each line.


### commands & keywords.
|keywords| usage|
|--|--|
|read | read x;| 
|write |write x;  |
|integer |integer x,n. |
|while ,do , end|  while x > 1 do skip; end; |
|if,then,fi | if x > 1 then x := 4; fi;
|if,then,else,fi| if x > 1 then x:=4; else x := 111;fi;|
|skip| skips commands after if,else and while|

### operators.
|operators| name | usage|
|--|--|--|
|:= | assignment  | x := 1;|
|> | greater than| x > 1| 
|< | less than  | x < 1|
|= | test equality | x = 1 |
|+|  summation | x + 5;
|- | Subtraction | x  - 5;|
| * | Multiplication| x * 5;|
| / | Division|  x / 2;
| ^ | power| --- |

### complete example

Fibonacci Series in NOX

```c
let
	integer i,n1,n2,n3,numbers.
in
	read numbers;
	i := 2;
	n1 := 0;
	n2 := 1;
	write n1;
	write n2;

	 while i < numbers
		do
			 n3 := n1 + n2; 
               	         write n3; 
               	         n1 := n2; 
               	         n2 := n3; 
			 i := i +1;
		end;
	
end
```

## How NOX works ? 
![nox_info](https://imgur.com/2JpwtLR.png)
## Release History

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * Work in progress
    * 
* 0.1.1
    * 
* 0.1.0
    * 
    * 
* 0.0.1
    * 
## TODO

* read & implement the dragon book.
* then determine the purpose of NOX, try to improve the current technology.
* implement our own lexical/synthetic  analyzers.

## Meta

Abdullah Mosibah – [@abdullah_mrajab](https://twitter.com/abdullah_mrajab) – abdullah.rm.2020@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.



## Contributing

1. Fork it (<https://github.com/abdullahMosibah/NOX/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request


## TODO list 

✅Add basic language features ( vars, while, if, else  etc.)

⬜Add LP solver glpk into compiling pipeline
