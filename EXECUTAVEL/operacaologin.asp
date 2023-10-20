<%
'faz login
Dim nome
Dim senha
nome = Request.QueryString("nome")
senha = Request.QueryString("senha")
adm = Request.QueryString("adm")
Dim factory
Set factory = session("conexao")
If (factory Is Nothing) Or (nome = "") Or (senha = "") Then
  If adm <> "" Then
    'vai para login administrativo
    Response.Redirect("admlogin.asp")
  Else
    'vai para login do sistema
    Response.Redirect("login.asp")
  End If
End If
Dim usuarios
Set usuarios = factory.New("LinFOOD.Usuario")
Dim usuario
Set usuario = usuarios.EfetuarLogin(nome,senha)
If usuario Is Nothing Then
  Response.Redirect("loginerrado.asp")
End If
session("login") = usuario.TipoAcesso
Set session("usuario") = usuario
If adm <> "" Then
  'vai para menu administrativo
  Response.Redirect ("admmenu.asp")
Else
  'vai para o sistema linfood
  Response.Redirect ("mesa/mesa.asp")
End If
%>