# User Bin Crash - https://www.facebook.com/careers/puzzles.php?puzzle_id=2

# @author - Yogesh Pandit
# @date - Sept 11, 2011

=begin
  This problem is like a variation of the Knapsack problem (http://en.wikipedia.org/wiki/Knapsack_problem),
  which is a optimization problem
=end

def read_inputs(filename)
  file = File.new(filename, 'r')
  inputs = []
  min_weight = file.gets.to_i
  while line = file.gets
    data = line.split("\s")
    @sku = Hash.new
    @sku[:Label] = data[0]
    @sku[:Weight] = data[1].to_i
    @sku[:Cost] = data[2].to_i
    inputs << @sku
  end
  return min_weight, inputs
end


def solve(min_weight, inputs)
  gcd = gcd(min_weight, inputs[0][:Weight])
  inputs.each { |sku| gcd = gcd(gcd, sku[:Weight]) }
  if gcd > 1
    min_weight /= gcd
    inputs.each { |sku| sku[:Weight] /= gcd }
  end
  min_cost = dp(min_weight, inputs)[min_weight]
  return min_cost
end


def dp(weight, inputs)
  costs = Array.new(weight + 1)
  costs[0] = 0

  for w in 1..weight
    lowest_cost = nil
    inputs.each do |sku|
      diff = w-sku[:Weight]
      cost = (diff <= 0 ? 0 : costs[diff]) + sku[:Cost]
      lowest_cost = cost if lowest_cost.nil? || cost < lowest_cost
    end
    costs[w] = lowest_cost
  end
  return costs
end


=begin
  GCD using Euclidean algorithm (http://en.wikipedia.org/wiki/Euclidean_algorithm)
=end
def gcd(a, b)
  if b==0
    return a
  end
  return gcd(b, a%b)
end

if __FILE__ == $0
  #filename = ARGV[0]
  filename = "././data/facebook/UBC-sample.in"
  min_weight, inputs = read_inputs(filename)
  min_cost = solve(min_weight, inputs)
  puts min_cost
  puts
end