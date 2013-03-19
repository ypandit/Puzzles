
require 'bio'

def main()
	input = '././data/rosalind/rna_splicing.txt'
	fasta = Bio::FastaFormat.open(input)
	dna = fasta.first.naseq
	fasta.each do |entry|
		dna = dna.gsub(entry.naseq, '')
	end
	puts dna.translate

end

if __FILE__ == $0
	main()
end
