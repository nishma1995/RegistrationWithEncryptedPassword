using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationWithEncryptedPassword
{
    public partial class DataTableView : System.Web.UI.Page
    {
        protected void Update(object sender, EventArgs e)
        {
           
                DataLayer dataLayer = new DataLayer();
                string connect = dataLayer.connection.ToString();
                using (SqlConnection con = new SqlConnection(connect))
                {
                    SqlCommand cmd = new SqlCommand("EmployeeUpdate", con);
                    con.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", txtId.Text);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address",txtAddress.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
        }
    }
}