using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BitMiracle.LibJpeg.Classic;
using System.IO;

namespace HiSquared
{
    class Program
    {
        static string[][] images = new string[5][];

        static int[][] getDct(string filename) {
            jpeg_decompress_struct cinfo = new jpeg_decompress_struct();
            FileStream objFileStreamHeaderImage = new FileStream(filename, FileMode.Open, FileAccess.Read);
            cinfo.jpeg_stdio_src(objFileStreamHeaderImage);
            cinfo.jpeg_read_header(true);
            var coeffs = cinfo.jpeg_read_coefficients();
            const int size = 64;
            int height = cinfo.Image_height / size;
            int width = cinfo.Image_width / size;
            int[][] result = new int[height * width][];
            var dct = coeffs[0].Access(0, height);
            for (int i = 0; i < height * width; i++)
            {
                result[i] = new int[size];
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

        static double hiSquare(int[] block) {
            double result = 0;
            int length = 0;
            int max = block.Max();
            int min = block.Min();
            if (min < 0) {
                length = max + Math.Abs(min) + 1;
                min = Math.Abs(min);
               /* if (min % 2 != 1) {
                    min++;
                    length++;
                }*/
            } else {
                length = max + 1;
                min = 0;
            }
            int[] count = new int[length];
            for (int i = 0; i < length; i++) {
                count[i] = 0;
            }
            for (int i = 0; i < block.Length; i++) {
                count[block[i] + min]++;
            }

            int[] x = new int[count.Length / 2];
            int[] y = new int[count.Length / 2];
            int[] z = new int[count.Length / 2];
            int c1 = 0;
            int c2 = 1;
            int k = 0;
            for (int i = 0; i < x.Length; i++) {
                x[i] = count[i * 2 + c1];
                y[i] = count[2 * i + c2];
                z[i] = (x[i] + y[i]) / 2;

                k++;
                if (k == min) {
                    c1 = -1;
                    c2 = 0;
                }
                k++;

                if (z[i] > 0) {
                    result += (x[i] - z[i]) * (x[i] - z[i]) / z[i];
                }
            }
            return result;
        }

        static void Main(string[] args) {
            images[0] = new string[2] { "0001.jpg", "0002.jpg" };
            images[1] = new string[2] { "0003.jpg", "0004.jpg" };
            images[2] = new string[6] { "image_002.jpg", "image_003.jpg", "image_004.jpg", "image_005.jpg", "image_006.jpg", "image_007.jpg" };
            images[3] = new string[2] { "Lena_1.jpg", "Lena_2.jpg" };
            images[4] = new string[2] { "sailboat_at_anchor_1.jpg", "sailboat_at_anchor_2.jpg" };

            for (int i = 0; i < images.Length; i++) {
                for (int j = 0; j < images[i].Length; j++) {
                    int[][] dct = getDct(images[i][j]);
                    double hi_sq = 0;
                    for (int k = 0; k < dct.Length; k++) {
                        hi_sq += hiSquare(dct[k]);
                    }
                    Console.Write(images[i][j] + " ");
                    Console.WriteLine(hi_sq);
                }
            }

            Console.ReadLine();
        }
    }
}
