
package main

import ( 
	"fmt" 
	"flag"
	"bufio"
	"io"
	"os"
	"strings"
)

func main() {
	var input = "././data/rosalind/count_nucleotides.txt";
	//flag.Parse();
	fin, err := os.Open(input); // OR flag.Arg(0)
	if (err==nil) {
		r := bufio.NewReader(fin)
		var a, t, g, c int
		for line, _, err := r.ReadLine(); err!=io.EOF; line, _, err = r.ReadLine() {
			chars := strings.Split(string(line), "");
			for i :=0; i < len(chars); i++ { 
				if chars[i]=="A" { a++; }
				if chars[i]=="T" { t++; }
				if chars[i]=="G" { g++; }
				if chars[i]=="C" { c++; }
			}
		}
		fmt.Printf("%d %d %d %d\n", a, c, g, t);
	} else {
		fmt.Printf("The file %v does not exist!\n", flag.Arg(0))
	} 
}
