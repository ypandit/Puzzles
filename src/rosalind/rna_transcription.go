 
package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

func main() {	
	var input = "././data/rosalind/rna_transcription.txt"
	fin, err := os.Open(input);
	if (err==nil) {
		r:= bufio.NewReader(fin)
		for line, _, err := r.ReadLine(); err!=io.EOF; line, _, err = r.ReadLine() {
			fmt.Printf("%v\n", strings.Replace(string(line), "T", "U", -1))
		}
	} else {
		fmt.Printf("File %v NOT found!\n", input)
	}	
}
