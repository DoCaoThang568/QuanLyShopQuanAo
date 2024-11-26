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
    public partial class ThemSanPham : Form
    {
        private DBConnect DBConnect = new DBConnect();
        public string MaSP { get; private set; }
        public int SoLuong { get; private set; }
        public decimal DonGia { get; private set; }

        public ThemSanPham()
        {
            InitializeComponent();
            LoadSanPham();
        }

        private void LoadSanPham()
        {
            try
            {
                string query = "SELECT MASP, TENSP FROM SANPHAM"; // Lấy MaSP và TenSP
                DataTable dt = DBConnect.getDataTable(query);

                cbo_sanPham.DataSource = dt;
                cbo_sanPham.DisplayMember = "TENSP";
                cbo_sanPham.ValueMember = "MASP";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi tải danh sách sản phẩm: " + ex.Message);
            }
        }

        private void cboSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbo_sanPham.SelectedValue != null)
            {
                string maSP = cbo_sanPham.SelectedValue.ToString();
                try
                {
                    string query = "SELECT TENSP, GIABAN FROM SANPHAM WHERE MASP = @MASP";
                    using (SqlConnection connection = DBConnect.GetConnection())
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@MASP", maSP);
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    txt_donGia.Text = Convert.ToDecimal(reader["GIABAN"]).ToString("N0");
                                    DonGia = Convert.ToDecimal(reader["GIABAN"]); // Lưu DonGia
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi khi lấy thông tin sản phẩm: " + ex.Message);
                }
            }
        }



        private void btnOK_Click(object sender, EventArgs e)
        {
            if (cbo_sanPham.SelectedValue == null)
            {
                MessageBox.Show("Vui lòng chọn sản phẩm.");
                return;
            }

            MaSP = cbo_sanPham.SelectedValue.ToString();


            if (int.TryParse(num_soLuong.Value.ToString(), out int soLuong) && soLuong > 0)
            {
                SoLuong = soLuong;
            }
            else
            {
                MessageBox.Show("Số lượng phải là số nguyên dương.");
                return;
            }

            DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            this.Close();
        }
    }
}
