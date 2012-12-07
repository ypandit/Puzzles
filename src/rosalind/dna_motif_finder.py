

def search(filename):
    FH = open(filename, 'r')
    s = FH.readline().strip()
    t = FH.readline().strip()
    if len(t) > len(s):
        raise Exception("Motif longer than Sequence")

    for i in range(0, len(s) - len(t)):
        if t == s[i:i + len(t)]:
            print(i + 1),


def main():
    filename = '././data/rosalind/dna_motif_finder.txt'
    search(filename)


if __name__ == '__main__':
    main()
