
import re
from Bio import SeqIO
from StringIO import StringIO
import requests as r

uniprot_base_url = 'http://www.uniprot.org/uniprot/'
motif = re.compile("N[^P][ST][^P]")


def find(filename):
    FH = open(filename, 'r')
    for id in FH.readlines():
        query = uniprot_base_url + id.strip() + '.fasta'
        response = r.get(query)
        if response.status_code == r.codes.ok:
            seq = str(SeqIO.read(StringIO(response.text), "fasta").seq)
            starts = []
            for i in range(0, len(seq)):
                if motif.match(seq[i:i + 4]):
                    starts.append(i + 1)
            if len(starts) > 0:
                print id.strip()
                print ' '.join([str(s) for s in starts])


def main():
    filename = '././data/rosalind/protein_motif.txt'
    find(filename)


if __name__ == '__main__':
    main()
