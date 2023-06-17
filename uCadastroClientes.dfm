inherited FormCadastroClientes: TFormCadastroClientes
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbNome: TLabel
    Width = 120
    Caption = 'Nome Completo Cliente *'
    ExplicitWidth = 120
  end
  object lbQtdeGrupo: TLabel [10]
    Left = 18
    Top = 168
    Width = 112
    Height = 13
    Caption = 'Quantidade no Grupo *'
  end
  object edtQtdeGrupo: TEdit [22]
    Left = 8
    Top = 187
    Width = 196
    Height = 21
    TabOrder = 11
  end
  object CBPagou: TCheckBox [23]
    Left = 313
    Top = 187
    Width = 97
    Height = 17
    Caption = 'Pagou *'
    TabOrder = 12
  end
  inherited btnPesquisar: TButton
    TabOrder = 13
  end
end
