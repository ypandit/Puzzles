
import itertools, sys

def main():
	n = 0;
	if len(sys.argv) == 2:
		n = int(sys.argv[1])
	else:
		print "n is Null"
		exit(0)
	if n > 7:
		print "n > 7"
	else:
		a = [i for i in range(1, n + 1)]
		vals = list(itertools.permutations(a, n))
		print len(vals)
		for order in vals:
			print " ".join(map(str, order))	


if __name__ == "__main__":
	main()
