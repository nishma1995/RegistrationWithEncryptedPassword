using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using RegistrationWithEncryptedPassword.Models;

namespace RegistrationWithEncryptedPassword
{
    /// <summary>
    /// Summary description for EmployeeService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class EmployeeService : System.Web.Services.WebService
    {
        DataLayer dataLayer = new DataLayer();
        [WebMethod]
        public void GetEmployeeList()
        {
            string connect = dataLayer.connection.ToString();
            List<Employee> employees = new List<Employee>();
            using (SqlConnection con = new SqlConnection(connect))
            {
                SqlCommand command = new SqlCommand("EmployeeList", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                SqlDataReader dataReader = command.ExecuteReader();
                while (dataReader.Read())
                {
                    Employee employee = new Employee();
                    employee.Id = Convert.ToInt32(dataReader["Id"]);
                    employee.Name = dataReader["Name"].ToString();
                    employee.Email = dataReader["Email"].ToString();
                    employee.Phone = dataReader["Phone"].ToString();
                    employee.Address = dataReader["Address"].ToString();
                    employee.Password = dataReader["Password"].ToString();
                    employees.Add(employee);

                }
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Context.Response.Write(serializer.Serialize(employees));
        }
    }
}
