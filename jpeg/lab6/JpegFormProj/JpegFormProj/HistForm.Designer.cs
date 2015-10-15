namespace JpegFormProj
{
    partial class HistForm
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
            this.label1 = new System.Windows.Forms.Label();
            this.labelHi2 = new System.Windows.Forms.Label();
            this.zgcLSB = new ZedGraph.ZedGraphControl();
            this.label2 = new System.Windows.Forms.Label();
            this.labelB = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // zgcHist
            // 
            this.zgcHist.Location = new System.Drawing.Point(3, 3);
            this.zgcHist.Name = "zgcHist";
            this.zgcHist.ScrollGrace = 0D;
            this.zgcHist.ScrollMaxX = 0D;
            this.zgcHist.ScrollMaxY = 0D;
            this.zgcHist.ScrollMaxY2 = 0D;
            this.zgcHist.ScrollMinX = 0D;
            this.zgcHist.ScrollMinY = 0D;
            this.zgcHist.ScrollMinY2 = 0D;
            this.zgcHist.Size = new System.Drawing.Size(895, 381);
            this.zgcHist.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(12, 387);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 24);
            this.label1.TabIndex = 2;
            this.label1.Text = "hi2:";
            // 
            // labelHi2
            // 
            this.labelHi2.AutoSize = true;
            this.labelHi2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelHi2.Location = new System.Drawing.Point(58, 387);
            this.labelHi2.Name = "labelHi2";
            this.labelHi2.Size = new System.Drawing.Size(35, 24);
            this.labelHi2.TabIndex = 3;
            this.labelHi2.Text = "hi2";
            // 
            // zgcLSB
            // 
            this.zgcLSB.Location = new System.Drawing.Point(3, 414);
            this.zgcLSB.Name = "zgcLSB";
            this.zgcLSB.ScrollGrace = 0D;
            this.zgcLSB.ScrollMaxX = 0D;
            this.zgcLSB.ScrollMaxY = 0D;
            this.zgcLSB.ScrollMaxY2 = 0D;
            this.zgcLSB.ScrollMinX = 0D;
            this.zgcLSB.ScrollMinY = 0D;
            this.zgcLSB.ScrollMinY2 = 0D;
            this.zgcLSB.Size = new System.Drawing.Size(895, 252);
            this.zgcLSB.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(212, 387);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 24);
            this.label2.TabIndex = 5;
            this.label2.Text = "B:";
            // 
            // labelB
            // 
            this.labelB.AutoSize = true;
            this.labelB.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelB.Location = new System.Drawing.Point(245, 387);
            this.labelB.Name = "labelB";
            this.labelB.Size = new System.Drawing.Size(22, 24);
            this.labelB.TabIndex = 6;
            this.labelB.Text = "B";
            // 
            // HistForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(901, 655);
            this.Controls.Add(this.labelB);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.zgcLSB);
            this.Controls.Add(this.labelHi2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.zgcHist);
            this.Name = "HistForm";
            this.Text = "HistForm";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ZedGraph.ZedGraphControl zgcHist;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label labelHi2;
        private ZedGraph.ZedGraphControl zgcLSB;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label labelB;
    }
}