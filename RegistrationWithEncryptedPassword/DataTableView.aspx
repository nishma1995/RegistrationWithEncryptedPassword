<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTableView.aspx.cs" Inherits="RegistrationWithEncryptedPassword.DataTableView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
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
                var data = $(this).parents('tr').find('td');
                var id = data.eq(0).html();
                var name = data.eq(1).html();
                var email = data.eq(2).html();
                var phone = data.eq(3).html();
                var address = data.eq(4).html();
                $('[id*=txtId]').val(id);
                $('[id*=txtName]').val(name);
                $('[id*=txtEmail]').val(email);
                $('[id*=txtPhone]').val(phone);
                $('#txtAddress').val(address);
                $('#EditModal').modal("show");
            });
            $('body').on('click', '[id*=btnDelete]', function (id) {
                if (confirm("Do you want to delete this record?")) {
                    var row = $(this).parents('tr');
                    var id = $(row).find('td').eq(0).html();
                    //alert(id);
                   
                    //var id = row.find("span").html();
                    $.ajax({
                        type: 'POST',
                        url: '<%= Page.ResolveUrl("~/EmployeeService.asmx/DeleteFile")%>',
                        data: '{id: ' + id + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            /*if (response.d == 1) {*/
                                $(row).remove();
                               /* $(this).closest("tr").remove()*/
                           // }
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
        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        id="EditModal">
        <div class="modal-dialog" role="document" style="width:fit-content;">
            <div class="modal-content modaledit">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h2 class="modal-title" id="myModalLabel">
                        Edit Details</h2>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <table id="tbtUpdate" class="table">
                            <tr>
                                <td>
                                    Id
                                </td>
                                <td>
                                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>

                                <td align="center">
                                    <asp:Button ID="Button1" Text="Update" runat="server" class="btn btn-primary" OnClick="Update" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close </button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="Scripts/notify.min%20(1).js"></script>
</body>
</html>

