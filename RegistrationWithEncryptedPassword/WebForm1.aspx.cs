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
       
        [WebMethod]
        public static string[] GetNames1(string name)        //function to autocomplete textbox
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

                List<string> rfqs = new List<string>();
                if (dataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        rfqs.Add(string.Format("{0}", dataTable.Rows[i]["Name"].ToString()));
                    }
                }
                return rfqs.ToArray();

            }
        }
        [WebMethod]
        public static string[] GetEmail(string email)                    //function to autocomplete textbox
        {

            DataLayer dataLayer = new DataLayer();

            string connect = dataLayer.connection.ToString();
            using (SqlConnection con = new SqlConnection(connect))
            {
                con.Open();
                SqlCommand command = new SqlCommand("SearchEmail", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@searchText", email);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                List<string> rfqs = new List<string>();
                if (dataTable.Rows.Count > 0)
                {
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        rfqs.Add(string.Format("{0}", dataTable.Rows[i]["Email"].ToString()));
                    }
                }
                return rfqs.ToArray();

            }
        }
        public class autocomplete
        {
            public string label { get; set; }
            public string value { get; set; }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            encryption1();
            setConnection();
           
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
            //Response.Redirect("DataTableView.aspx");
            Server.Transfer("DataTableView.aspx");


        }
       

        protected void txtName_TextChanged(object sender, EventArgs e)
        {



        }

        protected void btnView1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DataTableView.aspx");
        }

    }
}