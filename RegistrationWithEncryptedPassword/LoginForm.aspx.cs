using RegistrationWithEncryptedPassword.Models;
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
    public partial class LoginForm : System.Web.UI.Page
    {
        string decryptedpassword;
        string connectionString = "Server=DESKTOP-LHCIT1T\\SQLEXPRESS;Database=RegistrationManagementSystem;Trusted_Connection=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand command = new SqlCommand("SetLogin", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("Name", txtName.Text);
            command.Parameters.AddWithValue("Password", decryptedpassword);
            SqlDataReader reader = command.ExecuteReader();


            Employee employee = new Employee();
            if (reader.Read())
                employee.Name = reader["Name"].ToString();
                employee.Password = reader["Password"].ToString();
            }
            return emplo;


        }
        private void decryptPassword(string encryptedPassword)
        {
            string decryptPassword = string.Empty;
            UTF8Encoding encodePassword = new UTF8Encoding();
            Decoder decoder = encodePassword.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptedPassword);
            int charCount = decoder.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            decoder.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptPassword = new string(decoded_char);
            decryptedpassword = decryptPassword;
        }
    }
}