<%
Dim login
login = session("login")
Dim mesa 
Set mesa = session("mesa")
If (login = "") Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
%>

<!-- #include file="header_cancelaitemerror.asp" -->

<p align="left">
Não foi possível cancelar o Item da Mesa <%=mesa.NoMesa%>.<p align="center">
<b><img border="0" src="../imagens/voltar.gif" width="16" height="16"> </b>
<a href="editmesa.asp?nomesa=<%=mesa.NoMesa%>"><b>Voltar para a Mesa <%=mesa.NoMesa%></b></a> 

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-- #include file="../footer.asp" -->
