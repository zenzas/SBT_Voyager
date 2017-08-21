<%@ Page Language="VB" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub LoginBtn_Click(Sender As Object, E As EventArgs)
    
        Msg.text =""
        Dim ConnectionString As String = "server=127.0.0.1\INSERTGT;database=dane;uid=" &UserName.Text
        Dim CommandText As String = "select * from Uczelnia"
    
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlCommand(CommandText, myConnection)
    
    
        try
    
        myConnection.Open()
    
        catch ex as Exception
        end try
    
        if (myConnection.State <> System.Data.ConnectionState.Open) Then
        msg.Text = "Niepoprawne dane"
        Else
        Session("user") = Username.text
        FormsAuthentication.RedirectFromLoginPage(UserName.Text, true)
        end if
    
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <form runat="server">
        <h2>Logowanie 
        </h2>
        <hr size="1" />
        <table>
            <tbody>
                <tr>
                    <td>
                        Użytkownik:</td>
                    <td>
                        <asp:TextBox id="UserName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator id="Requiredfieldvalidator1" runat="server" ControlToValidate="UserName" Display="Static" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Hasło:</td>
                    <td>
                        <asp:TextBox id="UserPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator id="Requiredfieldvalidator2" runat="server" ControlToValidate="UserPass" Display="Static" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:button id="LoginBtn" onclick="LoginBtn_Click" runat="server" text="Login"></asp:button>
        <p>
            <asp:Label id="Msg" runat="server" forecolor="red"></asp:Label>
        </p>
    </form>
</body>
</html>
