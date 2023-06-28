object FormConsultaPai: TFormConsultaPai
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 389
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtChave: TEdit
    Left = 24
    Top = 24
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object btnInserir: TButton
    Left = 319
    Top = 351
    Width = 75
    Height = 25
    Caption = '&Inserir'
    TabOrder = 1
  end
  object btnAlterar: TButton
    Left = 400
    Top = 352
    Width = 75
    Height = 25
    Caption = '&Alterar'
    TabOrder = 2
  end
  object btnExcluir: TButton
    Left = 489
    Top = 352
    Width = 75
    Height = 25
    Caption = '&Excluir'
    TabOrder = 3
  end
  object btnSair: TButton
    Left = 569
    Top = 352
    Width = 73
    Height = 25
    Caption = '&Sair'
    TabOrder = 4
  end
  object btnPesquisa: TButton
    Left = 296
    Top = 24
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 5
    OnClick = btnPesquisaClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 55
    Width = 618
    Height = 282
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
