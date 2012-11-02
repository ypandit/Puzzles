
"""
Created on Nov 12, 2011
"""


def main():
    filename = '././data/facebook/SS-sample.in'
    f = open(filename, 'r')
    f.readline()
    for line in f.readlines():
        chars = line.strip().split()
        lss = ''
        for x in sorted(chars[1:len(chars)]):
            lss += x
        print lss


if __name__ == "__main__":
    main()
