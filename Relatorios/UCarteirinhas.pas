unit UCarteirinhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, UDM,
  Vcl.StdCtrls, Vcl.Buttons, Jpeg;

type
  TFrmCarteirinha = class(TForm)
    gridListMembros: TDBGrid;
    gridMembrosPrinter: TDBGrid;
    edtBuscar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCarteirinha: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure edtBuscarChange(Sender: TObject);
    procedure gridListMembrosDblClick(Sender: TObject);
    procedure btnCarteirinhaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure buscarTudo();
   procedure buscarNome();
  end;

var
  FrmCarteirinha: TFrmCarteirinha;

implementation

{$R *.dfm}

procedure TFrmCarteirinha.btnCarteirinhaClick(Sender: TObject);

begin
//Aqui seria a nova linha
//Dm.frxReportCarteira.Loadfromfile( DM.CDSCarteiraIMAGEM.value);
//DM.frxReportCarteira.ShowReport();

  DM.CDSCarteira.Open;
  DM.frxReportCarteira.LoadFromFile(GetCurrentDir + '\Relatorio\modelo_01.fr3');
  DM.frxReportCarteira.ShowReport();
  btnCarteirinha.Enabled := true;
  buscarTudo; // Após chamar o relatorio, executa a procedure BuscarTudo
end;

procedure TFrmCarteirinha.buscarNome;
begin
  dm.QueryMembro.Close;
  dm.QueryMembro.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
  dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome collate win_ptbr LIKE :nome order by nome asc');
  dm.QueryMembro.ParamByName('nome').Value := '%' + edtBuscar.Text + '%'; // o '%' + edtBuscar.Text + '%' retorna qualquer palavra em qualquer posição na frase ou nome
  dm.QueryMembro.Open;
end;

procedure TFrmCarteirinha.buscarTudo;
begin
  DM.QueryMembro.Close;
  DM.QueryMembro.SQL.Clear;
  DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
  DM.QueryMembro.Open();
end;

procedure TFrmCarteirinha.edtBuscarChange(Sender: TObject);
begin
  buscarNome;
end;

procedure TFrmCarteirinha.FormShow(Sender: TObject);
begin
  buscarTudo;
  edtBuscar.SetFocus;
end;

procedure TFrmCarteirinha.FormCreate(Sender: TObject);
begin
  DM.CDSCarteira.Active := false;
  DM.CDSCarteira.Active := true;
end;


procedure TFrmCarteirinha.gridListMembrosDblClick(Sender: TObject);
begin
  DM.CDSCarteira.Append;  //Coloca a TABELA TEMPORARIA em modo Insert ou Edit
  //Tabela TEMP Field NOME recebe Query Membro Field Nome  quando executado DuploClick
  DM.CDSCarteira.FieldByName('ID').AsInteger := dm.QueryMembro.FieldByName('ID').AsInteger;
  DM.CDSCarteira.FieldByName('NOME').AsString := dm.QueryMembro.FieldByName('NOME').AsString;
  DM.CDSCarteira.FieldByName('TRATAMENTO').AsString := dm.QueryMembro.FieldByName('TRATAMENTO').AsString;
  DM.CDSCarteira.FieldByName('NOME_PAI').AsString := dm.QueryMembro.FieldByName('NOME_PAI').AsString;
  DM.CDSCarteira.FieldByName('NOME_MAE').AsString := dm.QueryMembro.FieldByName('NOME_MAE').AsString;
  DM.CDSCarteira.FieldByName('TELPESSOAL').AsString := dm.QueryMembro.FieldByName('TELPESSOAL').AsString;
  DM.CDSCarteira.FieldByName('CONJUGE').AsString := dm.QueryMembro.FieldByName('CONJUGE').AsString;
  DM.CDSCarteira.FieldByName('DATA_NASC').AsString := dm.QueryMembro.FieldByName('DATA_NASC').AsString;
  DM.CDSCarteira.FieldByName('IMAGEM').AsString := dm.QueryMembro.FieldByName('IMAGEM').AsString;
  DM.CDSCarteira.FieldByName('ROLL').AsString := dm.QueryMembro.FieldByName('ROLL').AsString;
  DM.CDSCarteira.Post;
end;

procedure TFrmCarteirinha.SpeedButton1Click(Sender: TObject);
begin
  DM.CDSCarteira.EmptyDataSet;

end;

end.
