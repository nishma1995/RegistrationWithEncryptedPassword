<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTableView.aspx.cs" Inherits="RegistrationWithEncryptedPassword.DataTableView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

    <script type="text/javascript">
        var editor;
        $(document).ready(function () {
            $.ajax({
                url: 'EmployeeService.asmx/GetEmployeeList',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $('#datatable').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'Id' },
                            { 'data': 'Name' },
                            { 'data': 'Email' },
                            { 'data': 'Phone' },
                            { 'data': 'Address' },
                            { 'data': 'Password' },
                        ]
                    });
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="datatable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Password</th>
                       
                    </tr>
                </thead>
            </table>
        </div>
    </form>
</body>
</html>
