program RevDoc;

uses
  Forms,
  u_Principal in 'u_Principal.pas' {frm_Principal},
  u_about in 'u_about.pas' {Form_About};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'RevDoc - Controle de Documentação';
  Application.CreateForm(Tfrm_Principal, frm_Principal);
  Application.Run;
end.
