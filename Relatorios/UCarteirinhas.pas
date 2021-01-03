unit UCarteirinhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, UDM;

type
  TFrmCarteirinha = class(TForm)
    gridListMembros: TDBGrid;
    gridMembrosPrinter: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCarteirinha: TFrmCarteirinha;

implementation

{$R *.dfm}

end.
