<%
Dim login
Dim produtos
Dim classes
login = session("login")
Set produtos = session("produtos")
If (login <> "GERENTE") Or (produtos Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Set classes = factory.New("LinFOOD.Classe")
Dim lista
Set lista = classes.Listar()
Dim classe
Dim produtoid
produtoid = CInt(Request.QueryString("id"))
Dim produtodescricao
Dim produtocodproduto
Dim produtopreco
Dim produtoclasseid
If produtoid > 0 Then
  Dim produto
  Set produto = produtos.Consultar(produtoid)
  produtodescricao = produto.Descricao
  produtocodproduto = produto.CodProduto
  produtopreco = produto.Preco
  produtoclasseid = produto.Classe.Id
Else
  produtodescricao = ""
  produtocodproduto = produtos.GetLastCodProduto() + 1
  produtopreco = "0,00"
  produtoclasseid = 0
End If
%>

<script language="JavaScript">
function validaNumero(inteiro,texto) 
//inteiro = true -> número inteiro, false -> real
//texto = texto a ser validado
{
  strNumero = true;
  for (i = 0; i < texto.length; i++)
  {
    s = texto.substr(i,1); 
    naonumero = ((s != "0") && (s != "1") && (s != "2") && (s != "3") && 
                 (s != "4") && (s != "5") && (s != "6") && (s != "7") && 
                 (s != "8") && (s != "9"));
    naovirgula = (s != ",");
    if (naonumero && inteiro || naonumero && !inteiro && naovirgula)
    {
      strNumero = false;
      break;   
    }
  }
  return(strNumero);
}

function enviar()
{
  codproduto = document.formproduto.codproduto.value;
  descricao = document.formproduto.descricao.value;
  preco = document.formproduto.preco.value;
  classe = document.formproduto.classe.value;
  if (codproduto == "" || !validaNumero(true,codproduto))
  {
    window.alert("O campo Código deve ser preenchido com um número inteiro!");
    document.formproduto.codproduto.focus();
    return;
  }
  else if (descricao == "")
  {
    window.alert("O campo Descrição não pode estar em branco!");
    document.formproduto.descricao.focus();
    return;
  }
  if (preco == "" || !validaNumero(false,preco))
  {
    window.alert("O campo Preço deve ser preenchido com um número real!");
    document.formproduto.preco.focus();
    return;
  }
  else if (classe == 0)
  {
    window.alert("Deve-se escolher uma Classe de Produto!");
    document.formproduto.classe.focus();
    return;
  }
  else
  {
    document.formproduto.submit();
  }
}

</script>

<!-- #include file="header_editproduto.asp" -->

<p>&nbsp;</p>
<form method="GET" action="operacaoproduto.asp" name="formproduto">
<div align="center">
  <center>
  <table border="0" cellpadding="4" cellspacing="0" width="320">
    <tr>
      <td width="310" colspan="2" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Produto</b></font></p>
      </td>
    </tr>
    <tr>
      <td width="62" bgcolor="#C0C0C0"><font size="2" face="Arial"><b>Código</b>&nbsp;</font></td>
      <td width="238" bgcolor="#C0C0C0">
        <input type="text" name="codproduto" size="34" value="<%=produtocodproduto%>">
        <input type="hidden" name="id" size="20" value="<%=produtoid%>">
      </td>
    </tr>
    <tr>
      <td width="62" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Descrição</font></b></td>
      <td width="238" bgcolor="#C0C0C0">
        <input type="text" name="descricao" size="34" value="<%=produtodescricao%>">
      </td>
    </tr>
    <tr>
      <td width="62" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Preço</font></b></td>
      <td width="238" bgcolor="#C0C0C0">
        <input type="text" name="preco" size="34" value="<%=FormatNumber(produtopreco,2)%>">
      </td>
    </tr>
    <tr>
      <td width="62" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Classe</font></b></td>
      <td width="238" bgcolor="#C0C0C0">
        <select size="1" name="classe">
          <option 
                <% 
                  If produtoclasseid = 0 Then 
                    Response.write("selected") 
                  End If 
                %>
          value="0">Escolha uma Classe de Produtos</option>
          <%
            For i = 1 To lista.Count()
              Set classe = lista.GetAt(i)
              %><option 
                <% 
                  If classe.id = produtoclasseid Then 
                    Response.write("selected") 
                  End If 
                %>
                value="<%=classe.id%>"><%=classe.descricao%></option><%
            Next
            Set classe = Nothing
            Set classes = Nothing   
          %>
        </select>
      </td>
    </tr>
    <tr>
      <td width="310" colspan="2" bgcolor="#C0C0C0">
        <p align="center">&nbsp;<input type="button" value="  Salvar  " name="btnSalvar" onclick="javascript:enviar()">&nbsp;
        <input type="button" value="Cancelar" name="btnCancelar" onClick="javascript:document.location.href('produto.asp')"></p>
      </td>
    </tr>
  </table>
  </center>
</div>
&nbsp;
</form>
<p>&nbsp;</p>

<script language="JavaScript">document.formproduto.codproduto.focus();</script>
<!-- #include file="../footer.asp" -->

