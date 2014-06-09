
class BacktrackingProblem

  def root()
    raise "sublass class must implement this #{__method__} method"
  end

  def reject?(candiate_solution)
    raise "sublass class must implement this #{__method__} method"
  end

  def accept?(candiate_solution)
    raise "sublass class must implement this #{__method__} method"
  end

  def first_extension(candiate_solution)
    raise "sublass class must implement this #{__method__} method"
  end

  def next_alternate_extension(candiate_solution)
    raise "sublass class must implement this #{__method__} method"
  end

  def output(candiate_solution)
    raise "sublass class must implement this #{__method__} method"
  end
end