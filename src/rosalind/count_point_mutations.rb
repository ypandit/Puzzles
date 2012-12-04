
def run (filename) 
	file = File.new(filename, 'r')
	while !file.eof?
		s1 = file.gets.chomp
		s2 = file.gets.chomp
		p hamming_distance(s1, s2)
	end
end

def hamming_distance (a, b)
	dist = 0
	if a.length != b.length
		puts "Strings NOT of same length\n"
		exit
	else
		(0..a.length).each do |i|
			dist += 1 unless a[i] == b[i]
		end
	end
	dist
end

run('././data/rosalind/count_point_mutations.txt')
