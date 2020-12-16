object FrmSobre: TFrmSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Sobre o Programa'
  ClientHeight = 321
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object SpeedButton1: TSpeedButton
    Left = 104
    Top = 176
    Width = 111
    Height = 22
  end
  object EvAppProtect1: TEvAppProtect
    IdApplication = 1974
    RegKey = '\SOFTWARE\TCF Software\AppProtect\'
    Left = 392
    Top = 176
  end
end
