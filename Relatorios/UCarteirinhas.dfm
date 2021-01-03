object FrmCarteirinha: TFrmCarteirinha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Impress'#227'o de Carteirinhas'
  ClientHeight = 416
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gridListMembros: TDBGrid
    Left = 8
    Top = 160
    Width = 361
    Height = 193
    DataSource = DM.DSMembro
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object gridMembrosPrinter: TDBGrid
    Left = 375
    Top = 160
    Width = 361
    Height = 193
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
