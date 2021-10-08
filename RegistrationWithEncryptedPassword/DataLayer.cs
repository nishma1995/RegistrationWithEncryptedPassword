using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RegistrationWithEncryptedPassword
{
    public class DataLayer
    {
        
        public SqlCommand command = new SqlCommand();
        public string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlDataAdapter sda;                 // used for all data adpater functions.
        DataTable dt;
        SqlCommand cmd;                     // used for all database command needs.
        SqlDataReader rdr;                  // used for all data reader functions.
        SqlConnection sqlCon = new SqlConnection();

    }
}