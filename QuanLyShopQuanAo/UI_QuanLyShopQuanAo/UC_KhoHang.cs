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
    public partial class UC_KhoHang : UserControl
    {
        DBConnect DBConnect = new DBConnect();
        DataTable dataKhoHang = new DataTable();

        public UC_KhoHang()
        {
            InitializeComponent();
            LoadDataKhoHang();
        }

        public void LoadDataKhoHang()
        {
            // Load dữ liệu từ database
            // Hiển thị lên DataGridView
            string sql = "SELECT * FROM SANPHAM";
            dataKhoHang = DBConnect.getDataTable(sql);

            foreach (DataRow row in dataKhoHang.Rows)
            {
                int rowIndex = dtgrv_khoHang.Rows.Add();
                DataGridViewRow newrow = dtgrv_khoHang.Rows[rowIndex];

                newrow.Cells["MaSP"].Value = row["MaSP"];
                newrow.Cells["TenSP"].Value = row["TenSP"];
                newrow.Cells["MaLoaiSP"].Value = row["MaLoaiSP"];
                newrow.Cells["GiaBan"].Value = row["GiaBan"];
                newrow.Cells["SoLuongTon"].Value = row["SoLuongTon"];
                newrow.Cells["MoTa"].Value = row["MoTa"];
                newrow.Cells["HinhAnh"].Value = row["HinhAnh"];
            }
        }
    }
}
