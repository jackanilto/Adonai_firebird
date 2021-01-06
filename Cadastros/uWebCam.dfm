object frmWebCam: TfrmWebCam
  Left = 0
  Top = 0
  Caption = 'Captura foto'
  ClientHeight = 181
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 244
    Height = 181
    Align = alClient
    Caption = 'pnlLeft'
    TabOrder = 0
    object pbCamera: TPaintBox
      Left = 1
      Top = 1
      Width = 242
      Height = 154
      Align = alClient
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object btnTake: TButton
      Left = 1
      Top = 155
      Width = 242
      Height = 25
      Align = alBottom
      Caption = 'btnTake'
      TabOrder = 0
      OnClick = btnTakeClick
    end
  end
  object pnlRight: TPanel
    Left = 244
    Top = 0
    Width = 260
    Height = 181
    Align = alRight
    Caption = 'pnlRight'
    TabOrder = 1
    object imgSnapshot: TImage
      Left = 1
      Top = 1
      Width = 258
      Height = 154
      Align = alClient
      ExplicitLeft = 5
      ExplicitTop = -5
    end
    object btnSave: TButton
      Left = 1
      Top = 155
      Width = 258
      Height = 25
      Align = alBottom
      Caption = 'btnSave'
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 5
      ExplicitTop = 161
    end
  end
end
