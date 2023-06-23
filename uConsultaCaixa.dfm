inherited FormConsultaCaixa: TFormConsultaCaixa
  Caption = 'Ver Caixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnInserir: TButton
    OnClick = btnInserirClick
  end
  inherited btnAlterar: TButton
    OnClick = btnAlterarClick
  end
  inherited btnExcluir: TButton
    OnClick = btnExcluirClick
  end
  inherited btnSair: TButton
    OnClick = btnSairClick
  end
  inherited btnPesquisa: TButton
    OnClick = btnPesquisaClick
  end
  inherited ListView1: TListView
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'Data'
      end
      item
        Caption = 'Hist'#243'rico'
      end
      item
        Caption = 'Entrada'
      end
      item
        Caption = 'Sa'#237'da'
      end
      item
        Caption = 'SaldoBase'
      end>
    ViewStyle = vsReport
  end
end
