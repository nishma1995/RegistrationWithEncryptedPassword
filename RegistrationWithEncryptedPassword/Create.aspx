<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="RegistrationWithEncryptedPassword.Create" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
   
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"></head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    
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
            width: 55%;
        }
        .auto-style2 {
            width: 248px;
            background-color:cornsilk;
        }
        .auto-style3 {
            width: 456px;
        }
        .auto-style4 {
            margin-left: 640px;
        }
        .auto-style5 {
            background-color:cornsilk;
        }
        .auto-style6 {
            height: 48px;
            font-size:x-large
        }
        .auto-style7 {
            width: 456px;
            margin-left: 240px;
        }
        .auto-style8 {
            width: 456px;
            margin-left: 120px;
        }
        .container{
            padding:100px;
           background-color:cornsilk;
            padding-left:200px;
             border-radius:10px;
             box-shadow:0px 0px 10px 0px #000;
             width:50%;
             height:80%;


        }
        .auto-style9 {
            width: 456px;
            height: 29px;
        }
        .auto-style10 {
            width: 456px;
            margin-left: 200px;
        }
        .auto-style11 {
            width: 456px;
            margin-left: 120px;
            height: 20px;
        }
        .auto-style12 {
            width: 456px;
            margin-left: 120px;
            height: 21px;
        }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>--%>
        <div style="text-align:center " class="auto-style6" >
            <br />
            <strong>
            <br />
            
        </strong>
        </div>
    <p>
        &nbsp;</p>
        <p>
            &nbsp;</p>
        <%--<asp:Label ID="Label1" runat="server" Text="Please Enter the details"></asp:Label>--%>
          <div class="container">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" style="background-color:cornsilk">Name</td>
                </tr>
            <tr>
                <td class="auto-style7" style="background-color:cornsilk">
                   
                    <asp:TextBox ID="txtName" runat="server" CssClass="auto-style5" Width="354px"  BackColor="White"></asp:TextBox>
                    <%--  <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtName" ServiceMethod="GetNames" EnableCaching="true" MinimumPrefixLength="1" CompletionSetCount="1" CompletionInterval="10">--%>                   <%-- </ajaxToolkit:AutoCompleteExtender>--%>
                        
                </td>
                </tr>
            
            <tr>
                <td class="auto-style2" style="background-color:cornsilk">Email</td>
                </tr>
            <tr>
                <td class="auto-style3" style="background-color:cornsilk">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style5" Width="354px" TextMode="Email" BackColor="White"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color:cornsilk">Phone</td>
                </tr>
            <tr>
                <td class="auto-style3" style="background-color:cornsilk">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="auto-style5" Width="354px" TextMode="Number" BackColor="White"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color:cornsilk">Address</td>
                </tr>
            <tr>
                <td class="auto-style3" style="background-color:cornsilk">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="auto-style5" Width="354px" BackColor="White"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="background-color:cornsilk">Password</td>
                 </tr>
            <tr>
                <td class="auto-style3" style="background-color:cornsilk">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style5" Width="354px" TextMode="Password" BackColor="White"></asp:TextBox>
                </td>
           </tr>
            <tr>
                <td class="auto-style3" style="background-color:cornsilk">
                    &nbsp;</td>
           </tr>
            <tr>
                <td class="auto-style9" style="background-color:cornsilk">
            <asp:Button ID="btnSave"  runat ="server" BackColor="#66FF99" CssClass="auto-style5" Text="Save"  class="btn btn-primary" Height="29px" Width="357px"/>
                </td>
           </tr>
           
            
            <tr>
                <td class="auto-style11" style="background-color:cornsilk">
                    &nbsp;</td>
           </tr>
            
            <tr>
                <td class="auto-style8" style="background-color:cornsilk">
                    &nbsp;</td>
           </tr>
            <tr>
                <td class="auto-style10" style="background-color:cornsilk">
                    &nbsp;</td>
           </tr>
        </table>
        <div class="auto-style4">
            <br />
        </div>
              </div>
        <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        <div class="auto-style4">
        </div>
        <asp:HiddenField ID="hiddenid" Value="0" runat="server" />
    </form>
     <script>
         $("#txtName").autocomplete({
             source: function (request, response) {
                 var objdata = { "name": $("#txtName").val() };
                 $.ajax({
                     url: "webform1.aspx/GetNames1",
                     data: JSON.stringify(objdata),
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     dataFilter: function (data) { return data; },
                     success: function (data) {
                         response($.map(data.d, function (item) {
                             return {
                                 label: item
                             }
                         }))
                     },
                     error: function (response) {
                         alert(response.responseText);
                     },
                     failure: function (response) {
                         alert(response.responseText);
                     },
                 });
             },
             autoFocus: true,
             select: function (e, i) {
                 $("#txtName").val(i.item.label);
             },
             focus: function (event, ui) { event.preventDefault(); },
             minLength: 2
         });
     </script>
     <script>
         $("#txtEmail").autocomplete({
             source: function (request, response) {
                 var objdata = { "email": $("#txtEmail").val() };
                 $.ajax({
                     url: "webform1.aspx/GetEmail",
                     data: JSON.stringify(objdata),
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     dataFilter: function (data) { return data; },
                     success: function (data) {
                         response($.map(data.d, function (item) {
                             return {
                                 label: item
                             }
                         }))
                     },
                     error: function (response) {
                         alert(response.responseText);
                     },
                     failure: function (response) {
                         alert(response.responseText);
                     },
                 });
             },
             autoFocus: true,
             select: function (e, i) {
                 $("#txtEmail").val(i.item.label);
             },
             focus: function (event, ui) { event.preventDefault(); },
             minLength: 2
         });
     </script>

    </body>
</html>

