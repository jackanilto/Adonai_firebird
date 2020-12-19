unit USobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EAppProt, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFrmSobre = class(TForm)
    EvAppProtect1: TEvAppProtect;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  Label1.Caption := 'Inicio da Licença ' + FormatDateTime('dd/mm/yyyy', EvAppProtect1.DateStart) + #13 +
                    'Licença ativa até ' + FormatDateTime('dd/mm/yyyy', EvAppProtect1.DateEnd);
end;

procedure TFrmSobre.FormCreate(Sender: TObject);
const
 Msg = 'Faltam menos de 10 dias para a licença expirar.         Deseja renovar agora?';
begin
  if ((EvAppProtect1.DateEnd - Date) < 10) and
    (MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    EvAppProtect1.ResetLockApplication;
end;

procedure TFrmSobre.SpeedButton1Click(Sender: TObject);
begin
EvAppProtect1.ResetLockApplication;
end;

end.
