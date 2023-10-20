<%
Dim login
Dim classes
login = session("login")
Set classes = session("classes")
If (login <> "GERENTE") Or (classes Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim classeid
Dim classedescricao
Dim classe
classeid = CInt(Request.QueryString("id"))
classedescricao = UCase(Request.QueryString("descricao"))
If classeid > 0 Then
  Set classe = classes.Alterar(classeid,classedescricao)
Else
  Set classe = classes.Inserir(classedescricao)
End If
If classe Is Nothing Then
  Response.Redirect("classeerror.asp")
Else
  Response.Redirect("classe.asp")
End If
%>
