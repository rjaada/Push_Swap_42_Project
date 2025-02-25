# 🔄 Push Swap 🔄

## 🌟 Overview
This is an implementation of the Push Swap algorithm challenge, which requires sorting data on a stack with a limited set of operations. The project focuses on choosing the most efficient algorithm for an optimized data sorting solution using two stacks.

## 🧩 The Problem
The Push Swap challenge involves sorting a stack of integers using only specific operations and an auxiliary stack:

- You have two stacks named A and B 📊
- Stack A contains a random list of integers (no duplicates allowed) 🔢
- Stack B is initially empty 🚫
- The goal is to sort the numbers in stack A in ascending order using only specific operations ⬆️
- You must find the solution with the minimum number of operations possible 📉

## ✨ Available Operations
- `sa`: Swap the first two elements of stack A 🔄
- `sb`: Swap the first two elements of stack B 🔄
- `ss`: Do `sa` and `sb` at the same time 🔄🔄
- `pa`: Push the first element of stack B onto stack A ⬅️
- `pb`: Push the first element of stack A onto stack B ➡️
- `ra`: Rotate stack A - shift all elements up by 1 (first becomes last) ⤴️
- `rb`: Rotate stack B - shift all elements up by 1 (first becomes last) ⤴️
- `rr`: Do `ra` and `rb` at the same time ⤴️⤴️
- `rra`: Reverse rotate stack A - shift all elements down by 1 (last becomes first) ⤵️
- `rrb`: Reverse rotate stack B - shift all elements down by 1 (last becomes first) ⤵️
- `rrr`: Do `rra` and `rrb` at the same time ⤵️⤵️

## 📋 Features
- 🧮 Handles both single string of numbers and multiple arguments
- 🔍 Input validation (checks for non-numeric values, duplicates, and integer overflow)
- 🧠 Multiple sorting algorithms:
  - Simple sort for small sets (2-5 numbers)
  - Radix sort for larger sets
- 🔗 Custom linked list implementation for stack manipulation
- 🛡️ Error handling with memory clean-up

## 📦 Requirements
- GCC compiler
- Make build system
- C standard library

## 🛠️ Compilation
Use the provided Makefile to compile the program:

```bash
make
```

This will create the executable `push_swap`.

## 🚀 Usage

```bash
./push_swap [numbers]
```

### Examples:
```bash
# Individual numbers as arguments
./push_swap 42 1 7 89 -42

# Single quoted string of numbers
./push_swap "42 1 7 89 -42"
```

The program will output the sequence of operations needed to sort the stack, one operation per line.

## 📁 Project Structure

### Files
- `push_swap.c`: Main program logic and initialization 🚪
- `push_swap.h`: Header with prototypes and data structures 📝
- `sort_small.c`: Algorithms for sorting 3 elements 🔢
- `sort_simple.c`: Algorithms for sorting 2-5 elements 🔢
- `sort_radix.c`: Radix sort algorithm for larger sets 🔢
- `push.c`: Push operations (pa, pb) ➡️
- `swap.c`: Swap operations (sa, sb, ss) 🔄
- `rotate.c`: Rotate operations (ra, rb, rr) ⤴️
- `reverse.c`: Reverse rotate operations (rra, rrb, rrr) ⤵️
- `utilities.c`: Helper functions for stack manipulation 🛠️
- `validation.c`: Input validation functions 🔍
- `error.c`: Error handling functions ⚠️
- `ft_*.c`: Various utility functions from libft 📚
- `Makefile`: Build system configuration 🔨

### Detailed File Structure 📂
```
push_swap/
├── Makefile           # Compilation rules with colorful output
├── push_swap.h        # Main header file with all prototypes
├── push_swap.c        # Main program logic
├── error.c            # Error handling
├── validation.c       # Input validation
├── utilities.c        # Helper functions
├── sort_small.c       # Algorithm for 3 elements
├── sort_simple.c      # Algorithms for small sets (2-5)
├── sort_radix.c       # Radix sort for larger sets
├── push.c             # Push operations
├── swap.c             # Swap operations
├── rotate.c           # Rotate operations
├── reverse.c          # Reverse rotate operations
└── ft_*.c             # Utility functions (atoi, split, etc.)
```

### Data Structures
#### `t_list` struct 🔗
```c
typedef struct s_list
{
    int             value;      // Integer value stored in the node
    int             index;      // Index assigned for sorting algorithms
    struct s_list   *next;      // Pointer to the next node
}               t_list;
```

## 🔍 Implementation Details

### Sorting Algorithms
- **Small Set Sorting** (2-5 elements):
  - For 2 elements: Simple swap if needed 🔄
  - For 3 elements: Optimized case-based approach with at most 2 operations 🧠
  - For 4-5 elements: Push smallest elements to stack B, sort remaining on A, then merge back 🔀

- **Radix Sort** (Large sets):
  - Assigns indexes to each number (normalizing the stack)
  - Sorts by processing each binary digit from least significant to most significant 📊
  - Uses bitwise operations for efficient sorting 🧮

### Stack Management
- Implemented using a linked list data structure 🔗
- Each node contains the original value and a normalized index
- Custom memory management with proper cleanup 🧹

## 🧠 Algorithms in Detail
### Radix Sort Logic
1. Normalize numbers by assigning indexes (0 to n-1) based on their relative order
2. Sort numbers by processing each bit of their binary representation
3. For each bit position:
   - If the bit is 0, push to stack B
   - If the bit is 1, keep in stack A (rotate)
4. After processing each position, move all elements back to stack A
5. Repeat for each bit position until all numbers are sorted

### Small Sort Optimizations
For 3 elements, all possible permutations (6 total) are handled with specific operations:
- Cases like [3,1,2], [2,3,1], etc. have optimized move sequences
- Maximum of 2 operations needed for any 3-number permutation

## 🧹 Cleaning Up
To remove object files:
```bash
make clean
```

To remove object files and the executable:
```bash
make fclean
```

To rebuild the project:
```bash
make re
```

## 🎮 Testing Your Code
```
# Test with 3 random numbers
ARG="2 1 3"; ./push_swap $ARG | wc -l    # Should be <= 3 operations

# Test with 5 random numbers
ARG="5 1 2 4 3"; ./push_swap $ARG | wc -l    # Should be <= 12 operations

# Test with 100 random numbers
ARG=$(shuf -i 1-100 -n 100 | tr "\n" " "); ./push_swap $ARG | wc -l    # Should be < 700 operations for good implementation
```

## ⚠️ Common Pitfalls
- Integer overflow when converting strings to numbers 🔢
- Memory leaks from improper list management 💧
- Infinite loops in complex sort algorithms 🔄
- Not handling duplicate numbers ♊

## 🏆 Performance Targets
- 3 numbers: ≤ 3 operations
- 5 numbers: ≤ 12 operations
- 100 numbers: < 700 operations
- 500 numbers: < 5500 operations

Enjoy sorting! 🎯
