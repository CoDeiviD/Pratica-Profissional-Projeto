object FormCadPessoas: TFormCadPessoas
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 400
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel
    Left = 24
    Top = 22
    Width = 42
    Height = 19
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCPF_CNPJ: TLabel
    Left = 408
    Top = 22
    Width = 80
    Height = 19
    Caption = 'CPF / CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbEmail: TLabel
    Left = 27
    Top = 98
    Width = 39
    Height = 19
    Caption = 'Email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDtNasc: TLabel
    Left = 408
    Top = 98
    Width = 141
    Height = 19
    Caption = 'Data de Nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbTelefone: TLabel
    Left = 24
    Top = 186
    Width = 61
    Height = 19
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbEndereco: TLabel
    Left = 320
    Top = 186
    Width = 65
    Height = 19
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNome: TEdit
    Left = 24
    Top = 47
    Width = 305
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Ex.: Fulando Deltano da Silva'
  end
  object edtCPF_CNPJ: TEdit
    Left = 408
    Top = 47
    Width = 169
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'CPF / CNPJ'
  end
  object edtEmail: TEdit
    Left = 24
    Top = 123
    Width = 305
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = 'Endere'#231'o@email.com'
  end
  object edtDtNasc: TEdit
    Left = 408
    Top = 123
    Width = 153
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = 'DD / MM / AAAA'
  end
  object edtTelefone: TEdit
    Left = 24
    Top = 211
    Width = 209
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TextHint = '(DD) 9999-9999'
  end
  object edtEndereco: TEdit
    Left = 320
    Top = 211
    Width = 289
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TextHint = 'Ex.: Rua JK / Av. Brasil '
  end
  object btnSalvar: TButton
    Left = 448
    Top = 368
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 6
  end
  object btnSair: TButton
    Left = 551
    Top = 368
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 7
  end
end
