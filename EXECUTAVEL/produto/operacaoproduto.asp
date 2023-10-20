<%
Dim login
Dim produtos
login = session("login")
Set produtos = session("produtos")
If (login <> "GERENTE") Or (produtos Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim produtoid
Dim produtodescricao
Dim produtocodproduto
Dim produtopreco
Dim produtoclasseid
Dim produto
produtoid = CInt(Request.QueryString("id"))
produtodescricao = UCase(Request.QueryString("descricao"))
produtocodproduto = CInt(Request.QueryString("codproduto"))
produtopreco = CCur(Request.QueryString("preco"))
produtoclasseid = CInt(Request.QueryString("classe"))
If produtoid > 0 Then
  Set produto = produtos.Alterar(produtoid,produtocodproduto,produtodescricao,produtopreco,produtoclasseid)
Else
  Set produto = produtos.Inserir(produtocodproduto,produtodescricao,produtopreco,produtoclasseid)
End If
If produto Is Nothing Then
  Response.Redirect("produtoerror.asp")
Else
  Response.Redirect("produto.asp")
End If
%>
