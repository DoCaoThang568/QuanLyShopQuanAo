using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI_QuanLyShopQuanAo
{
    public partial class MainScreen : Form
    {
        public UC_HoaDon ucHoaDon; // Khởi tạo UC_HoaDon
        public UC_HoaDon_Them ucHoaDonThem; // Khởi tạo UC_HoaDon_Them
        public MainScreen()
        {
            InitializeComponent();
            ucHoaDon = new UC_HoaDon(); // khởi tạo instance
            ucHoaDonThem = new UC_HoaDon_Them(); // khởi tạo instance
        }

        public void ShowUserControl(UserControl userControl)
        {
            panelContainer.Controls.Clear();
            panelContainer.Controls.Add(userControl);
            userControl.Dock = DockStyle.Fill;
            userControl.BringToFront(); // Đưa UserControl lên trên cùng
        }

        private void btn_hoaDon_Click(object sender, EventArgs e)
        {
            // Kiểm tra xem UC_HoaDon đã tồn tại trong panelContainer chưa
            UC_HoaDon existingUC = panelContainer.Controls.OfType<UC_HoaDon>().FirstOrDefault();

            if (existingUC != null)
            {
                // Nếu đã tồn tại, xóa nó đi
                panelContainer.Controls.Remove(existingUC);
                existingUC.Dispose(); // Giải phóng tài nguyên
            }
            else
            {
                // Nếu chưa tồn tại, thêm mới
                ShowUserControl(new UC_HoaDon());
            }
        }

        private void btn_phieuNhap_Click(object sender, EventArgs e)
        {
            UC_PhieuNhap existingUC = panelContainer.Controls.OfType<UC_PhieuNhap>().FirstOrDefault();

            if (existingUC != null)
            {
                panelContainer.Controls.Remove(existingUC);
                existingUC.Dispose();
            }
            else
            {
                ShowUserControl(new UC_PhieuNhap());
            }
        }

        private void btn_khuyenMai_Click(object sender, EventArgs e)
        {
            UC_KhuyenMai existingUC = panelContainer.Controls.OfType<UC_KhuyenMai>().FirstOrDefault();

            if (existingUC != null)
            {
                panelContainer.Controls.Remove(existingUC);
                existingUC.Dispose();
            }
            else
            {
                ShowUserControl(new UC_KhuyenMai());
            }
        }

        private void btn_khoHang_Click(object sender, EventArgs e)
        {
            UC_KhoHang existingUC = panelContainer.Controls.OfType<UC_KhoHang>().FirstOrDefault();

            if (existingUC != null)
            {
                panelContainer.Controls.Remove(existingUC);
                existingUC.Dispose();
            }
            else
            {
                ShowUserControl(new UC_KhoHang());
            }
        }



        private void panelContainer_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btn_close_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
