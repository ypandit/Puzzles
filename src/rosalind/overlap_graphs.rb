
require 'bio'

def main()
	input = '././data/rosalind/overlap_graphs.txt'
	file = Bio::FastaFormat.open(input)
	fastas = []
	file.each do |entry|
		fastas << entry
	end
	fastas.each do |entry1|
		fastas.each do |entry2|
			overlaps = overlaps?(entry1.naseq, entry2.naseq)
			if overlaps
				puts "#{entry1.entry_id} #{entry2.entry_id}"
			end
		end
	end
end

def overlaps?(fasta1, fasta2)
	return false if fasta1.eql? fasta2
	if fasta1.split(//).last(3).to_s.eql? fasta2.split(//).first(3).to_s
		return true
	end
end

if __FILE__ == $0
	main()
end
