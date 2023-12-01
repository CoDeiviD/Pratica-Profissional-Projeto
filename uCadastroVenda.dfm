inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Cadastro de Venda'
  ClientHeight = 699
  ClientWidth = 706
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 718
  ExplicitHeight = 737
  TextHeight = 13
  inherited lbDtCad: TLabel
    Left = 216
    Top = 648
    ExplicitLeft = 216
    ExplicitTop = 648
  end
  inherited lbDtUltAlt: TLabel
    Left = 344
    Top = 648
    ExplicitLeft = 344
    ExplicitTop = 648
  end
  inherited lbObrigadtorio: TLabel
    Left = 16
    Top = 670
    ExplicitLeft = 16
    ExplicitTop = 670
  end
  object lbCliente: TLabel [4]
    Left = 112
    Top = 21
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object lbDataV: TLabel [5]
    Left = 448
    Top = 21
    Width = 71
    Height = 13
    Caption = 'Data de Venda'
  end
  object lbCondPgto: TLabel [6]
    Left = 16
    Top = 421
    Width = 116
    Height = 13
    Caption = 'Condi'#231#227'o de Pagamento'
  end
  object lbObs: TLabel [7]
    Left = 16
    Top = 77
    Width = 67
    Height = 13
    Caption = 'Observa'#231#245'es:'
  end
  inherited btnSalvar: TButton
    Left = 521
    Top = 665
    ExplicitLeft = 521
    ExplicitTop = 665
  end
  inherited btnSair: TButton
    Left = 625
    Top = 665
    ExplicitLeft = 625
    ExplicitTop = 665
  end
  inherited edtDtCad: TEdit
    Left = 224
    Top = 667
    ExplicitLeft = 224
    ExplicitTop = 667
  end
  inherited edtDtUltAlt: TEdit
    Left = 352
    Top = 667
    ExplicitLeft = 352
    ExplicitTop = 667
  end
  object edtCliente: TEdit
    Left = 112
    Top = 40
    Width = 177
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 302
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 6
  end
  object cbxData: TComboBox
    Left = 448
    Top = 40
    Width = 209
    Height = 21
    TabOrder = 7
  end
  object edtCondPgto: TEdit
    Left = 16
    Top = 440
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object LVCondPgto: TListView
    Left = 16
    Top = 480
    Width = 684
    Height = 150
    Columns = <
      item
        Caption = 'Prazo de parcelamento'
      end
      item
        Caption = 'Forma de Pagamento'
      end
      item
        Caption = 'Percentual (%)'
      end
      item
        Caption = 'Valor Total do Produto'
      end>
    TabOrder = 9
    ViewStyle = vsReport
  end
  object btnGerar: TButton
    Left = 162
    Top = 438
    Width = 75
    Height = 25
    Caption = '&Gerar'
    TabOrder = 10
    OnClick = btnGerarClick
  end
  object edtObs: TEdit
    Left = 16
    Top = 96
    Width = 682
    Height = 65
    TabOrder = 11
  end
  object LVVenda: TListView
    Left = 16
    Top = 176
    Width = 682
    Height = 209
    Columns = <
      item
        Caption = 'Cliente'
      end
      item
        Caption = 'Data de Venda'
      end
      item
        Caption = 'Observa'#231#245'es'
      end>
    TabOrder = 12
    ViewStyle = vsReport
  end
end
