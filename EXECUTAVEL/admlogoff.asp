<%
'faz logoff
Dim factory
Set factory = session("conexao")
Dim usuario
Set usuario = session("usuario")
If (Not factory Is Nothing) And (Not usuario Is Nothing) Then
  usuario.EfetuarLogoff()
End If
Set session("usuario") = Nothing
Set session("conexao") = Nothing
session("login") = ""
Response.Redirect("admlogin.asp")
%>