<%
Dim login
login = session("login")
Dim mesa 
Set mesa = session("mesa")
If ((login <> "GERENTE") And (login <> "OPERADOR")) Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim usuario
Set usuario = session("usuario")
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

function valida(din)
{
  txservico = document.formreceber.txservico.value;
  desconto = document.formreceber.desconto.value;

  if (din)
  {
    dinheiro = document.formreceber.dinheiro.value;
    dinfloat = parseFloat(dinheiro.replace(",","."));
    total = document.formreceber.total.value;
    totalfloat = parseFloat(total.replace(",","."));
  }

  if (txservico == "" || !validaNumero(false,txservico))
  {
    window.alert("O campo Taxa de Serviço deve ser preenchido com um número real!");
    document.formreceber.txservico.focus();
    return(false);
  }
  else if (desconto == "" || !validaNumero(false,desconto))
  {
    window.alert("O campo Desconto deve ser preenchido com um número real!");
    document.formreceber.desconto.focus();
    return(false);
  }
  else if (din && (dinheiro == "" || !validaNumero(false,dinheiro)))
  {
    window.alert("O campo Dinheiro deve ser preenchido com um número real!");
    document.formreceber.dinheiro.focus();
    return(false);
  }
  else if (din && (dinfloat < totalfloat))
  {
    window.alert("O campo Dinheiro deve ser preenchido com um valor maior ou igual ao total da conta!");
    document.formreceber.dinheiro.focus();
    return(false);
  }
  else
  {
    return(true);
  }
}

function duasCasas(texto)
{
  //verifica se tem virgula, se não, acresenta
  if (texto.indexOf(",") == -1)
  {
    texto = texto + ",0";
  }
  //acrescenta um zero no final da string
  texto = texto + "0";
  //copia string até duas casas após a vírgula
  texto = texto.substr(0,texto.indexOf(",") + 3);
  return(texto);
}

function atualizar()
{
  //valida números
  if (!valida(false))
  {
    return;
  }
  //converte virgula para ponto
  subtotalstr = document.formreceber.subtotal.value.replace(",",".");
  txservicostr = document.formreceber.txservico.value.replace(",",".");
  descontostr = document.formreceber.desconto.value.replace(",",".");
  //converte string para float
  subtotal = parseFloat(subtotalstr);
  txservico = parseFloat(txservicostr) / 100;
  desconto = parseFloat(descontostr);
  //calcula novos valores
  //converte ponto para virgula
  servico = (txservico * subtotal).toString().replace(".",",");
  total = (txservico * subtotal + subtotal - desconto).toString().replace(".",",");
  dinheiro = total;
  //atualiza form
  document.formreceber.servico.value = duasCasas(servico);
  document.formreceber.total.value = duasCasas(total);
  document.formreceber.dinheiro.value = duasCasas(dinheiro);
  document.formreceber.txservico.focus();
}

function enviar()
{
  if (valida(true)) 
  {
    document.formreceber.submit();
  }
}

</script>

<!-- #include file="header_recebemesa.asp" -->


<form method="get" action="operacaoreceber.asp" name="formreceber">
  <div align="center">
    <center>
    <table border="0" cellspacing="0" width="340" cellpadding="4">
      <tr>
        <td width="338" colspan="2" bgcolor="#000080">
          <p align="center"><b><font color="#FFFFFF" size="2" face="Arial">Receber
          Mesa <%=mesa.nomesa%></font></b></td>
      </tr>
      <tr>
        <td width="144" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Subtotal</font></b></td>
        <td width="192" bgcolor="#C0C0C0">
         <font size="2" face="Arial">
         <input name="subtotal" disabled value="<%=FormatNumber(mesa.Subtotal,2)%>"></font></td>
      </tr>
      <tr>
        <td width="144" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Taxa de Serviço (%)</font></b></td>
        <td width="192" bgcolor="#C0C0C0">
          <font size="2" face="Arial">
          <input name="txservico" value="<%=mesa.TxServico * 100%>"> <input type="button" value="OK" name="btnOK1" onclick="javascript:atualizar();"></font></td>
      </tr>
      <tr>
        <td width="144" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Valor de Serviço</font></b></td>
        <td width="192" bgcolor="#C0C0C0">
          <font size="2" face="Arial">
          <input name="servico" disabled value="<%=FormatNumber(mesa.Subtotal * mesa.TxServico,2)%>"></font></td>
      </tr>
      <tr>
        <td width="144" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Desconto</font></b></td>
        <td width="192" bgcolor="#C0C0C0">
          <font size="2" face="Arial">
          <input name="desconto" value="<%=FormatNumber(mesa.Desconto,2)%>"> <input type="button" value="OK" name="btnOK2" onclick="javascript:atualizar();"></font></td>
      </tr>
      <tr>
        <td width="144" bgcolor="#C0C0C0"><b><font size="2" face="Arial">TOTAL</font></b></td>
        <td width="192" bgcolor="#C0C0C0">
          <font size="2" face="Arial">
          <input name="total" disabled value="<%=FormatNumber(mesa.Subtotal * mesa.TxServico + mesa.Subtotal - mesa.Desconto,2)%>"></font></td>
      </tr>
      <tr>
        <td width="144" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Dinheiro</font></b></td>
        <td width="192" bgcolor="#C0C0C0">
          <font size="2" face="Arial">
          <input name="dinheiro" value="<%=FormatNumber(mesa.Subtotal * mesa.TxServico + mesa.Subtotal - mesa.Desconto,2)%>"></font></td>
      </tr>
      <tr>
        <td colspan="2" width="338" bgcolor="#C0C0C0">
          <p align="center"><font size="2" face="Arial"><input type="button" value="Receber" name="btnEnviar" onclick="javascript:enviar();"></font></p></td>
      </tr>
    </table>
    </center>
  </div>
</form>
<script language="JavaScript">document.formreceber.txservico.focus();</script>

<p>

<!-- #include file="../footer.asp" -->

