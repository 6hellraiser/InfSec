// Feistel.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <iostream>
using namespace std;

unsigned long long encipher(unsigned long long word, int rounds,unsigned long long key);
unsigned long long decipher(unsigned long long word, int rounds,unsigned long long key);


int _tmain(int argc, _TCHAR* argv[])
{	
    string word = "000000000000000000000000";
    unsigned long long key = 65432789645678;
    int rounds = 3;
	cout << word << endl;
	word = encipher(word, rounds, key);
    cout << word << endl;
	word = decipher(word, rounds, key);
	cout << word << endl;
	cin.ignore();
	return 0;
}

//unsigned long long encipher_enh(unsigned long long word)

unsigned short even_bits(unsigned long x) {
    unsigned long d = 1;
    unsigned long result = 0;    
    for (int i = 0; i < 15; i++) {
        unsigned long tmp = d << (2 * i);
        result |= (tmp & (~(x ^ tmp))) >> i;
    }
    return result;
}

unsigned short get_key(unsigned long long key, int round) {
	unsigned long *k = (unsigned long*)&key;
    unsigned long k0 = k[0];
    unsigned long k1 = k[1];
    return even_bits((~k0) ^ _rotl64(k0, round*4));
}

unsigned short f(unsigned short x) {
    unsigned char *r = (unsigned char *)&x;
    unsigned short y = 0;
    unsigned char *s = (unsigned char*)&y;
	s[0] = r[1] ^ (~r[0]);
    s[1] = r[1] ^ _rotl8(s[0], 2);
    return y;
}

unsigned long long encipher(unsigned long long word, int rounds,unsigned long long key) {
    unsigned long long tmp = word;
    for (int i = 0; i < rounds; i++) {
		unsigned short round_key = get_key(key, i);
		unsigned long long result = 0;
        unsigned short *a = (unsigned short *)&result;
		unsigned short *b = (unsigned short *)&tmp;
        a[0] = b[0];
        a[1] = f(b[1]);
        a[3] = b[3] ^ round_key;
        a[2] = b[2] ^ a[3];
		tmp = result;
        if (i < rounds - 1) {
			result = 0;
			a = (unsigned short *)&result;
			b = (unsigned short *)&tmp;
			a[0] = b[2];
			a[1] = b[0];
			a[2] = b[3];
			a[3] = b[1];
			tmp = result;
        }
    }
	return tmp;
}

unsigned short reversed_f(unsigned short x) {
    unsigned char *s = (unsigned char *)&x;
    unsigned short y = 0;
    unsigned char *r = (unsigned char*)&y;
	r[1] = s[1] ^ _rotl8(s[0], 2);
    r[0] = (r[1] ^ (~s[0]));
    return y;
}

unsigned long long decipher(unsigned long long word, int rounds,unsigned long long key) {
	unsigned long long tmp = word;
	unsigned short *a;
	unsigned short *b;
	unsigned short round_key;
	unsigned long long result;
    for (int i = rounds - 1; i > 0; i--) { 
		round_key = get_key(key, i);
		result = 0;
		a = (unsigned short*)&result;
		b = (unsigned short*)&tmp;
		a[0] = b[0];
		a[1] = reversed_f(b[1]);
		a[2] = b[2] ^ b[3];
		a[3] = b[3] ^ round_key;
		tmp = result;
        if (i != 0) {
			result = 0;
			a = (unsigned short *)&result;
			b = (unsigned short *)&tmp;
			a[2] = b[0];
			a[0] = b[1];
			a[3] = b[2];
			a[1] = b[3];
			tmp = result;
        }
    }
	round_key = get_key(key, 0);
	result = 0;
	a = (unsigned short*)&result;
	b = (unsigned short*)&tmp;
	a[0] = b[0];
	a[1] = reversed_f(b[1]);
	a[2] = b[2] ^ b[3];
	a[3] = b[3] ^ round_key;
	tmp = result;
	return tmp;
}

