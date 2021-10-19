<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTableView.aspx.cs" Inherits="RegistrationWithEncryptedPassword.DataTableView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

    <script type="text/javascript">
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
                            //{
                            //    "data": "Id", "render": function () {
                            //        return "<a class='btn btn-default btn-sm'<i class='fa fa-pencil'></i> Edit</a><a class='btn btn-danger btn-sm' onclick=Delete(" + data + ")><i class='fa fa-trash'></i>Delete</a>";
                            //    },
                            //    "orderable": false,
                            //    "width":"150px"
                            //}
                            {
                                "data": null,
                                "defaultContent": '<input type="button" id="btnEdit" class="btn btn-primary" value="Edit" />'
                            },
                            {
                                'data': null,
                            'defaultContent':'<input type="button" id="btnDelete" class="btn btn-danger" value="Delete">'}
                           
                        ]


                    });
                }
            });
            $('body').on('click', '[id*=btnEdit]', function () {
                var row = $(this).parents('tr');
                var id = $(row).find('td').eq(0).html();
                $.ajax({
                    type: 'POST',
                    url: '<%= Page.ResolveUrl("~/Create.aspx/Update")%>',
                    data: '{id: ' + id +
                        '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                });
            });
            $('body').on('click', '[id*=btnDelete]', function () {
                if (confirm("Do you want to delete this record?")) {
                    var row = $(this).parents('tr');
                    var id = $(row).find('td').eq(0).html();
                    $.ajax({
                        type: 'POST',
                        url: '<%= Page.ResolveUrl("~/EmployeeService.asmx/DeleteFile")%>',
                        data: '{id: ' + id + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == 1) {
                                $(row).remove();
                            }
                        }
                    });
                }
            });
        });
       
       

                    
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="datatable" class="table table-striped table-bordered">
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
            <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
            <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet"/>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css"rel="stylesheet"/>


      </div>
    </form>
    <script src="Scripts/notify.min%20(1).js"></script>
</body>
</html>
