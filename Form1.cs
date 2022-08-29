using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BTL_dotNET.Control;


namespace BTL_dotNET
{
    public partial class Form1 : Form
    {
        public Form1()  
        {
            InitializeComponent();
            string ServerName = "DESKTOP-JKL7N61\\SQLEXPRESS";
            string DatabaseName = "QLNV";
            UtilityDB.openConnectionDB(ServerName, DatabaseName);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text;
            string password = txtpass.Text;
            string sql = "Select * from ADMIN_ACCOUNT where Username ='" + username +
                            "' and Passwords = '" + password + "'";
            DataTable dtb = UtilityDB.getDatafromDB(sql);
            if (dtb.Rows.Count == 1){
                dashboard db = new dashboard();
                this.Hide();
                db.Show();
            }
            else
            {
                MessageBox.Show("Tài khoản hoặc mật khẩu sai!");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Bạn có muốn thoát chương trình không?","Thoát chương trình",
                MessageBoxButtons.YesNoCancel, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Close();
            }
        }
    }
}
