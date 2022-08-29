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
    public partial class dashboard : Form
    {
        string sql = "select Manv as N'Mã nhân viên', Hoten as N'Họ tên', GT as N'Giới tính', NS as N'Ngày sinh', Sdt as N'Số điện thoại', Chucvu as N'Chức vụ'," + 
                " Diachi as N'Địa chỉ', BOPHAN.Tenbophan as N'Bộ phận', Tongluong as N'Tổng lương' from NHANVIEN, BOPHAN where NHANVIEN.Mabophan = BOPHAN.Mabophan";
        string manv, hoten, gioitinh, diachi, sdt, chucvu, bophan, ngaysinh, tongluong, search = "";

        private void btnsearch_Click(object sender, EventArgs e)
        {
            search = txtsearch.Text.ToUpper();
            if (search != "")
            {
                string sql_search = "select Manv as N'Mã nhân viên', Hoten as N'Họ tên', GT as N'Giới tính', NS as N'Ngày sinh', Sdt as N'Số điện thoại', Chucvu as N'Chức vụ'," +
                " Diachi as N'Địa chỉ', BOPHAN.Tenbophan as N'Bộ phận', Tongluong as N'Tổng lương' from NHANVIEN, BOPHAN where NHANVIEN.Mabophan = BOPHAN.Mabophan and Manv = '"+search+"'";
                dataGridView1.DataSource = UtilityDB.getDatafromDB(sql_search);
                if(dataGridView1.Rows.Count == 1)
                {
                    MessageBox.Show("Không tìm thấy kết quả :((");
                }

            }
            else
            {
                dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                MessageBox.Show("Vui lòng nhập từ khóa là 'Mã nhân viên' để thực tìm kiếm");
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
            int currentIndex = dataGridView1.CurrentRow.Index;
            txtmanv.Text = dataGridView1[0, currentIndex].Value.ToString();
            txtname.Text = dataGridView1[1, currentIndex].Value.ToString();
            cmbgender.Text = dataGridView1[2, currentIndex].Value.ToString();
            dateTimePicker1.Text = dataGridView1[3, currentIndex].Value.ToString();
            mtxtphone.Text = dataGridView1[4, currentIndex].Value.ToString();
            txtchucvu.Text = dataGridView1[5, currentIndex].Value.ToString();
            txtdiachi.Text = dataGridView1[6, currentIndex].Value.ToString();
            cmbbophan.Text = dataGridView1[7, currentIndex].Value.ToString();
            txtluong.Text = dataGridView1[8, currentIndex].Value.ToString();

        }



        public dashboard()
        {
            InitializeComponent();
            string ServerName = "DESKTOP-JKL7N61\\SQLEXPRESS";
            string DatabaseName = "QLNV";
            UtilityDB.openConnectionDB(ServerName, DatabaseName);
        }

        private void dashboard_Load(object sender, EventArgs e)
        {
            //load data from sql server to datagridview
            dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);

            //load data from sql server to combobox
            string sql_bophan = "Select * from BOPHAN";
            cmbbophan.DisplayMember = "Tenbophan";
            cmbbophan.ValueMember = "Mabophan";
            cmbbophan.DataSource = UtilityDB.getDatafromDB(sql_bophan);
        }


        private void txtsearch_Click(object sender, EventArgs e)
        {
            txtsearch.Clear();
        }

        



        private void btnthoat_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát chương trình?", "Thoát chương trình", MessageBoxButtons.YesNoCancel,
                MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                Close();
            }
        }

        private void btnthem_Click(object sender, EventArgs e)
        {
            try
            {
 
                manv = txtmanv.Text;
                hoten = txtname.Text;
                gioitinh = cmbgender.Text;
                ngaysinh = dateTimePicker1.Text;
                sdt = mtxtphone.Text;
                diachi = txtdiachi.Text;
                chucvu = txtchucvu.Text;
                bophan = cmbbophan.SelectedValue.ToString();
                tongluong = txtluong.Text;


                if (manv != "" && hoten != "" && gioitinh != ""  && sdt != "" && diachi != "" && chucvu != ""  && tongluong != "")
                {
                    string Manv = txtmanv.Text;
                    string sql_check = "select * from NHANVIEN where Manv = '"+Manv+"'";
                    dataGridView1.DataSource = UtilityDB.getDatafromDB(sql_check);
                    if(dataGridView1.Rows.Count == 1) {
                        string sql_add = "insert into NHANVIEN values ('" + manv + "', N'" + hoten + "', N'" + gioitinh + "', '" + ngaysinh + "'," +
                                   "'" + sdt + "', N'" + chucvu + "', N'" + diachi + "', N'" + bophan + "', '" + tongluong + "')";
                        UtilityDB.ExecuteQuery(sql_add);
                        dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);

                        //remove data from textboxes
                        Remove_textboxes();
                        MessageBox.Show("Thêm dữ liệu thành công!");
                    }
                    else
                    {
                        dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                        MessageBox.Show("Thông tin nhân viên không hợp lệ - Trùng mã nhân viên!");
                    }
                        

                }
                else
                {
                    dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                    MessageBox.Show("Thêm dữ liệu thất bại :((");
                }
                
            }
            catch (Exception exception)
            {
                MessageBox.Show($"Something went wrong! error: {exception.Message}");
            }
        }

        private void btnxoa_Click_1(object sender, EventArgs e)
        {
            if(dataGridView1.Rows.Count > 1)
            {
                int currentIndex = dataGridView1.CurrentRow.Index;
                string Manv = dataGridView1[0, currentIndex].Value.ToString();
                string sql_xoa = "delete from NHANVIEN where Manv = '" + Manv + "'";
                if (MessageBox.Show("Bạn có muốn xóa bản ghi này?", "Xóa thông tin nhân viên", MessageBoxButtons.YesNoCancel,
                    MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    UtilityDB.ExecuteQuery(sql_xoa);
                    dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                    Remove_textboxes();
                }
            }
            else
            {
                dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                MessageBox.Show("Không có dữ liệu để xóa!");
            }
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            try
            {

                manv = txtmanv.Text;
                hoten = txtname.Text;
                gioitinh = cmbgender.Text;
                ngaysinh = dateTimePicker1.Text;
                sdt = mtxtphone.Text;
                diachi = txtdiachi.Text;
                chucvu = txtchucvu.Text;
                bophan = cmbbophan.SelectedValue.ToString();
                tongluong = txtluong.Text;

                if (manv != "" && hoten != "" && gioitinh != "" && sdt != "" && diachi != "" && chucvu != "" && tongluong != "")
                {

                    int currentIndex = dataGridView1.CurrentRow.Index;
                    string Manv = dataGridView1[0, currentIndex].Value.ToString();
                    string sql_sua = "update NHANVIEN SET Manv = '" + manv + "', Hoten = N'" + hoten + "', GT  = N'" + gioitinh + "'," +
                     "NS = '" + ngaysinh + "', Sdt = '" + sdt + "', Diachi = N'" + diachi + "', Chucvu = N'" + chucvu + "'," +
                     " Mabophan = '" + bophan + "', Tongluong = '" + tongluong + "'" +
                     " where Manv = '" + Manv + "'";

                    UtilityDB.ExecuteQuery(sql_sua);
                    dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                    Remove_textboxes();
                    MessageBox.Show("Cập nhật thông tin thành công!");
                }
                else
                {
                    dataGridView1.DataSource = UtilityDB.getDatafromDB(sql);
                    MessageBox.Show("Cập nhật thông tin thất bại :((");
                }
                
            }catch(Exception ex)
            {
                MessageBox.Show($"Something went wrong! error: {ex.Message}");
            }
            
        }
        private void Remove_textboxes()
        {
            txtmanv.Clear();
            txtname.Clear();
            txtluong.Clear();
            txtdiachi.Clear();
            txtchucvu.Clear();
            mtxtphone.Clear();
        }
    }
}
