backtracking
============

Backtracking Algorithm

Backtracking is a general algorithm for finding all (or some) solutions to some computational problem, that incrementally builds candidates to the solutions, and abandons each partial candidate c ("backtracks") as soon as it determines that c cannot possibly be completed to a valid solution. [Here](http://en.wikipedia.org/wiki/Backtracking) is the detailed explanantion

I have used it to implement solution to  8 queens problem.

This is also applicable to solving puzzles like Sudoku.

Basic idea is that there are multiple solutions for a problem.  These solution space  can be likened to a tree structure. Parital candidate solution are theg nodes of this solution tree.
Backtracking algo recursively traverses the solution tree from top to down in depth-first-order. At each step it examines if current candidate solution is worth considering or not. If not, then  whole subtree under that candidate solution is pruned, i.e. those potential paths are not event tried at all.

