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
    public partial class UC_KhuyenMai : UserControl
    {
        DBConnect DBConnect = new DBConnect();
        DataTable dataKhuyenMai = new DataTable();

        public UC_KhuyenMai()
        {
            InitializeComponent();
            LoadDataKhuyenMai();
        }

        public void LoadDataKhuyenMai()
        {
            // Load dữ liệu từ database
            // Hiển thị lên DataGridView
            string sql = "SELECT * FROM KHUYENMAI";
            dataKhuyenMai = DBConnect.getDataTable(sql);

            foreach (DataRow row in dataKhuyenMai.Rows)
            {
                int rowIndex = dtgrv_khuyenMai.Rows.Add();
                DataGridViewRow newrow = dtgrv_khuyenMai.Rows[rowIndex];

                newrow.Cells["MaKM"].Value = row["MaKM"];
                newrow.Cells["TenKM"].Value = row["TenKM"];
                newrow.Cells["GiaTriKM"].Value = row["GiaTriKM"];
            }
        }
    }
}
