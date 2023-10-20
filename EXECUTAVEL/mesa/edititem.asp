<%
Dim login
Dim produtos
Dim mesa
login = session("login")
Set mesa = session("mesa")
If (login = "") Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Set produtos = factory.New("LinFOOD.Produto")
Dim lista
Set lista = produtos.Listar("SELECT * FROM LinFOOD.Produto ORDER BY DESCRICAO")
Dim obss
Set obss = factory.New("LinFOOD.Observacao")
Dim listaobs
Set listaobs = obss.Listar()
Dim obs
Dim produto
Dim usuario
Set usuario = session("usuario")
%>

<script language="JavaScript">
function AddObsDigi()
{
  if (document.formitem.obsdigi.value != "")
  {
    document.formitem.observacao.value = document.formitem.observacao.value + document.formitem.obsdigi.value + "\n";
    document.formitem.obsdigi.value = "";
  }
}

function AddObsCad()
{
  if (document.formitem.obscad.value != "")
  {
    document.formitem.observacao.value = document.formitem.observacao.value + document.formitem.obscad.value + "\n";
    document.formitem.obscad.value = "";
  }
}

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
  produto = document.formitem.produto.value
  quantidade = document.formitem.quantidade.value

  <% If mesa.Status = "L" Then %>
  comanda = document.formitem.comanda.value
  <% End If %>
  
  if (quantidade == "" || !validaNumero(false,quantidade))
  {
    window.alert("O campo Quantidade deve ser preenchido com um número real!");
    document.formitem.quantidade.focus();
    return;
  }
  else if (produto == 0)
  {
    window.alert("Deve-se escolher um Produto!");
    document.formitem.produto.focus();
    return;
  }
  
  <% If mesa.Status = "L" Then %>
  else if (comanda == "" || !validaNumero(true,comanda))
  {
    window.alert("O campo Número da Comanda deve ser preenchido com um número inteiro!");
    document.formitem.comanda.focus();
    return;
  }
  <% End If %>

  else
  {
    document.formitem.submit();
  }
}

function finalizar()
{
  document.formitem.produto.value = 0
  document.formitem.quantidade.value = 0
  document.formitem.submit();
}

</script>


<!-- #include file="header_edititem.asp" -->

<form method="GET" action="operacaoitem.asp" name="formitem">
<div align="center">
  <center>
  <div align="center">
    <center>
  <table border="0" cellpadding="2" cellspacing="0" width="600">
    <tr>
      <td height="18" colspan="4" bgcolor="#000080">
        <p align="center"><font face="Arial" size="2" color="#FFFFFF"><b>Item de
        Pedido - Mesa <%=mesa.NoMesa%></b></font>
      </td>
    </tr>
    <tr>
      <td width="50" height="112" bgcolor="#CCCCCC" rowspan="4"><b><font face="Arial" size="1">Itens:<br>
        </font></b><font face="Arial" size="1">
          <textarea rows="11" name="itens" cols="21" disabled="true">
<%
  Dim item
  For i = 1 To mesa.Itens.Count()
    Set item = mesa.Itens.GetAt(i)
    Response.Write(item.Quantidade & " " & item.Produto.Descricao & chr(13) & chr(10)) 
  Next
%>
          </textarea>
        </font>

      </td>
      <td width="50" height="25" bgcolor="#CCCCCC">
      <%
        If mesa.Status = "L" Then
      %>  
        <font face="Arial" size="1"><b> Comanda<br>
        </b><input type="text" name="comanda" size="26">
        </font>
       <%
         Else
           Response.Write("&nbsp;")
         End If
       %>
      </td>
      <td width="230" height="25" bgcolor="#CCCCCC">&nbsp;
      </td>
      <td width="60" height="25" bgcolor="#CCCCCC">&nbsp;
      </td>
    </tr>
  </center>
  <center>
  <tr>
      <td width="50" height="25" bgcolor="#CCCCCC">
        <b><font face="Arial" size="1">Produto</font></b><font face="Arial" size="1"><br>
        <select size="1" name="produto">
          <option "selected" value="0">Escolha um Produto</option>
          <%
            For i = 1 To lista.Count()
              Set produto = lista.GetAt(i)
              %>
              <option value="<%=produto.id%>"><%=produto.descricao%></option><%
            Next
            Set produto = Nothing
            Set produtos = Nothing   
          %>
        </select>
        </font>
      </td>
      <td width="230" height="25" bgcolor="#CCCCCC">
        <font face="Arial" size="1">
        <b>Quantidade<br>
        </b><input type="text" name="quantidade" size="9" value="1">
        </font>
      </td>
      <td width="60" height="25" bgcolor="#CCCCCC">
        &nbsp;
      </td>
    </tr>
  </center>
  <center>
    <tr>
    </center>
      <td width="50" height="62" bgcolor="#CCCCCC" rowspan="2">
        <p align="left"><b><font face="Arial" size="1">Observação</font></b><font face="Arial" size="1"><br>
        <textarea rows="6" name="observacao" cols="21"></textarea></font></p>
      </td>
      <td width="230" height="69" bgcolor="#CCCCCC">
        <font face="Arial" size="1">
        <b>Adicionar Observação Cadastrada<br>
        </b><select size="1" name="obscad">
          <option "selected" value="">Escolha uma Observação</option>
          <%
            For i = 1 To listaobs.Count()
              Set obs = listaobs.GetAt(i)
              %>
              <option value="<%=obs.descricao%>"><%=obs.descricao%></option><%
            Next
            Set obs = Nothing
          %>
        </select>
        </font>
      </td>
      <td width="60" height="69" bgcolor="#CCCCCC">
        <font face="Arial" size="1"><br>
        <input type="button" value="Adiciona" name="btnAddObsCad" onClick="AddObsCad()">
        </font>
      </td>
    </tr>
    <tr>
      <td width="230" height="1" bgcolor="#CCCCCC">
        <font face="Arial" size="1"><b>Adicionar Observação Digitada</b><input type="text" name="obsdigi" size="26"></font>
      </td>
      <td width="60" height="1" bgcolor="#CCCCCC">
        <font face="Arial" size="1"><br>
        <input type="button" value="Adiciona" name="btnAddObsDigi" onClick="AddObsDigi()">
        </font>
      </td>
    </tr>
  <tr>
      <td colspan="4" height="25" bgcolor="#CCCCCC">
        <p align="center"><font face="Arial" size="1">
        <input type="button" value="  Inserir  " name="btnSalvar" onclick="javascript:enviar()">
        <input type="button" value="Finalizar" name="btnFinalizar" onclick="javascript:finalizar()">
        </font>
    </td>
  </tr>
  </table>
  </div>
</form>
<script language="JavaScript">document.formitem.produto.focus();</script>
  </center>

<p>
<!-- #include file="../footer.asp" -->

