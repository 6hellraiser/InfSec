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

namespace JpegHist
{
    public partial class Form1 : Form
    {
        string[][] images = new string[5][];
        List<FormHist> histForms = new List<FormHist>();

        public Form1()
        {
            InitializeComponent();
            images[0] = new string[2] { "0001.jpg", "0002.jpg" };
            images[1] = new string[2] { "0003.jpg", "0004.jpg" };
            images[2] = new string[6] { "image_002.jpg", "image_003.jpg", "image_004.jpg", "image_005.jpg", "image_006.jpg", "image_007.jpg" };
            images[3] = new string[2] { "Lena_1.jpg", "Lena_2.jpg" };
            images[4] = new string[2] { "sailboat_at_anchor_1.jpg", "sailboat_at_anchor_2.jpg" };
            getCoeffDraw(images);
        }

        public void getCoeffDraw(string[][] images) {
            for (int i = 0; i < images.Length; i++) {
                for (int j = 0; j < images[i].Length; j++) {
                    int[][] dct = getDct(images[i][j]);                    
                    drawHist(dct, images[i][j]);
                }
            }
        }

        void drawHist(int[][] dct, string filename) {
            int length = 0;
            int[] maxs = new int[dct.Length];
            int[] mins = new int[dct.Length];
            for (int i = 0; i < maxs.Length; i++) {
                maxs[i] = dct[i].Max();
                mins[i] = dct[i].Min();
            }
            int max = maxs.Max();
            int min = mins.Min();
            if (min < 0) {
                length = max + Math.Abs(min) + 1;
                min = Math.Abs(min);
            }
                /*if (min % 2 != 1) {
                    //min++;
                    //length++;
                }
                } else {
                   // length = max + 1;
                    //min = 0;
                }*/
            int[] count = new int[length];
            for (int i = 0; i < length; i++) {
                count[i] = 0;
            }
            for (int i = 0; i < dct.Length; i++) {
                for (int j = 0; j < dct[i].Length; j++) {
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
            for (int i = 0; i < x.Length; i++) {
                x[i] = count[i * 2 + c1];
                y[i] = count[2 * i + c2];
                z[k] = (x[i] + y[i]) / 2;
                k++;
                if (k == min) {
                    c1 = -1;
                    c2 = 0;
                }
                z[k] = (x[i] + y[i]) / 2;
                k++;
            }

            FormHist hist = new FormHist(count, z, min, filename);
            histForms.Add(hist);
            hist.Show();
        }

        int[][] getDct(string filename) {
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
            for (int i = 0; i < height * width; i++) {
                result[i] = new int[size];
            }
            for (int i = 0; i < height; i++) {
                for (int j = 0; j < width; j++) {
                    for (int k = 0; k < 64; k++) {
                        result[i * width + j][k] = dct[i][j][k];
                    }
                }
            }
            return result;
        }

    }
}
