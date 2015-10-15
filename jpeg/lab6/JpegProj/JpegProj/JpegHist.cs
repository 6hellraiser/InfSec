using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ZedGraph;
using System.Drawing;

namespace JpegProj
{
    public partial class JpegHist : Form
    {
        string filename;

        public JpegHist(int[] count, int[] z, int min, string fname)
        {
            InitializeComponent();
            filename = fname;
            int[] x = new int[count.Length];
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = i - min;
            }
            //Draw(x, count, z);
            //Draw();
        }

        private void Draw()
        {
            int[] x = { 1, 2, 3, 4, 5 };
            int[] y = { 5, 4, 3, 2, 1 };
            GraphPane pane = zgcHist.GraphPane;
            pane.CurveList.Clear();
            PointPairList list = new PointPairList();
            for (long j = 0; j < x.Length; j++)
            {
                if (x[j] != 0)
                {
                    list.Add(x[j], y[j]);
                }
            }

            //BurlyWood Coral DarkMagenta
            LineItem myCurve = pane.AddCurve("Curve", list, Color.Coral, SymbolType.None);
            //Color color = Color.FromArgb(100, Color.Coral);
            //myCurve.Line.Fill = new ZedGraph.Fill(color);
            pane.YAxis.Scale.Min = 0;
            pane.YAxis.Scale.Max = 1.1 * y.Max();

            zgcHist.AxisChange();
            zgcHist.Invalidate();
        }

        private void Draw(int[] x, int[] y, int[] z)
        {
            GraphPane pane = zgcHist.GraphPane;
            pane.CurveList.Clear();
            PointPairList list = new PointPairList();
            PointPairList list2 = new PointPairList();
            for (long j = 0; j < x.Length; j++)
            {
                if (x[j] != 0)
                {
                    list.Add(x[j], y[j]);
                    list2.Add(x[j], z[j]);
                }
            }
            
            //BurlyWood Coral DarkMagenta
            LineItem myCurve = pane.AddCurve("Гистограмма", list, Color.Coral, SymbolType.None);
            //Color color = Color.FromArgb(100, Color.Coral);
            //myCurve.Line.Fill = new ZedGraph.Fill(color);
            pane.AddCurve("Ожидаемый результат", list2, Color.BurlyWood, SymbolType.None);
            pane.YAxis.Scale.Min = 0;
            pane.YAxis.Scale.Max = 1.1*y.Max();

            pane.Title.Text = filename;
            zgcHist.AxisChange();
            zgcHist.Invalidate();
        }
    }
}
