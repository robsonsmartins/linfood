<%
  Dim cs
  cs = Request.QueryString("cs")
%>
<HTML>

<!-- #include file="header_connecterror.asp" -->
<p>
N�o foi poss�vel conectar ao Banco de Dados.<p>
Par�metro de Conex�o: <%=cs%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-- #include file="footer.asp" -->


</HTML>
