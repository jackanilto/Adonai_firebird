unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCalendars,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.WinXCtrls, Vcl.WinXPickers,
  Vcl.Imaging.pngimage, EAppProt, Vcl.Imaging.jpeg, Data.DB, Vcl.Grids,
  Vcl.DBGrids, frxClass, UCarteirinhas;
  //Vcl.Imaging.pngimage, EAppProt, Vcl.Imaging.jpeg, ESpshScr;

type
  TFrmPrincipal = class(TForm)
    PanelMenuDireita: TPanel;
    CalendarView1: TCalendarView;
    GBoxUsuario: TGroupBox;
    LabelUsuario: TLabel;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Funes1: TMenuItem;
    PanelMenuTop: TPanel;
    Sair1: TMenuItem;
    Deslogar1: TMenuItem;
    Encerrar1: TMenuItem;
    Membros1: TMenuItem;
    btnADDMEmbro: TSpeedButton;
    Profissoes1: TMenuItem;
    SpeedButton2: TSpeedButton;
    btnGRUPOS: TSpeedButton;
    ratamentos1: TMenuItem;
    btnTratamentos: TSpeedButton;
    LabelHora: TLabel;
    Image2: TImage;
    Image3: TImage;
    SobreoPrograma1: TMenuItem;
    SobreoPrograma: TMenuItem;
    Configuraes1: TMenuItem;
    Carteirinhas1: TMenuItem;
    btnCarteirinhas: TSpeedButton;
    //EvSplashScreen1: TEvSplashScreen;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure Membros1Click(Sender: TObject);
    procedure btnADDMEmbroClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Profissoes1Click(Sender: TObject);
    procedure btnGRUPOSClick(Sender: TObject);
    procedure Tratamentos1Click(Sender: TObject);
    procedure btnTratamentosClick(Sender: TObject);
    procedure Deslogar1Click(Sender: TObject);
    procedure SobreoProgramaClick(Sender: TObject);
    procedure Licensa1Click(Sender: TObject);
    procedure Carteirinhas1Click(Sender: TObject);
    procedure btnCarteirinhasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UDM, ULogin, UCadMembro, UProfissoes, UGrupos, UTratamentos, USobre;

procedure TFrmPrincipal.btnGRUPOSClick(Sender: TObject);
begin
FrmGRUPOS.ShowModal;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmPrincipal.Carteirinhas1Click(Sender: TObject);
begin
//carrega o componente TFRXREPORT em modo Design em tempo de execu��o
  DM.frxCarteirinha.DesignReport();
end;

procedure TFrmPrincipal.Deslogar1Click(Sender: TObject);
begin
//if FrmLogin = nil then
begin
FrmLogin := TFrmLogin.Create(self);
FrmPrincipal.Close;
FrmLogin.ShowModal;
//Close();
//end
//else
//begin
//FrmLogin.WindowState := wsNormal;
//FrmLogin.BringToFront;
//FrmLogin.Focused;
//Close();
end;
end;

procedure TFrmPrincipal.Encerrar1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
//Abre form full Screen ( precisa configurar BorderStyle = bsSigle ou none )
var
   r : TRect;
begin
//Mostra o user logado no sistema
LabelUsuario.Caption := DM.TblAcesso.FieldByName('USUARIO').AsString;

 //Abre form full Screen ( precisa configurar BorderStyle = bsSigle ou none )
 SystemParametersInfo(SPI_GETWORKAREA, 0, @r,0) ;
 SetBounds(r.Left, r.Top, r.Right-r.Left, r.Bottom-r.Top) ;

end;

procedure TFrmPrincipal.Licensa1Click(Sender: TObject);
begin
FrmAppCodLib.ShowModal;
end;

procedure TFrmPrincipal.Membros1Click(Sender: TObject);
begin
FrmCadMembro.ShowModal;
end;

procedure TFrmPrincipal.Profissoes1Click(Sender: TObject);
begin
FrmCadProfissoes.ShowModal;
end;

procedure TFrmPrincipal.Tratamentos1Click(Sender: TObject);
begin
FrmTRATAMENTOS.ShowModal;
end;

procedure TFrmPrincipal.SobreoProgramaClick(Sender: TObject);
begin
FrmSobre.ShowModal;
end;


procedure TFrmPrincipal.btnADDMEmbroClick(Sender: TObject);
begin
FrmCadMembro.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
Application.Terminate;
end;


procedure TFrmPrincipal.btnTratamentosClick(Sender: TObject);
begin
FrmTRATAMENTOS.ShowModal;
end;

procedure TFrmPrincipal.btnCarteirinhasClick(Sender: TObject);
begin
FrmCarteirinha.ShowModal;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
//Mostra a hora do sitema
begin
    LabelHora.Caption := TimeToStr(now);
end;

end.
