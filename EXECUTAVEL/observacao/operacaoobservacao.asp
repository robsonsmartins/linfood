<%
Dim login
Dim observacoes
login = session("login")
Set observacoes = session("observacoes")
If (login <> "GERENTE") Or (observacoes Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim observacaoid
Dim observacaodescricao
Dim observacao
observacaoid = CInt(Request.QueryString("id"))
observacaodescricao = UCase(Request.QueryString("descricao"))
If observacaoid > 0 Then
  Set observacao = observacoes.Alterar(observacaoid,observacaodescricao)
Else
  Set observacao = observacoes.Inserir(observacaodescricao)
End If
If observacao Is Nothing Then
  Response.Redirect("observacaoerror.asp")
Else
  Response.Redirect("observacao.asp")
End If
%>
