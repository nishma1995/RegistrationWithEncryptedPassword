using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationWithEncryptedPassword
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string encrytedPassword;
        string connectionString = "Server=DESKTOP-LHCIT1T\\SQLEXPRESS;Database=RegistrationManagementSystem;Trusted_Connection=True";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblMsg.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            encryption1();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand command = new SqlCommand("EmployeeSave", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("Name", txtName.Text);
            command.Parameters.AddWithValue("Email", txtEmail.Text);
            command.Parameters.AddWithValue("Phone", txtPhone.Text);
            command.Parameters.AddWithValue("Address", txtAddress.Text);
            command.Parameters.AddWithValue("Password", encrytedPassword);
            command.ExecuteNonQuery();
            connection.Close();
            lblMsg.Visible = true;
            lblMsg.Text = "Successfully Registered";
            txtName.Text = txtEmail.Text = txtPhone.Text = txtPassword.Text = txtAddress.Text = "";
            

            


        }
        public void encryption1()
        {
            string stringMessage = string.Empty;
            byte[] encode = new byte[txtPassword.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(txtPassword.Text);
            stringMessage = Convert.ToBase64String(encode);
            encrytedPassword = stringMessage;
        }
    }
}