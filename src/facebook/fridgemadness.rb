# Refrigerator Madness - https://www.facebook.com/careers/puzzles.php?puzzle_id=10

# @author - Yogesh Pandit
# @date - Sept 12, 2011

=begin
  Reads the input file and returns arrays containing hashes of information about drinks and engineer preferences
=end
# @param filename [String] Input file path
def read_inputs(filename)
  	file = File.new(filename, 'r')
  	num_engineers, num_drinks = file.gets.split("\s")
  	drinks = {}
  	for i in 1..num_drinks.to_i
    	line = file.gets.split("\s")
    	if line.length > 2
      		drink_name = ""
      		for i in 1..line.length-1
        		drink_name += line[i] + " "
      		end
    	else
      		drink_name = line[1]
    	end
    	drinks[line[0].to_i] = drink_name.rstrip
  	end

  	engineers = {}
  	for i in 1..num_engineers.to_i
    	line = file.gets.split("\s")
    	engineers[line[0].to_i] = line[1].split(",").map(&:to_i)
  	end
  	return num_engineers.to_i, engineers
end


# @param engineers [Hash] Drink preferences for all employees. ID(Key) => Preference(Value)
def pref_scores(engineers)
  	mid = engineers.length/2
  	scores = {}
  	for i in 0..mid-1
    	scores[i] ||= {}
    	for j in mid..engineers.length-1
      		scores[j] ||= {}
      		scores[i][j], scores[j][i] = calculate_score(engineers[i], engineers[j], engineers[i].length)
    	end
  	end
  	return scores
end


# @param a [Integer Array] Drink preferences of employee A, in descending order
# @param b [Integer Array] Drink preferences of employee B, in descending order
# @param n [Integer] Number of preferences of employee A
private
def calculate_score(a, b, n)
  	score_ab = score_ba = 0
  	for i in 0..n-1
    	base_a = n-i
    	for j in 0..n-1
      		base_b = n-j
      		if a[i]==b[j]
        		if i==j
          			score_ab += base_a **2
          			score_ba += base_b**2
        		elsif i<j
          			score_ab += base_a
        		elsif i>j
          			score_ba += base_b
        		end
      		end
    	end
  	end
  	#puts "#{score_ab}, #{score_ba}"
  	return score_ab, score_ba
end


=begin
  The stable marriage problem (SMP) is the problem of finding a stable matching between two sets of elements
  given a set of preferences for each element.
  * Gale-Shapley algorithm (http://en.wikipedia.org/wiki/Stable_marriage_problem)
=end
# @param scores [Hash]
# @param num_engineers [Integer]
def stable_matching(scores, num_engineers)
  	mid = num_engineers/2
  	pref_coworkers = {}
  	for i in 0..mid-1
    	sorted_scores = scores[i].sort do |a, b|
      		v = b[1] <=> a[1]
      		v = b[0] <=> a[0] if v == 0
      		v
    	end
    	pref_coworkers[i] = sorted_scores.map { |s| s[0] }
  	end
	return pref_coworkers
end


if __FILE__ == $0
	#filename = ARGV[0]
  	filename = "././data/facebook/FM-sample.in"
  	num_engineers, engineer_pref = read_inputs(filename)
  	scores = pref_scores(engineer_pref)
  	# puts scores
  	pairs = stable_matching(scores, num_engineers)
  	# puts pairs
	for i in 0..(num_engineers/2)-1
		puts "#{i} #{pairs[i][0]}"
	end
end