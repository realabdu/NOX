# NOX
![nox logo](https://imgur.com/fbVBC0k.png)
> programming language for linear optimization problems.


nox is a programming language, intended to deal with linear optimization problems.
for now, nox supports basic language features. and as nox grow we will implement features, specified for LP.




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

## Usage example

lets try to wite Fibonacci Series in NOX

or more examples and usage, please refer to the [Wiki][wiki]._



## Release History

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * Work in progress
    * ----
* 0.1.1
    * -------
* 0.1.0
    * ------
    * ------
* 0.0.1
    * Work in progress

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

✅Add baisic language features ( vars, while, if, else  etc.) 
⬜Add LP solver glpk into compiling pipeline





