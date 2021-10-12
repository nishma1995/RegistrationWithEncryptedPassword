using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationWithEncryptedPassword
{
    public partial class View : System.Web.UI.Page
    {
        DataLayer dataLayer = new DataLayer();

        protected void Page_Load(object sender, EventArgs e)
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