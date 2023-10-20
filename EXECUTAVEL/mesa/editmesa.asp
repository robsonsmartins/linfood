<%
Dim login
login = session("login")
Dim mesas 
Set mesas = session("mesas")
Dim nomesa
nomesa = Request.QueryString("nomesa")
If (login = "") Or (mesas Is Nothing) Or (nomesa = "") Then
  Response.Redirect("../loginerrado.asp")
End If
Dim mesa
Set mesa = mesas.Consultar(CInt(nomesa))
Set session("mesa") = mesa
Dim itens
Dim item
Set itens = mesa.Itens
%>

<script language = "JavaScript">
function confirmaApagar(idx, descricao)
{
  if (window.confirm("Confirma o Cancelamento do Item: " + descricao + " ?"))
  {
    document.location.href="cancelaitem.asp?idx=" + idx;
  }
}
function confirmaApagarF(idx, descricao)
{
  if (window.confirm("Confirma o Cancelamento do Item: " + descricao + " ? (A mesa será reaberta após o cancelamento do item)"))
  {
    document.location.href="cancelaitem.asp?idx=" + idx;
  }
}

function confirmaReabre(nomesa)
{
  if (window.confirm("Confirma a Reabertura da Mesa " + nomesa + " ?"))
  {
    document.location.href="edititem.asp";
  }
}

</script>

<!-- #include file="header_editmesa.asp" -->

<div align="center">
  <center>
  <table border="1" cellspacing="0" width="550">
    <tr>
      <td width="540" colspan="5" bgcolor="#000080">
        <p align="center"><b><font face="Arial" color="#FFFFFF" size="2">Mesa <%=nomesa%></font></b></td>
    </tr>
    <tr>
      <td width="540" colspan="5" bgcolor="#FFFFFF">
      <p align="center">
      <% 
      If (login = "GARCOM") Or (login = "GERENTE") Then 
      %>
      <font size="2" face="Arial"><b><font color="#000000"><img border="0" src="../imagens/novo.gif" align="absmiddle">
      <a href="<% If mesa.Status = "F" Then
                      Response.Write("javascript:confirmaReabre(" & mesa.NoMesa & ")")
                    Else
                      Response.Write("edititem.asp")
                    End If %>">Inserir Item ao Pedido</a>
      </font></b></font>
      <% 
      Else
        Response.Write("&nbsp;")
      End If 
      %>
      </p>
      </td>
    </tr>
    <tr>
      <td width="41" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Qtd</font></b></td>
      <td width="193" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Produto</font></b></td>
      <td width="168" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Observações</font></b></td>
      <td width="57" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Preço</font></b></td>
      <td width="57" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Cancelar</font></b></td>
    </tr>
    <%
      For i = 1 To itens.Count()
        Set item = itens.GetAt(i)
    %>
    <tr>
      <td width="41" bgcolor="#E0E0E0"><%=item.Quantidade%></td>
      
      <td width="193" bgcolor="#E0E0E0"><%=item.Produto.Descricao%></td>
      
      <td width="168" bgcolor="#E0E0E0">
      <%
      For j = 1 To item.Observacao.Count()
        Response.Write(item.Observacao.GetAt(j))
        If j < item.Observacao.Count() Then
          Response.Write("<br>")
        End If
      Next
      %>
      &nbsp;
      </td>
      
  </center>
      
      <td width="57" bgcolor="#E0E0E0">
        <p align="right"><%=FormatNumber(item.CalcularTotal(),2)%></td>
  <center>
      <td width="57" bgcolor="#E0E0E0">
     <p align="center">
     <% If (login = "GARCOM") Or (login = "GERENTE") Then %>
     <a href="
        <% If mesa.Status = "F" Then
             Response.Write("javascript:confirmaApagarF")
           Else
             Response.Write("javascript:confirmaApagar")
           End If
        %>(<%=i%>,'<%=item.Produto.Descricao%>')"><img border="0" src="../imagens/lixo.gif"></a>
     <% Else
          Response.Write("&nbsp;")
        End If %>
     </p>
      </td>
    </tr>
    <%
      Next
    %>
    <tr>
      <td width="540" colspan="5" bgcolor="#FFFFFF">
      <p align="center">
      <% 
      If (login = "GARCOM") Or (login = "GERENTE") Then 
      %>
      <font size="2" face="Arial"><b><font color="#000000"><img border="0" src="../imagens/novo.gif" align="absmiddle">
      <a href="<% If mesa.Status = "F" Then
                      Response.Write("javascript:confirmaReabre(" & mesa.NoMesa & ")")
                    Else
                      Response.Write("edititem.asp")
                    End If %>">Inserir Item ao Pedido</a>
      </font></b></font>
      <% 
      Else
        Response.Write("&nbsp;")
      End If 
      %>
      </p>
      </td>
    </tr>
  </table>
  </center>
</div>
<div align="center">
  <center>
  <table border="1" cellspacing="0" width="550">
    <tr>
      <td width="420" bgcolor="#C0C0C0"><b><font size="3" face="Arial" color="#000000">Subtotal</font></b></td>
      <td width="120" bgcolor="#C0C0C0" align="right"><font size="3" face="Arial" color="#000000"><%=FormatNumber(mesa.Subtotal,2)%></font></td>
    </tr>
    <tr>
      <td width="420" bgcolor="#C0C0C0"><b><font size="3" face="Arial" color="#000000">Taxa de Serviço</font></b></td>
      <td width="120" bgcolor="#C0C0C0" align="right"><font size="3" face="Arial" color="#000000"><%=FormatNumber(mesa.CalcularServico(),2)%></font></td>
    </tr>
    <tr>
      <td width="420" bgcolor="#C0C0C0"><b><font size="3" face="Arial" color="#000000">Desconto</font></b></td>
      <td width="120" bgcolor="#C0C0C0" align="right"><font size="3" face="Arial" color="#000000"><%=FormatNumber(mesa.Desconto,2)%></font></td>
    </tr>
    <tr>
      <td width="540" bgcolor="#E0E0E0" colspan="2"><font size="3" face="Arial" color="#000000">&nbsp;</font></td>
    </tr>
    <tr>
      <td width="420" bgcolor="#000000"><b><font face="Arial" color="#FFFFFF" size="4">TOTAL</font></b></td>
      <td width="120" bgcolor="#000000" align="right"><font face="Arial" color="#FFFFFF" size="4"><%=FormatNumber(mesa.CalcularTotal(),2)%></font></td>
    </tr>
  </table>
  </center>
</div>
<p align="center">

<a href="mesa.asp"><b><font size="2" face="Arial"><img border="0" src="../imagens/voltar.gif" width="16" height="16" align="absmiddle">
Voltar ao Mapa de Mesas</font></b></a>
<p>
<!-- #include file="../footer.asp" -->

