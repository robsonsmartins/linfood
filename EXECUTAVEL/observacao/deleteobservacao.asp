<%
Dim login
Dim observacoes
login = session("login")
Set observacoes = session("observacoes")
If (login <> "GERENTE") Or (observacoes Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim observacaoid
Dim success
observacaoid = Request.QueryString("id")
success = observacoes.Excluir(CInt(observacaoid))
If success Then
  Response.Redirect("observacao.asp")
Else
  Response.Redirect("deleteobservacaoerror.asp")
End If
%>
