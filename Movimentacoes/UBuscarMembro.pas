unit UBuscarMembro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, UDizimos, Vcl.ExtCtrls;

type
  TFrmBUSCARMEMBRO = class(TForm)
    DBGridBUSCAR: TDBGrid;
    GroupBox1: TGroupBox;
    EditBUSCARROLL: TEdit;
    GroupBox2: TGroupBox;
    EditBUSCAR: TEdit;
    procedure EditBUSCARChange(Sender: TObject);
    procedure DBGridBUSCARCellClick(Column: TColumn);
    procedure EditBUSCARROLLChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure buscarTudo();
   procedure buscarNome();
   procedure buscarRoll();
   procedure limparCampos();
  end;

var
  FrmBUSCARMEMBRO: TFrmBUSCARMEMBRO;

implementation

{$R *.dfm}

{ TFrmBUSCARMEMBRO }

procedure TFrmBUSCARMEMBRO.buscarNome;

  BEGIN

    dm.QueryMembro.Close;
    dm.QueryMembro.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
    dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome collate win_ptbr LIKE :nome order by nome asc');
    dm.QueryMembro.ParamByName('nome').Value := editBuscar.Text + '%';
    dm.QueryMembro.Open;
  end;


procedure TFrmBUSCARMEMBRO.buscarRoll;
{Filtra por numero de Roll}
begin
  dm.QueryMembro.Close;
  dm.QueryMembro.SQL.Clear;
  dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where ROLL LIKE :ROLL');
  dm.QueryMembro.ParamByName('ROLL').Value := editBuscarROLL.Text + '%';
  dm.QueryMembro.Open;
end;

procedure TFrmBUSCARMEMBRO.buscarTudo;
begin
  DM.QueryMembro.Close;
  DM.QueryMembro.SQL.Clear;
  DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
  DM.QueryMembro.Open();
end;

procedure TFrmBUSCARMEMBRO.DBGridBUSCARCellClick(Column: TColumn);
begin
  {Associa a field do DBGrid aos edits da form DIZIMOS}
  FrmDIZIMOOFERTA.EditID.Text := DBGridBUSCAR.Fields[0].AsString;
  FrmDIZIMOOFERTA.EditROLL.Text := DBGridBUSCAR.Fields[1].AsString;
  FrmDIZIMOOFERTA.EditNOME.Text := DBGridBUSCAR.Fields[2].AsString;
  FrmBUSCARMEMBRO.Close;
end;

procedure TFrmBUSCARMEMBRO.EditBUSCARROLLChange(Sender: TObject);
begin
  buscarRoll;
end;

procedure TFrmBUSCARMEMBRO.FormShow(Sender: TObject);
begin
  limparCampos;
  buscarTudo;

end;

procedure TFrmBUSCARMEMBRO.limparCampos;
begin
  EditBUSCARROLL.Text  := '';
  EditBUSCAR.Text  := '';
end;

procedure TFrmBUSCARMEMBRO.EditBUSCARChange(Sender: TObject);
begin
  buscarNome;
end;

end.
