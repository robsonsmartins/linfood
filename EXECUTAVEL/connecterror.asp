<%
  Dim cs
  cs = Request.QueryString("cs")
%>
<HTML>

<!-- #include file="header_connecterror.asp" -->
<p>
Não foi possível conectar ao Banco de Dados.<p>
Parâmetro de Conexão: <%=cs%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-- #include file="footer.asp" -->


</HTML>
