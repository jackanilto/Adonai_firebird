unit USobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EAppProt, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFrmSobre = class(TForm)
    Label1: TLabel;
    EvAppProtect1: TEvAppProtect;
    SpeedButton1: TSpeedButton;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.dfm}

uses UPrincipal;


procedure TFrmSobre.FormActivate(Sender: TObject);
begin
  Label1.Caption := 'Aplicação liberada para use de ' + #13 +
    FormatDateTime('dd/mm/yyyy', EvAppProtect1.DateStart) + ' até ' +
    FormatDateTime('dd/mm/yyyy', EvAppProtect1.DateEnd);
end;

end.
