<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RegistrationWithEncryptedPassword.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 248px;
            background-color: #FFFFCC;
        }
        .auto-style3 {
            width: 456px;
        }
        .auto-style4 {
            margin-left: 640px;
        }
        .auto-style5 {
            background-color: #FFFFCC;
        }
        .auto-style6 {
            height: 48px;
            font-size:x-large
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center " class="auto-style6" ><strong>Registration Form
        </strong>
        </div>
    <p>
        &nbsp;</p>
        <asp:Label ID="Label1" runat="server" Text="Please Enter the details"></asp:Label>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="auto-style5" Width="354px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style5" Width="354px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="auto-style5" Width="354px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Address</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="auto-style5" Width="354px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style5" Width="354px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="auto-style4">
            <asp:Button ID="btnSave" runat="server" BackColor="#66FF99" CssClass="auto-style5" OnClick="btnSave_Click" Text="Save" />
        </div>
        <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
    </form>
    </body>
</html>
