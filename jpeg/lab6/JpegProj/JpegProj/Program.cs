using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BitMiracle.LibJpeg.Classic;
using System.IO;

namespace JpegProj
{
    class Program
    {
        static void Main(string[] args)
        {
            string filename1 = "0001.jpg";
            string filename2 = "0002.jpg";
            int[][] dct1 = GetDct(filename1);
            int[][] dct2 = GetDct(filename2);

            double hi2_1 = 0;
            double hi2_2 = 0;

            for (int i = 0; i < dct1.Length; i++)
            {
                hi2_1 += hiSquare(dct1[i]);
                hi2_2 += hiSquare(dct2[i]);
            }
            
            Console.WriteLine("hi2, " + filename1 + ": " + hi2_1);
            Console.WriteLine("hi2, " + filename2 + ": " + hi2_2);

            DrawHistogram(dct1, filename1);
            //DrawHistogram(dct2, filename2);
            //Console.WriteLine("hi2blocks, " + filename1 + ": " + hiSquareBlocks(dct1, 8));
            //Console.WriteLine("hi2blocks, " + filename2 + ": " + hiSquareBlocks(dct2, 8));
            Console.ReadLine();
        }

        static double hiSquare(int[] block)
        {
            double result = 0;
            int length = 0;
            int max = block.Max();
            int min = block.Min();
            if (min < 0)
            {
                length = max + Math.Abs(min) + 1;
                min = Math.Abs(min);
            }
            else
            {
                length = max + 1;
                min = 0;
            }
            int[] count = new int[length];
            for (int i = 0; i < length; i++)
            {
                count[i] = 0;
            }
            for (int i = 0; i < block.Length; i++)
            {
                count[block[i] + min]++;
            }
            
            int[] x = new int[count.Length/2];
            int[] y = new int[count.Length/2];
            int[] z = new int[count.Length/2];
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = count[i*2];
                y[i] = count[2*i + 1];
                z[i] = (x[i] + y[i])/2;
                if (z[i] > 0)
                {
                    result += (x[i] - z[i])*(x[i] - z[i])/z[i];
                }
            }
            return result;
        }

        static double hiSquareBlocks(int[][] blocks, int size)
        {
            double result = 0;
            for (int i = 0; i < blocks.Length; i+=size)
            {
                int[] block = new int[blocks[i].Length * size];
                for (int j = i; j < i + size; j++)
                {
                    for (int k = 0; k < blocks[j].Length; k++)
                    {
                        block[(j - i) * blocks[j].Length + k] = blocks[j][k];
                    }
                }
                int length = 0;
                int max = block.Max();
                int min = block.Min();
                if (min < 0)
                {
                    length = max + Math.Abs(min) + 1;
                    min = Math.Abs(min);
                }
                else
                {
                    length = max + 1;
                    min = 0;
                }
                int[] count = new int[length];
                for (int l = 0; l < length; l++)
                {
                    count[l] = 0;
                }
                for (int l = 0; l < block.Length; l++)
                {
                    count[block[l] + min]++;
                }

                int[] x = new int[count.Length / 2];
                int[] y = new int[count.Length / 2];
                int[] z = new int[count.Length / 2];
                for (int l = 0; l < x.Length; l++)
                {
                    x[l] = count[l * 2];
                    y[l] = count[2 * l + 1];
                    z[l] = (x[l] + y[l]) / 2;
                    if (z[l] > 0)
                    {
                        result += (x[l] - z[l]) * (x[l] - z[l]) / z[l];
                    }
                }
            }
            return result;
        }

        static void DrawHistogram(int[][] dct, string fname)
        {
            int length = 0;
            int[] maxs = new int[dct.Length];
            int[] mins = new int[dct.Length];
            for (int i = 0; i < maxs.Length; i++)
            {
                maxs[i] = dct[i].Max();
                mins[i] = dct[i].Min();
            }
            int max = maxs.Max();
            int min = mins.Min();
            if (min < 0)
            {
                length = max + Math.Abs(min) + 1;
                min = Math.Abs(min);
            }
            else
            {
                length = max + 1;
                min = 0;
            }
            int[] count = new int[length];
            for (int i = 0; i < length; i++)
            {
                count[i] = 0;
            }
            for (int i = 0; i < dct.Length; i++)
            {
                for (int j = 0; j < dct[i].Length; j++)
                {
                    count[dct[i][j] + min]++;
                }
            }

            int[] x = new int[count.Length / 2];
            int[] y = new int[count.Length / 2];
            int[] z = new int[count.Length];
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = count[i * 2];
                y[i] = count[2 * i + 1];
                z[2 * i] = (x[i] + y[i]) / 2;
                z[2 * i + 1] = (x[i] + y[i]) / 2;
            }

            JpegHist newForm = new JpegHist(count, z, min, fname);
            newForm.Show();
            //newForm.Activate();
        }

        static int[][] GetDct(string filename)
        {
            jpeg_decompress_struct cinfo = new jpeg_decompress_struct();
            FileStream objFileStreamHeaderImage = new FileStream(filename, FileMode.Open, FileAccess.Read);
            cinfo.jpeg_stdio_src(objFileStreamHeaderImage);
            cinfo.jpeg_read_header(true);
            var coeffs = cinfo.jpeg_read_coefficients();
            int height = cinfo.Image_height / 64;
            int width = cinfo.Image_width / 64;
            int[][] result = new int[height * width][];
            var dct = coeffs[0].Access(0, height);
            for (int i = 0; i < height*width; i++)
            {
                result[i] = new int[64];
            }
            for (int i = 0; i < height; i++)
            {
                for (int j = 0; j < width; j++)
                {
                    for (int k = 0; k < 64; k++)
                    {
                        result[i * width + j][k] = dct[i][j][k];
                    }
                }
            }
            return result;
        }
    }
}
