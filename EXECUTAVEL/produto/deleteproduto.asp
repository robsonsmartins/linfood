<%
Dim login
Dim produtos
login = session("login")
Set produtos = session("produtos")
If (login <> "GERENTE") Or (produtos Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim produtoid
Dim success
produtoid = Request.QueryString("id")
success = produtos.Excluir(CInt(produtoid))
If success Then
  Response.Redirect("produto.asp")
Else
  Response.Redirect("deleteprodutoerror.asp")
End If
%>
