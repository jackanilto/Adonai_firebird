object FrmSobre: TFrmSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Sobre o Programa'
  ClientHeight = 311
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 10
    Top = 240
    Width = 185
    Height = 41
    Caption = 'Renovar licen'#231'a agora'
    OnClick = SpeedButton1Click
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 24
    Width = 578
    Height = 73
    Caption = 'Per'#237'odo da licen'#231'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 35
      Top = 21
      Width = 62
      Height = 20
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object EvAppProtect1: TEvAppProtect
    IdApplication = 1974
    RegKey = '\SOFTWARE\TCF Software\AppProtect\'
    Left = 392
    Top = 176
  end
end
