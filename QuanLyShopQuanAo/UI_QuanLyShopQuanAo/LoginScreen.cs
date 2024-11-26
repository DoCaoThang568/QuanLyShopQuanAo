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
    public partial class LoginScreen : Form
    {
        DBConnect DBConnect = new DBConnect();
        DataTable dt_taikhoan = new DataTable();

        public LoginScreen()
        {
            InitializeComponent();
            txt_matKhau.UseSystemPasswordChar = true;
        }

        private void btn_dangNhap_Click(object sender, EventArgs e)
        {
            if (txt_taiKhoan.Text.Length == 0 || txt_matKhau.Text.Length == 0)
            {
                MessageBox.Show("Mã nhân viên hoặc mật khẩu trống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Lấy danh sách tài khoản
                string sql = "select * from NHANVIEN";
                dt_taikhoan = DBConnect.getDataTable(sql);
                dt_taikhoan.PrimaryKey = new DataColumn[] { dt_taikhoan.Columns["MANV"] };
                DataRow dr = dt_taikhoan.Rows.Find(txt_taiKhoan.Text);
                if (dr != null) // Kiểm tra có tồn tại tài khoản trong hệ thống không
                {
                    if (txt_matKhau.Text == dr["MATKHAU"].ToString()) // Nếu có kiểm tra mật khẩu
                    {
                        this.Hide();
                        MainScreen mainScreen = new MainScreen();
                        mainScreen.Show();

                    }
                    else // Nếu không hiện thông báo sai thông tin
                    {
                        MessageBox.Show("Mã nhân viên hoặc mật khẩu không đúng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                else
                {
                    MessageBox.Show("Mã nhân viên hoặc mật khẩu không đúng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
    }
}
