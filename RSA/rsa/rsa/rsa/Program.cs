using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Numerics;

namespace rsa {
    class Program {
        static int e = 12341;
        static string str = "277140870674302260217431481485329310844916399448964498705119";
        static long n = 565570077646207;
        static long length = 15;

        static List<long> gather() {
            List<long> result = new List<long>();
            string item = "";
            long inter = 0;
            long fin = 0;
            for (int i = 0; i < str.Length; i++) {
                item += str[i];
                long.TryParse(item, out inter);
                if (inter < n) {
                    fin = inter;
                } else {
                    result.Add(fin);
                    item = str[i].ToString();
                }
            }
            long.TryParse(item, out inter);
            result.Add(inter);
            return result;
        }

        static string get_message(List<long> blocks, long d, out string m_enc) {
            string m = "";
            long item = 0;
            for (int i = 0; i < blocks.Count; i++) {
                item = (long)BigInteger.ModPow(blocks[i], d, n);
                m += item;
            }
            if (m.Length % 2 != 0)
                m += "0";
            string message = "";
            m_enc = ""; //message to encipher in the next method
            for (int i = 0; i < m.Length; i += 2) {
                string item1 = m[i].ToString() + m[i + 1].ToString();
                m_enc += item1;
                message += (char)Int16.Parse(item1);
            }
            return message;
        }

        static string encipher(string message) {
            List<long> blocks = new List<long>();
            string item = "";
            long inter = 0;
            long fin = 0;
            for (int i = 0; i < message.Length; i++) {
                item += message[i];
                long.TryParse(item, out inter);
                if (item.Length >= length) {
                    blocks.Add(fin);
                    item = message[i].ToString();
                } else {
                    fin = inter;
                }
            }
            long.TryParse(item, out inter);
            blocks.Add(inter);
            string m = "";
            for (int i = 0; i < blocks.Count; i++) {
                m += BigInteger.ModPow(blocks[i], e, n).ToString();
            }
            return m;
        }

        static void Main(string[] args) {
            long p = 365738333;
            long q = 1546379;
            long d = 143672396238821;
            List<long> blocks = gather();
            string m_enc = "";
            string message = get_message(blocks, d, out m_enc);
            string m = encipher(m_enc);
            Console.WriteLine(message);
            Console.ReadLine();
        }
    }
}
