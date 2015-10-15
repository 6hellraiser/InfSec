using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ZedGraph;
using BitMiracle.LibJpeg.Classic;
using System.IO;

namespace JpegFormProj
{
    public partial class Form1 : Form
    {
        List<HistForm> histForms = new List<HistForm>();
        string[][] images = new string[5][];

        public Form1()
        {
            InitializeComponent();           
            images[0] = new string[2] {"0001.jpg", "0002.jpg"};
            images[1] = new string[2] {"0003.jpg", "0004.jpg"};
            images[2] = new string[6] { "image_002.jpg", "image_003.jpg", "image_004.jpg", "image_005.jpg", "image_006.jpg", "image_007.jpg" };
            images[3] = new string[2] { "Lena_1.jpg", "Lena_2.jpg" };
            images[4] = new string[2] { "sailboat_at_anchor_1.jpg", "sailboat_at_anchor_2.jpg" };          
        }

        public void Analyze(string[][] images)
        {
            int num = 0;
            for (int i = 0; i < images.Length; i++)
            {
                for (int j = 0; j < images[i].Length; j++)
                {
                    int[][] dct = GetDct(images[i][j]);
                    double hi2 = 0;
                    double[] hi2_arr = new double[dct.Length];
                    for (int k = 0; k < dct.Length; k++)
                    {
                        hi2_arr[k] = hiSquare(dct[k]);
                        hi2 += hi2_arr[k];//hiSquare(dct[k]);
                    }

                    int[] B = LSB(dct);

                    DrawHistogram(dct, images[i][j], B, hi2, hi2_arr);
                }
            }
        }

        int[] LSB(int[][] dct)
        {
            int[] beta = new int[dct.Length];

            for (int i = 0; i < dct.Length; i++)
            {
                int m00 = 0;
                int m01 = 0;
                int m10 = 0;
                int m11 = 0;
                for (int j = 0; j < dct[i].Length - 1; j++)
                {
                    if ((dct[i][j + 1] % 2 == 0) && (dct[i][j] % 2 == 0))
                        m00++;
                    if ((dct[i][j + 1] % 2 != 0) && (dct[i][j] % 2 == 0))
                        m01++;
                    if ((dct[i][j + 1] % 2 == 0) && (dct[i][j] % 2 != 0))
                        m10++;
                    if ((dct[i][j + 1] % 2 != 0) && (dct[i][j] % 2 != 0))
                        m11++;
                }
                beta[i] = (m00 - m01) / 2 + (m11 - m10) / 2;
            }

            return beta;
        }

        double hiSquare(int[] block)
        {
            double result = 0;
            int length = 0;
            int max = block.Max();
            int min = block.Min();
            if (min < 0)
            {
                length = max + Math.Abs(min) + 1;
                min = Math.Abs(min);
                if (min % 2 != 1)
                {
                    min++;
                    length++;
                }
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

            int[] x = new int[count.Length / 2];
            int[] y = new int[count.Length / 2];
            int[] z = new int[count.Length / 2];
            int c1 = 0;
            int c2 = 1;
            int k = 0;
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = count[i * 2 + c1];
                y[i] = count[2 * i + c2];
                z[i] = (x[i] + y[i]) / 2;

                k++;
                if (k == min)
                {
                    c1 = -1;
                    c2 = 0;
                }
                k++;

                if (z[i] > 0)
                {
                    result += (x[i] - z[i]) * (x[i] - z[i]) / z[i];
                }
            }
            return result;
        }

        double hiSquareBlocks(int[][] blocks, int size)
        {
            double result = 0;
            for (int i = 0; i < blocks.Length; i += size)
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

        void DrawHistogram(int[][] dct, string filename, int[] B, double hi2, double[] hi2_arr)
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
                if (min % 2 != 1)
                {
                    min++;
                    length++;
                }

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
                    if (Math.Abs(dct[i][j]) > 0)
                        count[dct[i][j] + min]++;
                }
            }

            int[] x = new int[count.Length / 2];
            int[] y = new int[count.Length / 2];
            int[] z = new int[count.Length];
            int k = 0;
            int c1 = 0;
            int c2 = 1;
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = count[i * 2 + c1];
                y[i] = count[2 * i + c2];
                z[k] = (x[i] + y[i]) / 2;
                k++;
                if (k == min)
                {
                    c1 = -1;
                    c2 = 0;
                }
                z[k] = (x[i] + y[i]) / 2;
                k++;
            }

            HistForm hist = new HistForm(count, z, min, filename, B, hi2, hi2_arr);
            histForms.Add(hist);
            hist.Show();
        }

        int[][] GetDct(string filename)
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
            for (int i = 0; i < height * width; i++)
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

        private void button1_Click(object sender, EventArgs e)
        {
            Analyze(images);
        }
    }
}
