<%
Dim login
Dim mesa
login = session("login")
Set mesa = session("mesa")
If (login = "") Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim quantidade
Dim observacao
Dim descricao
Dim item
Dim usuario
Set usuario = session("usuario")
Dim impresso
impresso = True
For i = 1 To mesa.Itens.Count()
  If Not mesa.Itens.GetAt(i).Impresso Then
    impresso = False
    Exit For
  End If
Next  
If impresso Then
  Response.Redirect("editmesa.asp?nomesa=" & mesa.NoMesa) 
End If
%>

<!-- #include file="header_imprimeitem.asp" -->

<div align="center">
  <center>
  <table border="1" cellspacing="0" width="500">
    <tr>
      <td colspan="3" bgcolor="#000080" width="494">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Pedido</b></font></td>
    </tr>
    <tr>
      <td colspan="3" bgcolor="#FFFFFF" width="494"><b><font size="2" face="Arial">Mesa: <%=mesa.NoMesa%> | Garçom: <%=usuario.Nome%></font></b></td>
    </tr>
    <tr>
      <td width="48" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Qtd.</font></b></td>
      <td width="229" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Produto</font></b></td>
      <td width="209" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Observações</font></b></td>
    </tr>
<%
  For i = 1 To mesa.Itens.Count()
    Set item = mesa.Itens.GetAt(i)
    If not item.Impresso Then
      quantidade = item.Quantidade
      descricao = item.Produto.Descricao
      Set observacao = item.Observacao
%>


    <tr>
      <td width="48" bgcolor="#E0E0E0"><%=quantidade%></td>
      <td width="229" bgcolor="#E0E0E0"><%=descricao%></td>
      <td width="209" bgcolor="#E0E0E0">
<%    For j = 1 To observacao.Count()
        Response.Write(observacao.GetAt(j) & "<br>")
      Next %>
      &nbsp;
      </td>
    </tr>
  <%  
    End If
  Next
  If mesa.ImprimirItens() Then
  Else
  End If
%>  
    
  </table>
  </center>
</div>
<p>


<p align="center">
<b><font size="2" face="Arial"><img border="0" src="../imagens/voltar.gif" width="16" height="16">
</font></b>
<a href="editmesa.asp?nomesa=<%=mesa.NoMesa%>"><b><font size="2" face="Arial">Voltar para Mesa <%=mesa.NoMesa%></font></b></a><p>
<p>
<!-- #include file="../footer.asp" -->
