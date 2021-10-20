<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup.aspx.cs" Inherits="RegistrationWithEncryptedPassword.Popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title" style="text-align:center;color:red"><b>Only once</b></h2>
                        </div>
                    <div class="modal-body">
                        <p><b>this popup is only for 1st visit</b></p>
                    </div>
                </div>
            </div>
        </div>
        <script src="Scripts/bootstrap.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="JS/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                if (sessionStorage.getItem('#myModal') !== 'true') {
                    $('#myModal').modal("show");
                    sessionStorage.setItem('#myModal', 'true');                 //javascript code that calls popup only 1st of every session
                }
            });
        </script>

    </form>
</body>
</html>
