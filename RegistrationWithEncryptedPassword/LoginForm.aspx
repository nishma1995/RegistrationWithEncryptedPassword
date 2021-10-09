<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="RegistrationWithEncryptedPassword.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery-3.5.1.min.js"></script>
     <script>
         $(document).ready(function () {
             $("#btnLogin").click(function () {

                 if ($("#txtName").val() == "") {
                     alert('Please Enter Name');
                     $("#txtName").focus();
                     $("#txtName").css("border", "1px solid red");
                     return false;

                 }
                 else {
                     $("#txtName").css("border", "1px solid green");
                 }
                 if ($("#txtPassword").val() == "") {
                     alert('Please Enter Password');
                     $("#txtPassword").focus();
                     return false;

                 }
                 alert('okay');
                 return true;
             })

         })
     </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #66FFFF;
        }
        .auto-style2 {
            width: 195px;
        }
        .auto-style3 {
            margin-left: 80px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center" ><strong>Login Form
        </strong>
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx">Don&#39;t Have an Account Register Now</asp:HyperLink>
        <br />   <br />     <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnLogin" UseSubmitBehavior="false" runat="server" Text="Login" OnClick="btnLogin_Click" OnClientClick="return false;" />
                </td>
            </tr>
        </table>
        <p>
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
