inherited FormCadastroEstados: TFormCadastroEstados
  Caption = 'Cadastro de Estados'
  ClientWidth = 828
  ExplicitWidth = 844
  PixelsPerInch = 96
  TextHeight = 13
  object lbEstado: TLabel [1]
    Left = 112
    Top = 24
    Width = 42
    Height = 13
    Caption = 'Estado *'
  end
  object lbUF: TLabel [2]
    Left = 352
    Top = 24
    Width = 22
    Height = 13
    Caption = 'UF *'
  end
  object lbCodPais: TLabel [3]
    Left = 416
    Top = 24
    Width = 70
    Height = 13
    Caption = 'C'#243'digo do Pais'
  end
  object lbPais: TLabel [4]
    Left = 507
    Top = 24
    Width = 19
    Height = 13
    Caption = 'Pais'
  end
  inherited btnSalvar: TButton
    OnExit = btnSalvarExit
  end
  inherited edtDtCad: TEdit
    TabOrder = 8
  end
  inherited edtDtUltAlt: TEdit
    TabOrder = 9
  end
  object edtEstado: TEdit
    Left = 112
    Top = 40
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object edtUF: TEdit
    Left = 352
    Top = 40
    Width = 41
    Height = 21
    TabOrder = 4
  end
  object edtCodPais: TEdit
    Left = 416
    Top = 40
    Width = 73
    Height = 21
    TabOrder = 5
  end
  object edtPais: TEdit
    Left = 507
    Top = 40
    Width = 192
    Height = 21
    TabOrder = 6
  end
  object btnPesquisar: TButton
    Left = 705
    Top = 38
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 7
    OnClick = btnPesquisarClick
  end
end
