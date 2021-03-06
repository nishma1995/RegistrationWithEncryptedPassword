using RegistrationWithEncryptedPassword.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationWithEncryptedPassword
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hiddenid.Value = Request.QueryString["id"].ToString();
                    bindDatas();
                }
            }
        }
        public void bindDatas()
        {
            DataLayer dataLayer = new DataLayer();
            string connect = dataLayer.connection.ToString();
            List<Employee> employees = new List<Employee>();
            using (SqlConnection con = new SqlConnection(connect))
            {
                SqlCommand command = new SqlCommand("EmployeeUpdate", con);
                command.Parameters.AddWithValue("@Id", hiddenid.Value);
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@Email", txtEmail.Text);
                command.Parameters.AddWithValue("@Phone", txtPhone.Text);
                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                command.Parameters.AddWithValue("@Password", txtPassword.Text);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                dataAdapter.SelectCommand = command;
                con.Open();
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
            }
        }
        [WebMethod]
        public void Update(int id, string name, string email, string phone, string address)
        {
            DataLayer dataLayer = new DataLayer();
            string connect = dataLayer.connection.ToString();
            using (SqlConnection con = new SqlConnection(connect))
            {
                SqlCommand cmd = new SqlCommand("EmployeeUpdate", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Adress", txtAddress.Text);
                cmd.ExecuteNonQuery();
                con.Close();



            }
        }
    }
}