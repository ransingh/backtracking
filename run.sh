#!/usr/bin/env ruby

$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
$:.unshift(File.join(File.dirname(__FILE__), 'lib/problems'))
$:.unshift(File.join(File.dirname(__FILE__), 'lib/problems/8queens'))

#puts "#{$:}"
require 'eight_queens_problem'
require 'backtracking_problem_solver'


eight_queens_problem = Chess::EightQueensProblem.new

bt_solver = BacktrackingProblemSolver.new(eight_queens_problem)

bt_solver.solve()

puts bt_solver.problem