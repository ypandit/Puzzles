
package main

import (
	"fmt"
	"bytes"
)

func main() {
	symbols := []string{"I", "W", "T", "Y", "U"}
	var k int = 4
	
	kMers := enumerate(k, symbols);
	for _, kMer := range kMers {
		fmt.Printf("%s\n", kMer);
	}
}

func enumerate (k int, symbols []string) []string {
	words := symbols;
	for i := 1; i <= k-1; i++ {
		var tmp []string= nil;
		for _, w := range words {
			for _, b := range symbols {
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
