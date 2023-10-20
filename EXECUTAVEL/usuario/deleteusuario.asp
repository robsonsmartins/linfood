<%
Dim login
Dim usuario
login = session("login")
Set usuarios = session("usuarios")
If (login <> "GERENTE") Or (usuarios Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim usuarioid
Dim success
usuarioid = Request.QueryString("id")
success = usuarios.Excluir(CInt(usuarioid))
If success Then
  Response.Redirect("usuario.asp")
Else
  Response.Redirect("deleteusuarioerror.asp")
End If
%>
