<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editForm.aspx.cs" Inherits="RegistrationWithEncryptedPassword.editForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="JS/all.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="JS/sb-admin-2.min.css" rel="stylesheet" />
   
    <style>
        .dataTables_filter
{
    float:right !important;
}
.pagination
{
    float:right;
}
.dataTables_filter input {

    border: 1px #cac6c6 solid !important;
}
.dataTables_length  select {

    border: 1px #cac6c6 solid !important;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <h1 class="h3 mb-2 text-gray-800">Show Data</h1> 

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
           
               
            <div class="card-body">
              <div class="table-responsive">

                    <asp:Literal ID="ltlContent" runat="server"></asp:Literal>

                  </div>

                </div>
              </div>
       

        
       

    </form>
     <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.bundle.min.js"></script>
        <script src="JS/jquery.easing.min.js"></script>
        <script src="JS/sb-admin-2.min.js"></script>
        <script src="JS/jquery.dataTables.min.js"></script>
        <script src="JS/dataTables.bootstrap4.min.js"></script>
        <script src="JS/datatables-demo.js"></script>
      
        
       <style type="text/css">

        .table-responsive {
            display: block;
            width: 80%;
            overflow-x: hidden !important;
        }
    </style>
</body>
</html>
