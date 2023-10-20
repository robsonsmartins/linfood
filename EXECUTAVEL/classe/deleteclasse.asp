<%
Dim login
Dim classes
login = session("login")
Set classes = session("classes")
If (login <> "GERENTE") Or (classes Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim classeid
Dim success
classeid = Request.QueryString("id")
success = classes.Excluir(CInt(classeid))
If success Then
  Response.Redirect("classe.asp")
Else
  Response.Redirect("deleteclasseerror.asp")
End If
%>
