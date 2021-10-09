<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RegistrationWithEncryptedPassword.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery-3.5.1.min.js"></script>
    <script>

        $(document).ready(function () {
            $("[id*=btnSave]").click(function () {

                if ($("#txtName").val()=="") {
                    alert('Please Enter Name');
                    $("#txtName").focus();
                    return false;

                }
                if ($("#txtEmail").val()=="") {
                    alert('Please Enter Email');
                    $("#txtEmail").focus();
                    return false;

                }
                if ($("#txtPhone").val()=="") {
                    alert('Please Enter Phone');
                    $("#txtPhone").focus();
                    return false;

                }

                if ($("#txtAddress").val()=="") {
                    alert('Please Enter Address');
                    $("#txtAddress").focus();
                    return false;

                }
                if ($("#txtPassword").val()=="") {
                    alert('Please Enter Password');
                    $("#txtPassword").focus();
                    return false;

                }
                alert('okay');
                return true;
            })

        });
    </script>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div style="text-align:center " class="auto-style6" ><strong>Registration Form
        </strong>
        </div>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginForm.aspx">Allready have an account?</asp:HyperLink>
        </p>
        <asp:Label ID="Label1" runat="server" Text="Please Enter the details"></asp:Label>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="auto-style5" Width="354px"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtName" ServiceMethod="GetNames" EnableCaching="true" MinimumPrefixLength="1" CompletionSetCount="1" CompletionInterval="10">

                    </ajaxToolkit:AutoCompleteExtender>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style5" Width="354px" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="auto-style5" Width="354px" TextMode="Number"></asp:TextBox>
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
            <asp:Button ID="btnSave" UseSubmitBehavior="false"  runat ="server" BackColor="#66FF99" CssClass="auto-style5" OnClick="btnSave_Click" Text="Save" OnClientClick="return false;"/>
        </div>
        <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        <div class="auto-style4">
            <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="View" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    </body>
</html>
