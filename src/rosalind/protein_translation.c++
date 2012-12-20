
#include <iostream>
#include <fstream>
#include <string>
#include <map>

using namespace std;
map<string, string> load_codon_table(string file);

int main (void) {
	string codon_table_file = "././data/rosalind/codon_table.txt";
	map<string, string> CodonTable = load_codon_table(codon_table_file);
	ifstream input( "././data/rosalind/protein_translation.txt" );
	string line;
	while ( getline( input, line ) ) {
		int i = 0;
		while (i< line.length()) {
			string codon = line.substr(i, 3);
			string protein = CodonTable[codon];
			if (protein != "Stop") {
				cout << protein;
			}
			i += 3;
		}
	}
	cout << endl;
	return 0;
}

map<string, string> load_codon_table (string file) {
	map<string, string> CodonTable;
	ifstream input(file.c_str());
	string line;
	while (getline(input, line)) {
		string codon = line.substr(0, 3);
		CodonTable[codon] = line.substr(4, line.length());
	}
	return CodonTable;
}
