<%
Dim login
Dim mesa
login = session("login")
Set mesa = session("mesa")
If (login = "") Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim produtoid
Dim quantidade
Dim observacao
Dim comanda
Dim usuario
Set usuario = session("usuario")
Dim factory
Set factory = session("conexao")
produtoid = CLng(Request.QueryString("produto"))
quantidade = CSng(Request.QueryString("quantidade"))
observacao = UCase(Request.QueryString("observacao"))
If Request.QueryString("comanda") <> "" Then
  comanda = CLng(Request.QueryString("comanda"))
Else
  comanda = 0
End If
If produtoid > 0 Then
  If mesa.InserirItem(produtoid,quantidade,observacao,comanda,usuario.Nome) Then
    Response.Redirect("edititem.asp") 
  Else
  End If
Else
  Response.Redirect("imprimeitem.asp")
End If
%>