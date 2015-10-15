#include "stdafx.h"
#include <iostream>
 
using namespace std;
 
const size_t block_size = 8; //in bytes
const size_t round_count = 3;
 
typedef unsigned long long word64;
typedef unsigned long word32;
typedef unsigned short word16;
typedef unsigned char word8;
 
word16 get_even_bits(word32 x) {
    word32 d = 1;
    word16 result = 0;
    for (int i = 0; i < 15; i++) {
        word32 tmp = d << (2 * i);
        result |= (tmp & (~(x ^ tmp))) >> i;
    }
    return result;
}
 
size_t get_aligned_length(size_t length) {
    return length % block_size ? (length / block_size + 1) * block_size : length;
}
 
word16 get_round_key(word64 key, size_t round) {
	cout << get_even_bits(_rotr64(key, 2 * round)) << endl;
    return get_even_bits(_rotr64(key, 2 * round));
}
 
word16 f(word16 x) {    
    word8 *r = (word8 *)&x;
    word8 r0 = r[0];
    word8 r1 = r[1];
    word16 y = 0;
    word8 *s = (word8 *)&y;
    s[0] = r1 ^ (~r0);
    s[1] = r1 ^ _rotl8(s[0], 2);
    return y;
}
 
void encrypt_swap(word64 *block) {
    word64 tmp = 0;
    word16 *a = (word16 *)&tmp;
    word16 *b = (word16 *)block;
    a[0] = b[2];
    a[1] = b[0];
    a[2] = b[3];
    a[3] = b[1];
    *block = tmp;
}
 
void round_encrypt(word64 *block, word16 round_key) {
    word64 res = 0;
    word16 *a = (word16 *)&res;
    word16 *b = (word16 *)block;
    a[0] = b[0];
    a[1] = f(b[1]);
    a[3] = b[3] ^ round_key;
    a[2] = b[2] ^ a[3];
    *block = res;
}
 
void encrypt_block(word64 *block, word64 key) {
    for (size_t i = 0; i < round_count; i++) {
        round_encrypt(block, get_round_key(key, i));
        if (i != round_count - 1) { 
            encrypt_swap(block);
        }
    }
}
 
int encrypt(char *in, size_t length, word64 key, char *out) {
    size_t block_count = get_aligned_length(length) / block_size;
    word64 *tmp = (word64 *)calloc(block_count, sizeof(word64));
    memcpy(tmp, in , length);
    for (size_t i = 0; i < block_count; i++) {
        encrypt_block(&tmp[i], key);
    }
    memcpy(out, tmp, block_count * block_size);
    free(tmp);
    return 0;
}
 
word16 f_r(word16 x) {
    word8 *s = (word8 *)&x;
    word8 s0 = s[0];
    word8 s1 = s[1];
    word16 y = 0;
    word8 *r = (word8 *)&y;
    r[1] = s1 ^ _rotl8(s0, 2);
    r[0] = ~(r[1] ^ s0);
    return y;
}
 
void decrypt_swap(word64 *block) {
    word64 tmp = 0;
    word16 *a = (word16 *)&tmp;
    word16 *b = (word16 *)block;
    a[2] = b[0];
    a[0] = b[1];
    a[3] = b[2];
    a[1] = b[3];
    *block = tmp;
}
 
void round_decrypt(word64 *block, word16 round_key) {
    word64 res = 0;
    word16 *a = (word16 *)&res;
    word16 *b = (word16 *)block;
    a[0] = b[0];
    a[1] = f_r(b[1]);
    a[2] = b[2] ^ b[3];
    a[3] = b[3] ^ round_key;
    *block = res;
}
 
void decrypt_block(word64 *block, word64 key) {
    for (size_t i = round_count - 1; i > 0; i--) {
        round_decrypt(block, get_round_key(key, i));
        if (i != 0) { 
            decrypt_swap(block);
        }
    }
    round_decrypt(block, get_round_key(key, 0));
}
 
int decrypt(char *in, size_t length, word64 key, char *out) {
    size_t block_count = get_aligned_length(length) / block_size;
    word64 *tmp = (word64 *)calloc(block_count, sizeof(word64));
    memcpy(tmp, in , length);
    for (size_t i = 0; i < block_count; i++) {
        decrypt_block(&tmp[i], key);
    }
    memcpy(out, tmp, block_count * block_size);
    free(tmp);
    return 0;
}
 
 
int _tmain(int argc, _TCHAR* argv[])
{
    cout << "Sizes:\n";
    cout << sizeof(word8) * 8 << endl;
    cout << sizeof(word16) * 8 << endl;
    cout << sizeof(word32) * 8 << endl;
    cout << sizeof(word64) * 8 << endl;
    cout << endl;
    char *out = (char *)malloc(64);
    char *in = "I'm here to chew bubblegum";
    int n = 33;
    word64 key = 15468789645;
    encrypt(in, n, key, out);
    //out[n] = 0;
    cout << in << endl;
    cout << out << endl;
    char *in1 = (char *)malloc(64);
    char *out1 = (char *)malloc(64);
    memcpy(in1, out, 64);
    //cout << in1 << endl;
    decrypt(in1, n, key, out1);
    //out1[n] = 0;
    cout << out1 << endl;
    cin.ignore();
    return 0;
}