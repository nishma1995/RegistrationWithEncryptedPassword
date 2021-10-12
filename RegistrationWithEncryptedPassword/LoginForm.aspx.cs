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
    public partial class LoginForm : System.Web.UI.Page
    {
        string decryptedpassword;
        DataLayer dataLayer = new DataLayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            setLogin();

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
        }       //function to decrypt password
        public void setLogin()
        {
            string connect = dataLayer.connection.ToString();
            using (SqlConnection con = new SqlConnection(connect))
            {

                SqlCommand command = new SqlCommand("SetLogin", con);
                con.Open();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("Name", txtName.Text);

                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                dataAdapter.SelectCommand = command;
                DataSet data = new DataSet();
                dataAdapter.Fill(data);
                string uname;
                string pwd;
                if (data.Tables[0].Rows.Count > 0)
                {
                    uname = data.Tables[0].Rows[0]["Name"].ToString();
                    pwd = data.Tables[0].Rows[0]["Password"].ToString();
                    decryptPassword(pwd);
                    if (uname == txtName.Text && decryptedpassword == txtPassword.Text)
                    {
                        Session["Name"] = uname;
                        Response.Redirect("About.aspx");
                    }
                    else
                    {
                        lblMsg.Text = "Invalid";
                    }
                }
            }
        }
    }
    

}