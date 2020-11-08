unit UTratamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmTRATAMENTOS = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTRATAMENTOS: TFrmTRATAMENTOS;

implementation

{$R *.dfm}

uses UCadMembro, UDM, UGrupos, ULogin, UPrincipal, UProfissoes;

end.
