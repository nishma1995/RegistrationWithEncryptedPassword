using RegistrationWithEncryptedPassword.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationWithEncryptedPassword
{
    public partial class editForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(@"    <table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>
  <thead>
  <tr>

  <th>Id</th>
 <th>Name</th>
<th>Email</th> 
<th>Phone</th> 
<th>Address</th> 
<th>Password</th> 
<th>Action</th>
</tr> 
</thead> <tbody> ");
            DataLayer dataLayer = new DataLayer();
            string connect = dataLayer.connection.ToString();
            List<Employee> employees = new List<Employee>();
            using (SqlConnection con = new SqlConnection(connect))
            {
                SqlCommand command = new SqlCommand("EmployeeList", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                dataAdapter.SelectCommand = command;
                con.Open();
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.Append(@"  
             <tr id='bnr" + dt.Rows[i]["Id"].ToString() + @"'>
                <td>" + (i + 1).ToString() + @"</td>" + @"<td>" + dt.Rows[i]["Name"].ToString() + @"</td>
                <td> " + dt.Rows[i]["Email"].ToString()  + @"</td>
<td> " + dt.Rows[i]["Phone"].ToString() + @"</td>
<td> " + dt.Rows[i]["Address"].ToString() + @"</td>
<td> " + dt.Rows[i]["Password"].ToString() + @"</td>
                <td> 
                    
                  <a title='Edit Details' href='Create.aspx?id=" + dt.Rows[i]["Id"].ToString() + @"' class='btn btn-info btn-circle btn-sm'> <i class='fas fa-edit'></i> </a>   
                  <span  title='Remove Details' onclick='DeleteRow(1," + dt.Rows[i]["Id"].ToString() + @");' class='btn btn-danger btn-circle btn-sm'> <i class='fas fa-trash'></i> </span> 
                                </td></tr>");
                }
            }

           


           

            sb.Append(@" </tbody>
 </table>");


            ltlContent.Text = sb.ToString();

        }
    }
}