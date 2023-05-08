object FormCadastroPai: TFormCadastroPai
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 420
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TLabel
    Left = 16
    Top = 21
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbDtCad: TLabel
    Left = 256
    Top = 360
    Width = 85
    Height = 13
    Caption = 'Data de Cadastro'
  end
  object lbDtUltAlt: TLabel
    Left = 384
    Top = 360
    Width = 78
    Height = 13
    Caption = #218'ltima Altera'#231#227'o'
  end
  object lbObrigadtorio: TLabel
    Left = 50
    Top = 399
    Width = 99
    Height = 13
    Caption = '* Campo Obrigat'#243'rio'
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 40
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 625
    Top = 377
    Width = 75
    Height = 25
    Caption = 'Sa&lvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnSair: TButton
    Left = 729
    Top = 377
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object edtDtCad: TEdit
    Left = 264
    Top = 379
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object edtDtUltAlt: TEdit
    Left = 392
    Top = 379
    Width = 57
    Height = 21
    TabOrder = 4
  end
end
