unit UDizimos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDM, Data.DB, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmDIZIMOOFERTA = class(TForm)
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    DBGridDIZIMOS: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditID: TEdit;
    EditROLL: TEdit;
    EditNOME: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabelOBS: TLabel;
    EditVALDIZIMO: TEdit;
    DatePickerDIZIMO: TJvDatePickerEdit;
    CBFormas: TComboBox;
    MemoOBSERVACAO: TMemo;
    btnBUSCAR: TSpeedButton;
    Label8: TLabel;
    cbTipo: TComboBox;
    procedure EditVALDIZIMOChange(Sender: TObject);
    procedure EditVALDIZIMOKeyPress(Sender: TObject; var Key: Char);
    procedure btnBUSCARClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
//    procedure EditBUSCARROLLChange(Sender: TObject);
//    procedure EditBUSCARChange(Sender: TObject);
    procedure DBGridBUSCARCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure limparCampos();
   procedure habilitarCampos();
   procedure desabilitarCampos();
   procedure buscarTudo();
   procedure associarCampos();
//   procedure buscarNome();
//   procedure buscarRoll();
  end;

var
  FrmDIZIMOOFERTA: TFrmDIZIMOOFERTA;
  // VAR PARA PROCEDURE FORMATA MOEDAS
   s : string;
   v : double;
   I : integer;

implementation

{$R *.dfm}

uses UBuscarMembro;

{ TFrmDIZIMOOFERTA }

procedure TFrmDIZIMOOFERTA.associarCampos;
begin
   DM.TBL_DIZIMOS.FieldByName('NOME')       .AsString   := EditNOME.Text;
   DM.TBL_DIZIMOS.FieldByName('ROLL')       .AsString   := EditROLL.Text;
   DM.TBL_DIZIMOS.FieldByName('DATA')       .AsDateTime := Date;
   DM.TBL_DIZIMOS.FieldByName('FORMA')      .AsString   := cbFORMAS.Text;
   DM.TBL_DIZIMOS.FieldByName('TIPO')       .AsString   := cbTIPO.Text;
   DM.TBL_DIZIMOS.FieldByName('VALOR')      .AsString   := EditVALDIZIMO.Text;
   DM.TBL_DIZIMOS.FieldByName('OBS')        .AsString   := MemoOBSERVACAO.Text;

end;

procedure TFrmDIZIMOOFERTA.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryDIZIMOS.Close;
    DM.QueryDIZIMOS.SQL.Clear;
    DM.QueryDIZIMOS.SQL.Add('delete from TBL_DIZIMOS where ID = :ID');

    DM.QueryDIZIMOS.ParamByName('ID').Value := EditID.Text;
    DM.QueryDIZIMOS.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    DM.TBL_DIZIMOS.Active := false;
    DM.TBL_DIZIMOS.Active := true;

    btnBUSCAR.Enabled := false;
    EditNOME.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmDIZIMOOFERTA.btnEditarClick(Sender: TObject);
begin
  if (editNOME.Text <> '') then
    begin
        //associarCampos;
        DM.TBL_DIZIMOS.Edit;
        DM.QueryDIZIMOS.Close;
        DM.QueryDIZIMOS.SQL.Clear;
        DM.QueryDIZIMOS.SQL.Add('update TBL_MEMBROS set '+
        ' NOME              =  :NOME                 , ROLL                 = :ROLL                 , '+
        ' DATA              =  :DATA                 , FORMA                = :FORMA                , '+
        ' TIPO              =  :TIPO                 , VALOR                = :VALOR                , '+
        ' OBS               =  :OBS                   where id              = :id                     ');

        DM.QueryDIZIMOS.ParamByName('ROLL').AsString := EditROLL.Text;
        DM.QueryDIZIMOS.ParamByName('NOME').AsString := EditNome.Text;
        DM.QueryDIZIMOS.ParamByName('DATA').AsDate := DatePickerDIZIMO.Date;
        DM.QueryDIZIMOS.ParamByName('FORMA').AsString := CBFormas.Text;
        DM.QueryDIZIMOS.ParamByName('TIPO').AsString := cbTIPO.Text;
        DM.QueryDIZIMOS.ParamByName('VALOR').AsString := EditVALDIZIMO.Text;
        DM.QueryDIZIMOS.ParamByName('OBS').AsString := MemoOBSERVACAO.Text;
        DM.QueryDIZIMOS.ParamByName('ID').AsString := EditID.Text;

        DM.QueryDIZIMOS.ExecSql;

        MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
        buscarTudo;
//        desabilitarCampos;
//        limparCampos;
        btnBUSCAR.Enabled := false;
        btnSalvar.Enabled := false;
        btnEditar.Enabled := false;
        btnDeletar.Enabled := false;
        btnNovo.Enabled := true;
        DBGridDIZIMOS.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmDIZIMOOFERTA.btnNovoClick(Sender: TObject);
begin
  //apos editar um dado esta desbilitando o Edit
  DBGridDIZIMOS.Enabled:=false;
//  habilitarCampos();
//  limparCampos();
  //EditNOME.Enabled := true; // Reabilita Edit
  //EditNOME.Text := '';
  EditROLL.SetFocus;
  DM.TBL_DIZIMOS.Insert;

  btnBUSCAR.Enabled := true;
  BtnSalvar.Enabled := true;
  btnNovo.Enabled := true;
  btnEditar.Enabled := true;
  btnDeletar.Enabled := false;
end;

procedure TFrmDIZIMOOFERTA.BtnSalvarClick(Sender: TObject);
begin
  if (EditNOME.Text <> '') then
  begin
    associarCampos;
    DM.TBL_DIZIMOS.Post;
    MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
//    desabilitarCampos;
    btnBUSCAR.Enabled := false;
    btnSalvar.Enabled := false;
    btnNovo.Enabled := true;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    DBGridDIZIMOS.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmDIZIMOOFERTA.buscarTudo;
begin
  DM.QueryMembro.Close;
  DM.QueryMembro.SQL.Clear;
  DM.QueryMembro.SQL.Add('select * from TBL_DIZIMOS order by nome asc');
  DM.QueryMembro.Open();
end;

procedure TFrmDIZIMOOFERTA.DBGridBUSCARCellClick(Column: TColumn);
begin
  DM.TBL_MEMBROS.Edit;
  DM.QueryMembro.Edit;
  btnEditar.Enabled := true;
  btnDeletar.Enabled := true;
  habilitarCampos;


  if DM.QueryDIZIMOS.FieldByName('NOME').Value <> null then
    EditNOME.Text := DM.QueryDIZIMOS.FieldByName('NOME').Value;

  if DM.QueryDIZIMOS.FieldByName('ROLL').Value <> null then
     EditNOME.Text := DM.QueryDIZIMOS.FieldByName('ROLL').Value;



end;

procedure TFrmDIZIMOOFERTA.desabilitarCampos;
begin
  EditNOME        .Enabled := false;
  EditROLL        .Enabled := false;
  EditVALDIZIMO   .Enabled := false;
  MemoOBSERVACAO  .Enabled := false;
end;

procedure TFrmDIZIMOOFERTA.EditVALDIZIMOChange(Sender: TObject);
begin
   //se o edit estiver vazio, nada pode ser feito.
   If (EditVALDIZIMO.Text = emptystr) then
      EditVALDIZIMO.Text := '0,00';

   //obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(EditVALDIZIMO.Text) do
   if (EditVALDIZIMO.text[I] in ['0'..'9']) then
      s := s + EditVALDIZIMO.text[I];

   //fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //Formata o valor de (V) para aceitar valores do tipo 0,10.
   EditVALDIZIMO.text := FormatFloat('###,##0.00',v);
   EditVALDIZIMO.SelStart := Length(EditVALDIZIMO.text);
end;

procedure TFrmDIZIMOOFERTA.EditVALDIZIMOKeyPress(Sender: TObject;
  var Key: Char);
begin
   if NOT (Key in ['0'..'9', #8, #9]) then
   key := #0;
   //Função posiciona o cursor sempre a direita como nos Caixas Eletronicos
   EditVALDIZIMO.selstart := Length(EditVALDIZIMO.text);
end;

procedure TFrmDIZIMOOFERTA.FormShow(Sender: TObject);
begin
  DM.TBL_DIZIMOS.Active := false;
  DM.TBL_DIZIMOS.Active := true;
  DM.QueryDIZIMOS.Active := false;
  DM.QueryDIZIMOS.Active := true;
  buscarTudo;
  limparCampos;
  BtnSalvar.Enabled  := false;
  btnEditar.Enabled  := false;
  btnDeletar.Enabled := false;
  btnBUSCAR.Enabled := false;
end;

procedure TFrmDIZIMOOFERTA.habilitarCampos;
begin
  EditNOME        .Enabled := true;
  EditROLL        .Enabled := true;
  EditVALDIZIMO   .Enabled := true;
  MemoOBSERVACAO  .Enabled := true;
end;
//
procedure TFrmDIZIMOOFERTA.limparCampos;
begin
  EditNOME        .Text  := '';
  EditROLL        .Text  := '';
  EditVALDIZIMO   .Text  := '';
  MemoOBSERVACAO  .Text  := '';
end;

procedure TFrmDIZIMOOFERTA.btnBUSCARClick(Sender: TObject);
begin
  FrmBUSCARMEMBRO.ShowModal;
end;

end.
