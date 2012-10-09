# Gattaca - https://www.facebook.com/careers/puzzles.php?puzzle_id=15

__author__ = 'Yogesh'
__date__ = 'Aug 20, 2010'


def get_triples(filename):
    """
    Read given input to extract <start> <stop> <score> triples
    """
    triples = []
    file = open(filename, 'r')
    for line in file:
        triple = line.strip().split()
        if len(triple) == 3:
            triples.append(line)
    return triples


def check_overlap(a, b):
    """
    Check if the two gene predictions overlap
    """
    if int(a.strip().split()[1]) < int(b.strip().split()[0]):
        return True
    elif int(b.strip().split()[1]) < int(a.strip().split()[0]):
        return True
    else:
        return False


def maximize_score(start, triples):
    """
    A recursive function which checks each prediction with each other and adds the max score,
    in each iteration, if there is no overlap
    """
    allowed = [t for t in triples if check_overlap(t, start)]
    if not allowed:
        return int(start.split()[2])
    else:
        return int(start.split()[2]) + max([maximize_score(t, allowed) for t in allowed])


def main():
    #triples = get_triples(sys.argv[2])
    triples = get_triples('././data/facebook/Gattaca-input.txt')
    score = max([maximize_score(start, triples) for start in triples])
    print score


if __name__ == '__main__':
    main()
