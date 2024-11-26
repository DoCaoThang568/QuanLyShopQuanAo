namespace UI_QuanLyShopQuanAo
{
    partial class UC_PhieuNhap
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UC_PhieuNhap));
            Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderEdges borderEdges1 = new Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderEdges();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dtgrv_phieuNhap = new System.Windows.Forms.DataGridView();
            this.btn_them = new Bunifu.UI.WinForms.BunifuButton.BunifuButton();
            this.MAPN = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MANV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MANCC = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NGAYNHAP = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TONGTIENPN = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dtgrv_phieuNhap)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgrv_phieuNhap
            // 
            this.dtgrv_phieuNhap.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgrv_phieuNhap.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgrv_phieuNhap.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MAPN,
            this.MANV,
            this.MANCC,
            this.NGAYNHAP,
            this.TONGTIENPN});
            this.dtgrv_phieuNhap.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dtgrv_phieuNhap.Location = new System.Drawing.Point(0, 48);
            this.dtgrv_phieuNhap.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dtgrv_phieuNhap.Name = "dtgrv_phieuNhap";
            this.dtgrv_phieuNhap.RowHeadersVisible = false;
            this.dtgrv_phieuNhap.RowHeadersWidth = 51;
            this.dtgrv_phieuNhap.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgrv_phieuNhap.Size = new System.Drawing.Size(695, 286);
            this.dtgrv_phieuNhap.TabIndex = 0;
            // 
            // btn_them
            // 
            this.btn_them.AllowAnimations = true;
            this.btn_them.AllowMouseEffects = true;
            this.btn_them.AllowToggling = false;
            this.btn_them.AnimationSpeed = 200;
            this.btn_them.AutoGenerateColors = false;
            this.btn_them.AutoRoundBorders = false;
            this.btn_them.AutoSizeLeftIcon = true;
            this.btn_them.AutoSizeRightIcon = true;
            this.btn_them.BackColor = System.Drawing.Color.Transparent;
            this.btn_them.BackColor1 = System.Drawing.Color.DodgerBlue;
            this.btn_them.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btn_them.BackgroundImage")));
            this.btn_them.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btn_them.ButtonText = "Thêm mới";
            this.btn_them.ButtonTextMarginLeft = 0;
            this.btn_them.ColorContrastOnClick = 45;
            this.btn_them.ColorContrastOnHover = 45;
            this.btn_them.Cursor = System.Windows.Forms.Cursors.Default;
            borderEdges1.BottomLeft = true;
            borderEdges1.BottomRight = true;
            borderEdges1.TopLeft = true;
            borderEdges1.TopRight = true;
            this.btn_them.CustomizableEdges = borderEdges1;
            this.btn_them.DialogResult = System.Windows.Forms.DialogResult.None;
            this.btn_them.DisabledBorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(191)))), ((int)(((byte)(191)))), ((int)(((byte)(191)))));
            this.btn_them.DisabledFillColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(204)))), ((int)(((byte)(204)))));
            this.btn_them.DisabledForecolor = System.Drawing.Color.FromArgb(((int)(((byte)(168)))), ((int)(((byte)(160)))), ((int)(((byte)(168)))));
            this.btn_them.FocusState = Bunifu.UI.WinForms.BunifuButton.BunifuButton.ButtonStates.Pressed;
            this.btn_them.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btn_them.ForeColor = System.Drawing.Color.White;
            this.btn_them.IconLeftAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_them.IconLeftCursor = System.Windows.Forms.Cursors.Default;
            this.btn_them.IconLeftPadding = new System.Windows.Forms.Padding(11, 3, 3, 3);
            this.btn_them.IconMarginLeft = 11;
            this.btn_them.IconPadding = 10;
            this.btn_them.IconRightAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_them.IconRightCursor = System.Windows.Forms.Cursors.Default;
            this.btn_them.IconRightPadding = new System.Windows.Forms.Padding(3, 3, 7, 3);
            this.btn_them.IconSize = 25;
            this.btn_them.IdleBorderColor = System.Drawing.Color.DodgerBlue;
            this.btn_them.IdleBorderRadius = 1;
            this.btn_them.IdleBorderThickness = 1;
            this.btn_them.IdleFillColor = System.Drawing.Color.DodgerBlue;
            this.btn_them.IdleIconLeftImage = null;
            this.btn_them.IdleIconRightImage = null;
            this.btn_them.IndicateFocus = false;
            this.btn_them.Location = new System.Drawing.Point(4, 4);
            this.btn_them.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_them.Name = "btn_them";
            this.btn_them.OnDisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(191)))), ((int)(((byte)(191)))), ((int)(((byte)(191)))));
            this.btn_them.OnDisabledState.BorderRadius = 1;
            this.btn_them.OnDisabledState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btn_them.OnDisabledState.BorderThickness = 1;
            this.btn_them.OnDisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(204)))), ((int)(((byte)(204)))));
            this.btn_them.OnDisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(168)))), ((int)(((byte)(160)))), ((int)(((byte)(168)))));
            this.btn_them.OnDisabledState.IconLeftImage = null;
            this.btn_them.OnDisabledState.IconRightImage = null;
            this.btn_them.onHoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(105)))), ((int)(((byte)(181)))), ((int)(((byte)(255)))));
            this.btn_them.onHoverState.BorderRadius = 1;
            this.btn_them.onHoverState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btn_them.onHoverState.BorderThickness = 1;
            this.btn_them.onHoverState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(105)))), ((int)(((byte)(181)))), ((int)(((byte)(255)))));
            this.btn_them.onHoverState.ForeColor = System.Drawing.Color.White;
            this.btn_them.onHoverState.IconLeftImage = null;
            this.btn_them.onHoverState.IconRightImage = null;
            this.btn_them.OnIdleState.BorderColor = System.Drawing.Color.DodgerBlue;
            this.btn_them.OnIdleState.BorderRadius = 1;
            this.btn_them.OnIdleState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btn_them.OnIdleState.BorderThickness = 1;
            this.btn_them.OnIdleState.FillColor = System.Drawing.Color.DodgerBlue;
            this.btn_them.OnIdleState.ForeColor = System.Drawing.Color.White;
            this.btn_them.OnIdleState.IconLeftImage = null;
            this.btn_them.OnIdleState.IconRightImage = null;
            this.btn_them.OnPressedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(96)))), ((int)(((byte)(144)))));
            this.btn_them.OnPressedState.BorderRadius = 1;
            this.btn_them.OnPressedState.BorderStyle = Bunifu.UI.WinForms.BunifuButton.BunifuButton.BorderStyles.Solid;
            this.btn_them.OnPressedState.BorderThickness = 1;
            this.btn_them.OnPressedState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(40)))), ((int)(((byte)(96)))), ((int)(((byte)(144)))));
            this.btn_them.OnPressedState.ForeColor = System.Drawing.Color.White;
            this.btn_them.OnPressedState.IconLeftImage = null;
            this.btn_them.OnPressedState.IconRightImage = null;
            this.btn_them.Size = new System.Drawing.Size(123, 40);
            this.btn_them.TabIndex = 1;
            this.btn_them.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.btn_them.TextAlignment = System.Windows.Forms.HorizontalAlignment.Center;
            this.btn_them.TextMarginLeft = 0;
            this.btn_them.TextPadding = new System.Windows.Forms.Padding(0);
            this.btn_them.UseDefaultRadiusAndThickness = true;
            // 
            // MAPN
            // 
            this.MAPN.HeaderText = "Mã phiếu nhập";
            this.MAPN.MinimumWidth = 6;
            this.MAPN.Name = "MAPN";
            // 
            // MANV
            // 
            this.MANV.HeaderText = "Mã nhân viên";
            this.MANV.MinimumWidth = 6;
            this.MANV.Name = "MANV";
            // 
            // MANCC
            // 
            this.MANCC.HeaderText = "Nhà cung cấp";
            this.MANCC.MinimumWidth = 6;
            this.MANCC.Name = "MANCC";
            // 
            // NGAYNHAP
            // 
            dataGridViewCellStyle1.Format = "d";
            dataGridViewCellStyle1.NullValue = null;
            this.NGAYNHAP.DefaultCellStyle = dataGridViewCellStyle1;
            this.NGAYNHAP.HeaderText = "Ngày nhập";
            this.NGAYNHAP.MinimumWidth = 6;
            this.NGAYNHAP.Name = "NGAYNHAP";
            // 
            // TONGTIENPN
            // 
            dataGridViewCellStyle2.Format = "C2";
            dataGridViewCellStyle2.NullValue = "0";
            this.TONGTIENPN.DefaultCellStyle = dataGridViewCellStyle2;
            this.TONGTIENPN.HeaderText = "Thành tiền";
            this.TONGTIENPN.MinimumWidth = 6;
            this.TONGTIENPN.Name = "TONGTIENPN";
            // 
            // UC_PhieuNhap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btn_them);
            this.Controls.Add(this.dtgrv_phieuNhap);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "UC_PhieuNhap";
            this.Size = new System.Drawing.Size(695, 334);
            ((System.ComponentModel.ISupportInitialize)(this.dtgrv_phieuNhap)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgrv_phieuNhap;
        private Bunifu.UI.WinForms.BunifuButton.BunifuButton btn_them;
        private System.Windows.Forms.DataGridViewTextBoxColumn MAPN;
        private System.Windows.Forms.DataGridViewTextBoxColumn MANV;
        private System.Windows.Forms.DataGridViewTextBoxColumn MANCC;
        private System.Windows.Forms.DataGridViewTextBoxColumn NGAYNHAP;
        private System.Windows.Forms.DataGridViewTextBoxColumn TONGTIENPN;
    }
}
