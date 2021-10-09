using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationWithEncryptedPassword
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string encrytedPassword;
        DataLayer dataLayer = new DataLayer();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblMsg.Visible = false;
        }
        [ScriptMethod]
        [WebMethod]
        public static List<string> GetNames(string name)
        {
            DataLayer dataLayer = new DataLayer();

            string connect = dataLayer.connection.ToString();
            using (SqlConnection con = new SqlConnection(connect))
            {
                con.Open();
                SqlCommand command = new SqlCommand("EmployeeSearch", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@searchText", name);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                List<string> names = new List<string>();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    names.Add(dataTable.Rows[i][1].ToString());
                  
                }
                return names;

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            encryption1();
            setConnection();
            //if (txtName.Text=txtEmail.Text=txtAddress.Text=txtPhone)
            //{

            //}
        }
        public void encryption1()                   //function to encrypt the password 
        {
            string stringMessage = string.Empty;
            byte[] encode = new byte[txtPassword.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(txtPassword.Text);
            stringMessage = Convert.ToBase64String(encode);
            encrytedPassword = stringMessage;
        }
        public void setConnection()         //function to connect with database
        {
            string connect = dataLayer.connection.ToString();
            using (SqlConnection con = new SqlConnection(connect))
            {
                SqlCommand command = new SqlCommand("EmployeeSave", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                command.Parameters.AddWithValue("Name", txtName.Text);
                command.Parameters.AddWithValue("Email", txtEmail.Text);
                command.Parameters.AddWithValue("Phone", txtPhone.Text);
                command.Parameters.AddWithValue("Address", txtAddress.Text);
                command.Parameters.AddWithValue("Password", encrytedPassword);
                command.ExecuteNonQuery();
                con.Close();
                lblMsg.Visible = true;
                lblMsg.Text = "Successfully Registered";
                txtName.Text = txtEmail.Text = txtPhone.Text = txtPassword.Text = txtAddress.Text = "";

            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {

            GetEmployee();
            
        }
        public void GetEmployee()   //function to get employee list
        {
            string connect = dataLayer.connection.ToString();

            using (SqlConnection con = new SqlConnection(connect))
            {
                SqlCommand command = new SqlCommand("EmployeeList", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                dataAdapter.SelectCommand = command;
                con.Open();
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                con.Close();
                

            }
        }
    }
}