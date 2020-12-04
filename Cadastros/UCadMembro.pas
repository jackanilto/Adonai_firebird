unit UCadMembro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadMembro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    Label1: TLabel;
    EditNOME: TEdit;
    grid: TDBGrid;
    EditID: TEdit;
    dialog: TOpenPictureDialog;
    btnAdd: TButton;
    img: TImage;
    Label2: TLabel;
    edtBuscar: TEdit;
    ImageList1: TImageList;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    EditCIDADE: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);

  private
    { Private declarations }
  public
   { Public declarations }
   procedure limparCampos();
   procedure habilitarCampos();
   procedure desabilitarCampos();
   procedure buscarTudo();
   procedure buscarNome();
   procedure associarCampos();
//   procedure carregarComboboxFilial();
//   procedure carregarComboboxMatriz();
//   procedure carregarComboboxFuncoes();
   procedure carregarImagemPadrao();
   procedure salvarFoto();
//   procedure carregarComboboxIgrejas();
  end;

var
  FrmCadMembro: TFrmCadMembro;
  caminhoImg: string;
  imgPessoa: TPicture;
  alterou: boolean;


implementation

{$R *.dfm}

uses UDM;

procedure TFrmCadMembro.associarCampos;
begin
 DM.TBL_MEMBROS.FieldByName('NOME').Value :=EditNOME.Text;
end;

procedure TFrmCadMembro.btnAddClick(Sender: TObject);
begin
dialog.Execute();
img.Picture.LoadFromFile(dialog.filename);
alterou := true;
end;

procedure TFrmCadMembro.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryMembro.Close;
    DM.QueryMembro.SQL.Clear;
    DM.QueryMembro.SQL.Add('delete from TBL_MEMBROS where ID = :ID');

    DM.QueryMembro.ParamByName('ID').Value := editID.Text;
    DM.QueryMembro.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    DM.TBL_MEMBROS.Active := false;
    DM.TBL_MEMBROS.Active := true;

    EditNOME.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmCadMembro.btnEditarClick(Sender: TObject);
begin
if (editNOME.Text <> '') then
    begin
    associarCampos;
    DM.TBL_MEMBROS.Edit;

    DM.QueryMembro.Close;
    DM.QueryMembro.SQL.Clear;

    if alterou = false then
    begin
    DM.QueryMembro.SQL.Add('update TBL_MEMBROS set nome = :nome where id = :id');
    end
    else
    begin
    DM.QueryMembro.SQL.Add('update TBL_MEMBROS set nome = :nome, imagem = :imagem where id = :id');
    imgPessoa := TPicture.Create;
    imgPessoa.LoadFromFile(dialog.FileName);
    DM.QueryMembro.ParamByName('imagem').Assign(imgPessoa);
    imgPessoa.Free;
    alterou := false;
    end;


    DM.QueryMembro.ParamByName('nome').Value := edItNome.Text;

    DM.QueryMembro.ParamByName('id').Value := editID.Text;
    DM.QueryMembro.ExecSql;

    MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    desabilitarCampos;
    limparCampos;
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
//begin
//if (EditNOME.Text <> '') then
//    begin
//    associarCampos;
//    dm.TBL_MEMBROS.Edit;
//
//    DM.QueryMembro.Close;
//    DM.QueryMembro.SQL.Clear;
//    DM.QueryMembro.SQL.Add('update TBL_MEMBROS set NOME = :NOME where ID = :ID');
//    DM.QueryMembro.ParamByName('NOME').Value := EditNOME.Text;
//    DM.QueryMembro.ParamByName('ID').Value := editID.Text;
//    DM.QueryMembro.ExecSql;
//
//    // destativa a table (solução para atualiza grid em tempo de execução)
//    //reativa a table
//    DM.TBL_MEMBROS.Active := false;
//    DM.TBL_MEMBROS.Active := true;
//
//    MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
//    buscarTudo;
//    EditNOME.Enabled := false;
//    btnSalvar.Enabled := false;
//    btnEditar.Enabled := false;
//    btnDeletar.Enabled := false;
//    btnNovo.Enabled := true;
//    end
//    else
//    begin
//    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
//    end;
//end;

procedure TFrmCadMembro.btnNovoClick(Sender: TObject);
begin
//apos editar um dado esta desbilitando o Edit
EditNOME.Enabled := true; // Reabilita Edit
EditNOME.Text := '';
EditNOME.SetFocus;
EditNOME.Enabled := true;
DM.TBL_MEMBROS.Insert;
BtnSalvar.Enabled := true;
btnNovo.Enabled := true;

btnEditar.Enabled := true;
btnDeletar.Enabled := false;
end;

procedure TFrmCadMembro.BtnSalvarClick(Sender: TObject);
begin
if (EditNOME.Text <> '') then
  begin
  associarCampos;
  salvarFoto;
  DM.TBL_MEMBROS.Post;
  MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
  buscarTudo;
  desabilitarCampos;
  btnSalvar.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  grid.Enabled := true;
  end
  else
  begin
  MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmCadMembro.buscarNome;
begin
dm.QueryMembro.Close;
dm.QueryMembro.SQL.Clear;
dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome LIKE :nome order by nome asc');
dm.QueryMembro.ParamByName('nome').Value := edtBuscar.Text + '%';
dm.QueryMembro.Open;
end;

procedure TFrmCadMembro.buscarTudo;
begin
DM.QueryMembro.Close;
DM.QueryMembro.SQL.Clear;
DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS');
DM.QueryMembro.Open();
end;

//procedure TFrmCadMembro.carregarComboboxFilial;
//begin
//
//end;
//
//procedure TFrmCadMembro.carregarComboboxFuncoes;
//begin
//
//end;
//
//procedure TFrmCadMembro.carregarComboboxIgrejas;
//begin
//
//end;
//
//procedure TFrmCadMembro.carregarComboboxMatriz;
//begin
//
//end;

procedure TFrmCadMembro.carregarImagemPadrao;
begin
    caminhoImg  := GetCurrentDir + '\img\sem-foto.jpg';
    img.Picture.LoadFromFile(caminhoImg);
end;

procedure TFrmCadMembro.desabilitarCampos;
begin
limparcampos();
EditNOME.Enabled := false;

end;

procedure TFrmCadMembro.edtBuscarChange(Sender: TObject);
begin
buscarNome;
end;

procedure TFrmCadMembro.FormShow(Sender: TObject);
begin
DM.TBL_MEMBROS.Active := false;
DM.TBL_MEMBROS.Active := true;
buscarTudo;
btnSalvar.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;

carregarImagemPadrao();
end;

procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao :
TImage);

 var MemoryStream:TMemoryStream; jpg : TPicture;
 const
  OffsetMemoryStream : Int64 = 0;

begin
  if not(DataSet.IsEmpty) and
  not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
    try
      MemoryStream := TMemoryStream.Create;
      Jpg := TPicture.Create;
      (DataSet.FieldByName(BlobFieldName) as
TBlobField).SaveToStream(MemoryStream);
      MemoryStream.Position := OffsetMemoryStream;
      Jpg.LoadFromStream(MemoryStream);
      ImageExibicao.Picture.Assign(Jpg);
    finally
     // Jpg.Free;
      MemoryStream.Free;
    end
  else
    ImageExibicao.Picture := Nil;
end;


procedure TFrmCadMembro.gridCellClick(Column: TColumn);
begin
DM.TBL_MEMBROS.Edit;
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
btnAdd.Enabled := true;
habilitarCampos;

if DM.QueryMembro.FieldByName('NOME').Value <> null then
EditNOME.Text := DM.QueryMembro.FieldByName('NOME').Value;
editID.Text := DM.QueryMembro.FieldByName('ID').Value;

 if DM.QueryMembro.FieldByName('imagem').Value <> null then
 ExibeFoto(dm.querymembro, 'imagem', img);

end;

procedure TFrmCadMembro.habilitarCampos;
begin
limparCampos;
EditNOME.Enabled := True;

end;

procedure TFrmCadMembro.limparCampos;
begin

end;

procedure TFrmCadMembro.salvarFoto;
begin
 if dialog.FileName <> '' then
  begin
  imgPessoa := TPicture.Create;
  imgPessoa.LoadFromFile(dialog.FileName);
  DM.TBL_MEMBROS.FieldByName('imagem').Assign(imgPessoa);
  imgPessoa.Free;
  dialog.FileName := GetCurrentDir + '\img\sem-foto.jpg';
  alterou := false;
  end
  else
    begin
  DM.TBL_MEMBROS.FieldByName('imagem').Value := GetCurrentDir + '\img\sem-foto.jpg';

  end;
end;

end.
