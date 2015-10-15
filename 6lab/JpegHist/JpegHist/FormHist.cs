using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ZedGraph;

namespace JpegHist
{
    public partial class FormHist : Form
    {
        public FormHist(int[] count, int[] z, int min, string filename)
        {
            InitializeComponent();
            this.Text = filename;
            drawHist(count, z, min, zgcHist, filename);
        }

        public void drawHist(int[] count, int[] z, int min, ZedGraphControl zgc, string filename) {
            int[] x = new int[count.Length];
            for (int i = 0; i < x.Length; i++)
            {
                x[i] = i - min;
            }
            draw(x, count, z, zgc, filename);
        }

        private void draw(int[] x, int[] y, int[] z, ZedGraphControl zgcHist, string filename) {
            GraphPane pane = zgcHist.GraphPane;
            pane.CurveList.Clear();
            PointPairList list = new PointPairList();
            PointPairList list2 = new PointPairList();
            for (long j = 0; j < x.Length; j++) {
                list.Add(x[j], y[j]);
                list2.Add(x[j], z[j]);
            }

            pane.AddBar("Histogram", list, Color.Black);
            pane.AddCurve("The mean", list2, Color.Coral, SymbolType.None);
            pane.YAxis.Scale.Min = 0;
            pane.YAxis.Scale.Max = 1.1*y.Max();

            pane.XAxis.Scale.Min = -100;
            pane.XAxis.Scale.Max = 100;

            zgcHist.AxisChange();
            zgcHist.Invalidate();
        }
    }
}
