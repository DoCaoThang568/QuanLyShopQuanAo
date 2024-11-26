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
using System.IO;
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
            InitializeChiTietHoaDonTable();
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
            using (ThemSanPham formThemSP = new ThemSanPham())
            {
                if (formThemSP.ShowDialog() == DialogResult.OK)
                {
                    string maSP = formThemSP.MaSP;
                    int soLuong = formThemSP.SoLuong;
                    decimal donGia = formThemSP.DonGia;

                    // Kiểm tra sản phẩm đã tồn tại
                    DataRow[] existingRows = dtChiTietHoaDon.Select($"MASP = '{maSP}'");
                    if (existingRows.Length > 0)
                    {
                        existingRows[0]["SOLUONG"] = (int)existingRows[0]["SOLUONG"] + soLuong;
                        existingRows[0]["THANHTIEN"] = (int)existingRows[0]["SOLUONG"] * donGia;
                    }
                    else
                    {
                        DataRow newRow = dtChiTietHoaDon.NewRow();
                        newRow["MASP"] = maSP;
                        newRow["SOLUONG"] = soLuong;
                        newRow["DONGIA"] = donGia;
                        newRow["THANHTIEN"] = soLuong * donGia;
                        dtChiTietHoaDon.Rows.Add(newRow);
                    }

                    // Cập nhật tổng tiền
                    decimal tongTien = dtChiTietHoaDon.AsEnumerable().Sum(row => (decimal)row["THANHTIEN"]);
                    txt_tongTienHoaDon.Text = tongTien.ToString("N0"); //Format tiền tệ


                }
            }
        }

        private void btn_taoHoaDon_Click(object sender, EventArgs e)
        {
            if (dtChiTietHoaDon.Rows.Count == 0)
            {
                MessageBox.Show("Vui lòng thêm sản phẩm vào hóa đơn.");
                return;
            }

            try
            {
                string maNV = cbo_nhanVien.SelectedValue?.ToString();
                string maKH = cbo_khachHang.SelectedValue?.ToString();
                string maKM = cbo_khuyenMai.SelectedValue?.ToString();

                decimal tongTienHD = dtChiTietHoaDon.AsEnumerable().Sum(row => (decimal)row["THANHTIEN"]);

                string sql = "INSERT INTO HOADON (MANV, MAKH, MAKM, TONGTIENHD) " +
                             "VALUES (@MANV, @MAKH, @MAKM, @TONGTIENHD); SELECT SCOPE_IDENTITY();";


                using (SqlConnection connection = DBConnect.GetConnection())
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.Parameters.AddWithValue("@MANV", maNV);
                        cmd.Parameters.AddWithValue("@MAKH", maKH != null ? (object)maKH : DBNull.Value); // Xử lý trường hợp null
                        cmd.Parameters.AddWithValue("@MAKM", maKM != null ? (object)maKM : DBNull.Value); // Xử lý trường hợp null
                        cmd.Parameters.AddWithValue("@TONGTIENHD", tongTienHD);

                        int maHD = Convert.ToInt32(cmd.ExecuteScalar());

                        foreach (DataRow row in dtChiTietHoaDon.Rows)
                        {
                            string sqlChiTiet = "INSERT INTO CHITIETHOADON (MAHD, MASP, SOLUONG, DONGIA) " +
                                                "VALUES (@MAHD, @MASP, @SOLUONG, @DONGIA)";
                            using (SqlCommand cmdChiTiet = new SqlCommand(sqlChiTiet, connection))
                            {


                                cmdChiTiet.Parameters.AddWithValue("@MAHD", maHD);
                                cmdChiTiet.Parameters.AddWithValue("@MASP", row["MASP"]);
                                cmdChiTiet.Parameters.AddWithValue("@SOLUONG", row["SOLUONG"]);
                                cmdChiTiet.Parameters.AddWithValue("@DONGIA", row["DONGIA"]);
                                cmdChiTiet.ExecuteNonQuery();
                            }
                        }
                    }
                }
                OnHoaDonCreated?.Invoke();

                // Xóa dữ liệu cũ và cập nhật lại tổng tiền
                dtChiTietHoaDon.Rows.Clear();
                txt_tongTienHoaDon.Text = "0";
                this.Visible = false;

                MessageBox.Show("Tạo hóa đơn thành công!");
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
