<%
Dim login
login = session("login")
Dim qtdmesas
Dim txservico
qtdmesas=request.querystring("qtdmesas")
txservico=request.querystring("txservico")
If (login <> "GERENTE") or (qtdmesas ="") or (txservico = "") Then
  Response.Redirect("../loginerrado.asp")
End If
Dim configuracoes 
Set configuracoes = session("configuracoes")  
Dim configuracao
set configuracao = configuracoes.Configurar (Cint(qtdmesas),Csng(txservico)/100)
if configuracao is nothing then
  response.redirect("configuracaoerror.asp")
else
  response.redirect("../admmenu.asp")
end if
  
%>
