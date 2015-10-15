using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ZedGraph;

namespace JpegFormProj
{
    public partial class HistForm : Form
    {
        public HistForm(int[] count, int[] z, int min, string filename, int[] B, double hi2, double[] hi2_arr)
        {
            InitializeComponent();
            this.Text = filename;
            labelHi2.Text = hi2.ToString();
            DrawHist(count, z, min, zgcHist, filename, B, hi2_arr);
        }

        public void DrawHist(int[] count, int[] z, int min, ZedGraphControl zgc, string filename, int[] B, double[] hi2_arr)
        {
            int[] x = new int[count.Length];
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = i - min;
            }
            Draw(x, count, z, zgc, filename);
            DrawLSB(B, filename, hi2_arr);
        }

        private void Draw(int[] x, int[] y, int[] z, ZedGraphControl zgcHist, string filename)
        {
            GraphPane pane = zgcHist.GraphPane;
            pane.CurveList.Clear();
            PointPairList list = new PointPairList();
            PointPairList list2 = new PointPairList();
            for (long j = 0; j < x.Length; j++)
            {
                list.Add(x[j], y[j]);
                list2.Add(x[j], z[j]);
            }

            pane.AddBar("Гистограмма", list, Color.IndianRed);
            pane.AddCurve("Ожидаемый результат", list2, Color.Crimson, SymbolType.None);
            pane.YAxis.Scale.Min = 0;
            pane.YAxis.Scale.Max = 1.1*y.Max();

            pane.XAxis.Scale.Min = -100;
            pane.XAxis.Scale.Max = 100;

            pane.Title.Text = filename;
            zgcHist.AxisChange();
            zgcHist.Invalidate();
        }

        public void DrawLSB(int[] B, string filename, double[] hi2_arr)
        {
            labelB.Text = B.Sum().ToString();
            DrawLSB(hi2_arr, zgcLSB, filename);
        }

        private void DrawLSB(double[] B, ZedGraphControl zgc, string filename)
        {
            GraphPane pane = zgc.GraphPane;
            pane.CurveList.Clear();
            PointPairList list = new PointPairList();
            int x = 0;
            for (long j = 0; j < B.Length; j++)
            {
                //if (x[j] != 0)
                {
                    list.Add(x, B[j]);
                    x++;
                }
            }

            //BurlyWood Coral DarkMagenta
            //LineItem myCurve = pane.AddCurve("Гистограмма", list, Color.Coral, SymbolType.None);
            //Color color = Color.FromArgb(100, Color.Coral);
            //myCurve.Line.Fill = new ZedGraph.Fill(color);
            pane.AddCurve("B = (m00 - m01)/2 + (m11 - m10)/2", list, Color.Crimson, SymbolType.None);
            //pane.AddBar("Ожидаемый результат", list2, Color.CadetBlue);
            pane.YAxis.Scale.Min = 0;
            pane.YAxis.Scale.Max = 1.1 * B.Max();

            pane.XAxis.Scale.Min = 0;
            pane.XAxis.Scale.Max = x;

            pane.Title.Text = filename;
            zgc.AxisChange();
            zgc.Invalidate();
        }

        public void SetHi2Label(string value)
        {
            labelHi2.Text = value;
        }

        public void SetRSLabel(string value)
        {
            //labelRS.Text = value;
        }
    }
}
