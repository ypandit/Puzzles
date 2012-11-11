
package main

import (
    "bytes"
    "bufio"
    "fmt"
	"io"
    "regexp"
    "os"
    "strings"
)

func main () {
    var input = "../../data/rosalind/kMer_composition.txt";
    fasta := readFastA(input);
    kMers := generate_kMers(4);
    for _, kMer := range kMers {
        fmt.Printf("%d ", strings.Count(fasta[1], kMer));
    }
}

func generate_kMers (k int) []string {
    bases := []string{"A","C","G","T"}
    words := bases;
    for i := 1; i <= k-1; i++ {
        var tmp []string = nil;
        for _, w := range words {
            for _, b := range bases {
                var seq bytes.Buffer;
                seq.WriteString(w);
                seq.WriteString(b);
                tmp = append(tmp, seq.String())
            }
        }
        words = tmp;
    }
    return words;
}

func readFastA (file string) []string {
    fin, err := os.Open(file);
    var fasta []string;
    var seq bytes.Buffer;
    if (err == nil) {
        r := bufio.NewReader(fin);
        for line, _, err := r.ReadLine(); err!=io.EOF; line, _, err = r.ReadLine() {
            match, err := regexp.MatchString("^>", string(line));
            if (match && err==nil) {
                fasta = append(fasta, string(line));
                continue;
            }
            seq.WriteString(string(line))
        }
        fasta = append(fasta, seq.String()) ;
    } else {
        fmt.Printf("File %v NOT found!", file);
    }
    return fasta;
}
