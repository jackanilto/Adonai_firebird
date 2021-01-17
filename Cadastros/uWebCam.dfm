object frmWebCam: TfrmWebCam
  Left = 0
  Top = 0
  Caption = 'Captura foto para Cadastro'
  ClientHeight = 361
  ClientWidth = 684
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
    Width = 342
    Height = 361
    TabOrder = 0
    object pbCamera: TPaintBox
      Left = 1
      Top = 1
      Width = 340
      Height = 310
      Align = alClient
      ExplicitWidth = 254
      ExplicitHeight = 303
    end
    object btnFOTOGRAFAR: TSpeedButton
      Left = 1
      Top = 311
      Width = 340
      Height = 49
      Align = alBottom
      Caption = 'Fotografar'
      OnClick = btnFOTOGRAFARClick
      ExplicitTop = 280
      ExplicitWidth = 258
    end
  end
  object pnlRight: TPanel
    Left = 342
    Top = 0
    Width = 342
    Height = 361
    TabOrder = 1
    object imgSnapshot: TImage
      Left = 1
      Top = 1
      Width = 340
      Height = 310
      Align = alClient
      ExplicitLeft = 32
      ExplicitWidth = 227
      ExplicitHeight = 303
    end
    object btnSALVARFOTO: TSpeedButton
      Left = 1
      Top = 311
      Width = 340
      Height = 49
      Align = alBottom
      Caption = 'Salvar Foto'
      OnClick = btnSALVARFOTOClick
      ExplicitTop = 280
      ExplicitWidth = 258
    end
  end
end
