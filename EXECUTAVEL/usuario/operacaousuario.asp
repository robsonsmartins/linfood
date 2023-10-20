<%
Dim login
Dim usuarios
login = session("login")
Set usuarios = session("usuarios")
If (login <> "GERENTE") Or (usuarios Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim usuarioid
Dim usuarionome
Dim usuariosenha
Dim usuariotipodeacesso
Dim usuario
usuarioid = CInt(Request.QueryString("id"))
usuarionome = UCase(Request.QueryString("nome"))
usuariosenha = Request.QueryString("senha")
usuariotipodeacesso = Request.QueryString("tipodeacesso")
If usuarioid > 0 Then
  Set usuario = usuarios.Alterar(usuarioid,usuarionome,usuariosenha,usuariotipodeacesso)
Else
  Set usuario = usuarios.Inserir(usuarionome,usuariosenha,usuariotipodeacesso)
End If
If usuario Is Nothing Then
  Response.Redirect("usuarioerror.asp")
Else
  Response.Redirect("usuario.asp")
End If
%>
