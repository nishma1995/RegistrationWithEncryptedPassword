<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="RegistrationWithEncryptedPassword.LoginForm" %>

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
     <link rel="stylesheet" 
          href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
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
            background-color:lightcyan;
        }
        .auto-style2 {
            width: 405px;
        }
        .auto-style3 {
            margin-left: 10px;
            
        
        }
       /* .container {
  padding: 150px;
  background-color:lightcyan;
  padding-left:400px;
}*/
     


        .auto-style4 {
            width: 405px;
            margin-left: 40px;
        }
        .auto-style5 {
            height: 22px;
            width: 405px;
        }
     


        .auto-style6 {
            font-size: x-large;
        }
        .auto-style7 {
            margin-left: 90px;
        }
        .form-container{
            position:absolute;
            top:15vh;
            width:250%;
            background-color:lightcyan;
            padding:30px;
            border-radius:10px;
            box-shadow:0px 0px 10px 0px #000;
            padding-left:60px;
            

        }
        .bg{
            background:url('@C:\Users\USER\Downloads\images.jpg') no-repeat;
            width:100%;
            height:100vh;
            background-size:100%;
            padding-left:500px;
        }
     


    </style>
</head>
<body>
    <section class="container-fluid bg">
        <section class="row justify-content-center">
            <section class="col-12 col-sm-6 col-md-3">
    <form id="form1" runat="server" class="form-container">
        <div style="text-align:center" class="auto-style6" ><strong>Login Form
        </strong>
        </div>
        <br />   <br />   
         <div class="container">
             <div class="col-lg-12 col-sm-4">
        <table class="auto-style1" style="background-color:lightcyan">
           
            <tr>
               
                <td class="auto-style2">Name</td>
                
                </tr>
            <tr>
                <td class="auto-style2">
                   
                    <asp:TextBox ID="txtName" runat="server" Height="30px" Width="384px" class="fa fa-user icon"></asp:TextBox>
                </td>
                   
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                </tr>
            <tr>
                <td class="auto-style5">
                    
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="30px" Width="384px"></asp:TextBox>
                </td>
            </tr>
           
            
            <tr>
                <td class="auto-style4">&nbsp;</td>
       
                <td class="auto-style3" style="padding-left:-150px;" >
                    &nbsp;</td>
            </tr>
           
            
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btnLogin"  runat="server" Text="Login" OnClick="btnLogin_Click"  class="btn btn-primary" Width="384px" />
                </td>
       
                <td class="auto-style7" style="padding-left:-150px;" >
                    &nbsp;</td>
            </tr>
           
            
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
       
                <td class="auto-style7" style="padding-left:-150px;" >
                    &nbsp;</td>
            </tr>
           
            
            <tr>
                <td class="auto-style4">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx">Don&#39;t You Have an Account... Register Now</asp:HyperLink>
                </td>
       
                <td class="auto-style7" style="padding-left:-150px;" >
                    &nbsp;</td>
            </tr>
        </table>
              </div>
        <p>
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        </div>
    </form>
            </section>
            </section>
  </section>
</body>
</html>
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