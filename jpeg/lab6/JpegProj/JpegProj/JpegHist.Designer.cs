namespace JpegProj
{
    partial class JpegHist
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.zgcHist = new ZedGraph.ZedGraphControl();
            this.SuspendLayout();
            // 
            // zgcHist
            // 
            this.zgcHist.Location = new System.Drawing.Point(12, 12);
            this.zgcHist.Name = "zgcHist";
            this.zgcHist.ScrollGrace = 0D;
            this.zgcHist.ScrollMaxX = 0D;
            this.zgcHist.ScrollMaxY = 0D;
            this.zgcHist.ScrollMaxY2 = 0D;
            this.zgcHist.ScrollMinX = 0D;
            this.zgcHist.ScrollMinY = 0D;
            this.zgcHist.ScrollMinY2 = 0D;
            this.zgcHist.Size = new System.Drawing.Size(620, 291);
            this.zgcHist.TabIndex = 0;
            // 
            // JpegHist
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(644, 315);
            this.Controls.Add(this.zgcHist);
            this.Name = "JpegHist";
            this.Text = "JpegHist";
            this.ResumeLayout(false);

        }

        #endregion

        private ZedGraph.ZedGraphControl zgcHist;

    }
}