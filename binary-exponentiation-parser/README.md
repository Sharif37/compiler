# binary-exponentiation-parser/binary-exponentiation-parser/README.md

# Binary Exponentiation Parser

This project implements a parser that evaluates exponentiation of binary integers. The binary numbers are prefixed with `0b`, and the exponentiation operator is `^`.

## Files

- **src/calc.l**: Contains the lexical analyzer specification using Flex. It recognizes binary numbers and the exponentiation operator.
- **src/calc.y**: Contains the Yacc/Bison parser specification. It defines the grammar rules for parsing binary exponentiation expressions and evaluates the results.
- **src/main.c**: The entry point for the application, initializing the parser and handling input/output for binary exponentiation calculations.
- **Makefile**: Contains build instructions for compiling the project.

## Building the Project

To build the project, navigate to the project directory and run:

```
make
```

This will generate the lexer and parser from the `.l` and `.y` files and compile the main program.

## Running the Parser

After building the project, you can run the parser with:

```
./binary-exponentiation-parser
```

## Usage Examples

To evaluate binary exponentiation, input expressions in the following format:

```
0b101 ^ 0b10
```

This will compute \( 5^2 \) (since `0b101` is 5 in decimal and `0b10` is 2 in decimal) and output the result.

## License

This project is licensed under the MIT License.