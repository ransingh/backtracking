class BacktrackingProblemSolver

  attr_reader :problem

  def initialize(problem)
    @problem = problem
  end

  def solve()
    @problem.root().each  do |s|
      backtrack(s)
    end

  end

  def backtrack(candiate_solution)
    return if @problem.reject?(candiate_solution)

    @problem.output(candiate_solution) if @problem.accept?(candiate_solution)

    new_candidate_solution = @problem.first_extension(candiate_solution)

    while new_candidate_solution
      backtrack(new_candidate_solution)
      # try next sibling in the search solution tree
      new_candidate_solution = @problem.next_alternate_extension(new_candidate_solution)

    end

  end # backtrack
end