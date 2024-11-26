using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utility;

namespace UI_QuanLyShopQuanAo
{
    public partial class UC_HoaDon : UserControl
    {
        DBConnect DBConnect = new DBConnect();
        DataTable dataHoaDon = new DataTable();

        public UC_HoaDon()
        {
            InitializeComponent();
            LoadDataHoaDon();

            if (this.ParentForm is MainScreen mainScreen)
            {
                mainScreen.ucHoaDonThem.OnHoaDonCreated += LoadDataHoaDon;
            }
        }

        public void LoadDataHoaDon()
        {
            // Load dữ liệu từ database
            // Hiển thị lên DataGridView
            string sql = "SELECT * FROM HOADON";
            dataHoaDon = DBConnect.getDataTable(sql);

            foreach (DataRow row in dataHoaDon.Rows)
            {
                int rowIndex = dtgrv_hoaDon.Rows.Add();
                DataGridViewRow newrow = dtgrv_hoaDon.Rows[rowIndex];

                newrow.Cells["MaHD"].Value = row["MaHD"];
                newrow.Cells["MaNV"].Value = row["MaNV"];
                newrow.Cells["MaKH"].Value = row["MaKH"];
                newrow.Cells["NgayLap"].Value = row["NgayLap"];
                newrow.Cells["TongTienHD"].Value = row["TongTienHD"];
            }
        }
        private void btn_themHoaDon_Click(object sender, EventArgs e)
        {
            if (this.ParentForm is MainScreen mainScreen)
            {
                mainScreen.ShowUserControl(mainScreen.ucHoaDonThem);
            }
        }
    }
}
