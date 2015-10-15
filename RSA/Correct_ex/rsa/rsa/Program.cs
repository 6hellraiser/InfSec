using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Numerics;

namespace rsa
{
    class Program
    {
        static long len = 100000000000000;
        /*
         n = 491384118735611     e = 12977
        ШТ = 41251158896499912641578486198311209907217542135696312149225435919858918651331990562463068
         *
         fi = 491383914273672
         *d = 4922548266593
         *num = 130
         *num = 13107
            c[0] = 412511588964999;
            c[1] = 126415784861983;//126415784861983;
            c[2] = 112099072175421;//112099072175421;
            c[3] = 35696312149225;//356963121492254;
            c[4] = 435919858918651;//359198589186513;
            c[5] = 331990562463068;//31990562463068;
         */

        //static long n = 491384118735611;
        //static int e = 12977;
        //static string st = "41251158896499912641578486198311209907217542135696312149225435919858918651331990562463068";

        static long n = 491372401012837;
        static int e = 12791;
        static string st = "36007059252574723556176047415439789545721129733778233345664313257862627313563214958731488";

        static void Main(string[] args)
        {
            //n = p*q;
            //long q = 2432237;
            //long p = 202029703;
            long q = 202029703;
            long p = 2432179;
            long fi = (q - 1) * (p - 1);

            long d = 1;
            long num = 1;
            long dd = (num * fi + 1) % e;
            while (true)
            {
                num++;
                dd = (num * fi + 1) % e;
                if (dd == 0)
                {
                    d = (num * fi + 1) / e;
                    if (BigInteger.GreatestCommonDivisor(fi, d) == 1)
                        break;
                    else
                        dd++;
                }
            }
            Console.WriteLine(d);
            List<long> c = new List<long>();
            string ci = "";
            long res = 0;
            long lastRes = 0;
            string m = "";
            for (int i = 0; i < st.Length; i++)
            {
                ci += st[i];
                if (long.TryParse(ci, out res))
                {
                    if (res >= n)
                    {
                        c.Add(lastRes);
                        ci = st[i].ToString();
                        Console.WriteLine(lastRes);
                        Console.WriteLine(ci);
                    }
                    else
                    {
                        lastRes = res;
                        
                    }
                }
            }
            if (long.TryParse(ci, out res))
            {
               // long mi = (long)BigInteger.ModPow(res, d, n);
                if (res >= n)
                {
                    c.Add(lastRes);
                    ci = st[st.Length - 1].ToString();
                    c.Add(long.Parse(ci));
                }
                else
                {
                    c.Add(res);
                }
            }

            //string dStr = Convert.ToString(d, 2);
            for (int i = 0; i < c.Count; i++)
            {
                long mi = (long)BigInteger.ModPow(c[i], d, n);
                m += mi.ToString();
            }
            string M = "";
            string MM = "";
            if (m.Length % 2 != 0)
                m += "0";
            for (int i = 0; i < m.Length; i += 2)
            {
                string mi = m[i].ToString() + m[i + 1].ToString();
                MM += mi;
                M += (char)Int16.Parse(mi);
            }
            Console.WriteLine(M);


            //проверка:
            c = new List<long>();
            ci = "";
            res = 0;
            lastRes = 0;
            for (int i = 0; i < MM.Length; i++)
            {
                ci += MM[i];
                if (long.TryParse(ci, out res))
                {
                    if (res / len > 0)
                    {
                        c.Add(lastRes);
                        ci = MM[i].ToString();
                    }
                    else
                        lastRes = res;
                }
            }
            if (long.TryParse(ci, out res))
            {
                if (res / len > 0)
                {
                    c.Add(lastRes);
                    ci = st[st.Length - 1].ToString();
                }
                else
                    c.Add(res);
            }
            m = "";
            for (int i = 0; i < c.Count; i++)
            {

                m += BigInteger.ModPow(c[i], e, n).ToString();
            }
            Console.WriteLine(m.Equals(st));
            Console.ReadLine();
        }
    }
}
