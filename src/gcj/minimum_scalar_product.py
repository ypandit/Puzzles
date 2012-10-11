# Minimum Scalar Product - http://code.google.com/codejam/contest/dashboard?c=32016#s=p0
__date__ = 'Aug 29, 2011'


def solve(filename):
    FH = open(filename, 'r')
    num_cases = int(FH.readline())

    for i in range(0, num_cases):
        num_int = FH.readline()
        X = [int(a) for a in FH.readline().split()]
        Y = [int(a) for a in FH.readline().split()]
        s = msp(X, Y)
        print "Case #" + str((i + 1)) + ": " + str(s)


def msp(X, Y):
    X.sort(), Y.sort()
    return sum([X[j] * Y[-j - 1] for j in xrange(len(X))])


def main():
    filename = "././data/gcj/MSP-large.in"
    solve(filename)


if __name__ == '__main__':
    main()
