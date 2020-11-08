unit UProfissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmCadProfissoes = class(TForm)
    GridProf: TDBGrid;
    EditPROFISSAO: TEdit;
    Label1: TLabel;
    EditCOD: TEdit;
    BtnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridProfCellClick(Column: TColumn);
 //   function ProximoID(GENERATOR: string): integer;
  private
    { Private declarations }
    procedure buscarTudo();
    procedure associarCampos();
  public
    { Public declarations }
  end;

var
  FrmCadProfissoes: TFrmCadProfissoes;
  //nomeAntigo: string;

implementation

{$R *.dfm}

uses UDM, UCadMembro, ULogin, UPrincipal;

{ TFrmCadProfissoes }


{ TFrmCadProfissoes }

procedure TFrmCadProfissoes.associarCampos;
begin
 DM.TBL_PROFISSOES.FieldByName('PROFISSAO').Value :=EditPROFISSAO.Text;
end;

procedure TFrmCadProfissoes.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryProfissoes.Close;
    DM.QueryProfissoes.SQL.Clear;
    DM.QueryProfissoes.SQL.Add('delete from TBL_PROFISSOES where ID = :ID');

    DM.QueryProfissoes.ParamByName('ID').Value := editCod.Text;
    DM.QueryProfissoes.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    DM.TBL_PROFISSOES.Active := false;
    DM.TBL_PROFISSOES.Active := true;

    EditPROFISSAO.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmCadProfissoes.btnEditarClick(Sender: TObject);
begin
if (EditPROFISSAO.Text <> '') then
    begin
    associarCampos;
    dm.TBL_PROFISSOES.Edit;

    DM.QueryProfissoes.Close;
    DM.QueryProfissoes.SQL.Clear;
    DM.QueryProfissoes.SQL.Add('update TBL_PROFISSOES set PROFISSAO = :PROFISSAO where ID = :ID');
    DM.QueryProfissoes.ParamByName('PROFISSAO').Value := EditPROFISSAO.Text;
    DM.QueryProfissoes.ParamByName('ID').Value := editCod.Text;
    DM.QueryProfissoes.ExecSql;

    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    DM.TBL_PROFISSOES.Active := false;
    DM.TBL_PROFISSOES.Active := true;

    MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    EditPROFISSAO.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmCadProfissoes.btnNovoClick(Sender: TObject);
begin
//apos editar um dado esta desbilitando o EditPROFISSAO
EditPROFISSAO.Enabled := true; // Reabilita EditPROFISSAO
EditPROFISSAO.Text := '';
EditPROFISSAO.SetFocus;
EditPROFISSAO.Enabled := true;
DM.TBL_PROFISSOES.Insert;
BtnSalvar.Enabled := true;
btnNovo.Enabled := true;

btnEditar.Enabled := true;
btnDeletar.Enabled := false;
end;

procedure TFrmCadProfissoes.BtnSalvarClick(Sender: TObject);
begin
if (EditPROFISSAO.Text <> '')  then
  begin
  associarCampos;
  DM.TBL_PROFISSOES.Post;
  buscarTudo;
  MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
  EditPROFISSAO.Enabled := false;
  // destativa/Reativa table (solução para atualiza grid em tempo de execução)
  DM.TBL_PROFISSOES.Active := false;   // destativa a table
  DM.TBL_PROFISSOES.Active := true;    //reativa a table


  btnSalvar.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  DM.QueryProfissoes.Close;
  DM.QueryProfissoes.Open;
  end
  else
  begin
  MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmCadProfissoes.buscarTudo;
begin
DM.QueryProfissoes.Close;
DM.QueryProfissoes.SQL.Clear;
DM.QueryProfissoes.SQL.Add('select * from TBL_PROFISSOES');
DM.QueryProfissoes.Open();
end;

procedure TFrmCadProfissoes.FormShow(Sender: TObject);
begin
DM.TBL_PROFISSOES.Active := false;
DM.TBL_PROFISSOES.Active := true;
buscarTudo;
btnSalvar.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
end;

procedure TFrmCadProfissoes.GridProfCellClick(Column: TColumn);
begin
DM.TBL_PROFISSOES.Edit;
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
EditPROFISSAO.Enabled := true;

if DM.TBL_PROFISSOES.FieldByName('PROFISSAO').Value <> null then
EditPROFISSAO.Text := DM.TBL_PROFISSOES.FieldByName('PROFISSAO').Value;
edItCod.Text := DM.TBL_PROFISSOES.FieldByName('ID').Value;

end;
end.
