
from __future__ import division
from Bio import SeqIO

tt = {
		frozenset(['A', 'G']): 'transition',
		frozenset(['C', 'T']): 'transition',
		frozenset(['A', 'C']): 'transversion',
		frozenset(['G', 'T']): 'transversion',
		frozenset(['A', 'T']): 'transversion',
		frozenset(['C', 'G']): 'transversion',
		}

def calculate_tt(filename):
	fasta1, fasta2 = [s for s in SeqIO.parse(filename, 'fasta')]
	trans, transvers = 0,0
	for s1, s2 in zip(fasta1.seq, fasta2.seq):
		what_is_it = tt.get(frozenset([s1, s2]))
		if what_is_it:
			if what_is_it == 'transition':
				trans += 1
			elif what_is_it == 'transversion':
				transvers += 1
	tt_ratio = trans/transvers
	print tt_ratio

def main():
	filename = "././data/rosalind/transitions_transversions.txt"
	calculate_tt(filename)

if __name__ == '__main__':
	main()
