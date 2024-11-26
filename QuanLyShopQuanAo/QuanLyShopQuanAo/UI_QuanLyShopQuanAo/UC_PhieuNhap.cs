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
    public partial class UC_PhieuNhap : UserControl
    {
        DBConnect DBConnect = new DBConnect();
        DataTable dataPhieuNhap = new DataTable();

        public UC_PhieuNhap()
        {
            InitializeComponent();
            LoadDataPhieuNhap();
        }

        public void LoadDataPhieuNhap()
        {
            // Load dữ liệu từ database
            // Hiển thị lên DataGridView
            string sql = "SELECT * FROM PHIEUNHAP";
            dataPhieuNhap = DBConnect.getDataTable(sql);

            foreach (DataRow row in dataPhieuNhap.Rows)
            {
                int rowIndex = dtgrv_phieuNhap.Rows.Add();
                DataGridViewRow newrow = dtgrv_phieuNhap.Rows[rowIndex];

                newrow.Cells["MaPN"].Value = row["MaPN"];
                newrow.Cells["MaNV"].Value = row["MaNV"];
                newrow.Cells["MaNCC"].Value = row["MaNCC"];
                newrow.Cells["NgayNhap"].Value = row["NgayNhap"];
                newrow.Cells["TongTienPN"].Value = row["TongTienPN"];
            }
        }
    }
}
