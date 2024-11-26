using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utility;

namespace UI_QuanLyShopQuanAo
{
    public partial class UC_HoaDon_Them : UserControl
    {
        DBConnect DBConnect = new DBConnect();
        DataTable dtChiTietHoaDon = new DataTable();

        public UC_HoaDon_Them()
        {
            InitializeComponent();
            LoadComboBoxData();
        }

        private void LoadComboBoxData()
        {
            DataTable dt = DBConnect.getDataTable("SELECT * FROM KhachHang");
            cbo_khachHang.DataSource = dt;
            cbo_khachHang.DisplayMember = "TenKH";
            cbo_khachHang.ValueMember = "MaKH";

            DataTable dt2 = DBConnect.getDataTable("SELECT * FROM NhanVien");
            cbo_nhanVien.DataSource = dt2;
            cbo_nhanVien.DisplayMember = "TenNV";
            cbo_nhanVien.ValueMember = "MaNV";

            DataTable dt3 = DBConnect.getDataTable("SELECT * FROM KhuyenMai");
            cbo_khuyenMai.DataSource = dt3;
            cbo_khuyenMai.DisplayMember = "TenKM";
            cbo_khuyenMai.ValueMember = "MaKM";
        }

        private void InitializeChiTietHoaDonTable()
        {
            dtChiTietHoaDon.Columns.Add("MASP", typeof(string));
            dtChiTietHoaDon.Columns.Add("TENSP", typeof(string));
            dtChiTietHoaDon.Columns.Add("SOLUONG", typeof(int));
            dtChiTietHoaDon.Columns.Add("DONGIA", typeof(decimal));
            dtChiTietHoaDon.Columns.Add("THANHTIEN", typeof(decimal));

            dtgrv_chiTietHD.DataSource = dtChiTietHoaDon;
        }

        private void btn_themSanPham_Click(object sender, EventArgs e)
        {

        }

        private void btn_taoHoaDon_Click(object sender, EventArgs e)
        {
            try
            {
                string maNV = cbo_nhanVien.SelectedValue?.ToString();
                string maKH = cbo_khachHang.SelectedValue?.ToString();
                string maKM = cbo_khuyenMai.SelectedValue?.ToString();

                // Tính tổng tiền hóa đơn
                decimal tongTienHD = 0;

                foreach (DataRow row in dtChiTietHoaDon.Rows)
                {
                    tongTienHD += (decimal)row["THANHTIEN"];
                }

                string sql = "INSERT INTO HOADON (MANV, MAKH, MAKM, TONGTIENHD) " +
                             "VALUES (@MANV, @MAKH, @MAKM, @TONGTIENHD); SELECT SCOPE_IDENTITY();";

                DBConnect.openConnect();
                SqlCommand cmd = new SqlCommand(sql, DBConnect.conn);

                cmd.Parameters.AddWithValue("@MANV", maNV);
                cmd.Parameters.AddWithValue("@MAKH", maKH);

                if (string.IsNullOrEmpty(maKM))
                {
                    cmd.Parameters.AddWithValue("@MAKM", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@MAKM", maKM);
                }

                cmd.Parameters.AddWithValue("@TONGTIENHD", tongTienHD);
                int maHD = Convert.ToInt32(cmd.ExecuteScalar());

                // Lưu chi tiết hóa đơn
                foreach (DataRow row in dtChiTietHoaDon.Rows)
                {
                    string sqlChiTiet = "INSERT INTO CHITIETHOADON (MAHD, MASP, SOLUONG, DONGIA) " +
                                        "VALUES (@MAHD, @MASP, @SOLUONG, @DONGIA)";

                    SqlCommand cmdChiTiet = new SqlCommand(sqlChiTiet, DBConnect.conn);
                    cmdChiTiet.Parameters.AddWithValue("@MAHD", maHD);
                    cmdChiTiet.Parameters.AddWithValue("@MASP", row["MASP"]);
                    cmdChiTiet.Parameters.AddWithValue("@SOLUONG", row["SOLUONG"]);
                    cmdChiTiet.Parameters.AddWithValue("@DONGIA", row["DONGIA"]);

                    cmdChiTiet.ExecuteNonQuery();

                }

                DBConnect.closeConnect();
                OnHoaDonCreated?.Invoke();
                this.Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public event Action OnHoaDonCreated;

        private void UC_HoaDon_Them_Load(object sender, EventArgs e)
        {
            LoadComboBoxData();
        }
    }
}
