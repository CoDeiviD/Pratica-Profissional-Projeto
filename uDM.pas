unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.IBWrapper;

type
  TDM = class(TDataModule)
    FDBanco: TFDConnection;
    FDTrans: TFDTransaction;
    qPaises: TFDQuery;
    DsPaises: TDataSource;
    qEstados: TFDQuery;
    DsEstados: TDataSource;
    qCidades: TFDQuery;
    DsCidades: TDataSource;
    DsClientes: TDataSource;
    DsForns: TDataSource;
    qClientes: TFDQuery;
    qForns: TFDQuery;
    qFuncs: TFDQuery;
    DSFuncs: TDataSource;
    qContPgr: TFDQuery;
    qContRcb: TFDQuery;
    qProdutos: TFDQuery;
    qCaixas: TFDQuery;
    DSContPgr: TDataSource;
    DSProdutos: TDataSource;
    DSCaixas: TDataSource;
    DSContRcb: TDataSource;
    qPaisesCODPAIS: TIntegerField;
    qPaisesPAIS: TStringField;
    qPaisesSIGLA: TStringField;
    qPaisesDDI: TStringField;
    qPaisesMOEDA: TStringField;
    qEstadosCODESTADO: TIntegerField;
    qEstadosESTADO: TStringField;
    qEstadosUF: TStringField;
    qEstadosCODPAIS: TIntegerField;
    qCidadesCODCIDADE: TIntegerField;
    qCidadesCIDADE: TStringField;
    qCidadesDDD: TStringField;
    qCidadesCODESTADO: TIntegerField;
    qContPgrVALOR: TCurrencyField;
    qContPgrDTVENCIMENTO: TDateField;
    qContPgrDTPAGAMENTO: TDateField;
    qContPgrVPAGO: TCurrencyField;
    qContPgrFORNECEDOR: TStringField;
    qContRcbVALOR: TCurrencyField;
    qContRcbDTVENCIMENTO: TDateField;
    qContRcbDTPAGAMENTO: TDateField;
    qContRcbVRECEB: TCurrencyField;
    qContRcbCLIENTE: TStringField;
    qProdutosTPPRODUTO: TStringField;
    qProdutosSABOR: TStringField;
    qProdutosPRECO: TCurrencyField;
    qCaixasDATA: TDateField;
    qCaixasHISTORICO: TStringField;
    qCaixasENTRADA: TCurrencyField;
    qCaixasSAIDA: TCurrencyField;
    qCaixasSALDO: TCurrencyField;
    qCaixasSALDOTOTAL: TCurrencyField;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qClientesNOME: TStringField;
    qClientesDTNASC: TDateField;
    qClientesCPF_CNPJ: TStringField;
    qClientesRG: TStringField;
    qClientesCEP: TStringField;
    qClientesENDERECO: TStringField;
    qClientesEMAIL: TStringField;
    qClientesTELEFONE: TStringField;
    qClientesMIDIA: TStringField;
    qClientesCFS: TStringField;
    qClientesCODCLIENTE: TIntegerField;
    qClientesCODCIDADE: TIntegerField;
    qFornsNOME: TStringField;
    qFornsRAZAOSOCIAL: TStringField;
    qFornsINSCRESTADUAL: TStringField;
    qFornsCNPJ: TStringField;
    qFornsCEP: TStringField;
    qFornsENDERECO: TStringField;
    qFornsEMAIL: TStringField;
    qFornsTELEFONE: TStringField;
    qFornsCODFORNECEDOR: TIntegerField;
    qFornsCODCIDADE: TIntegerField;
    qFornsCODPRODUTO: TIntegerField;
    FDIBValidate1: TFDIBValidate;
    qCompras: TFDQuery;
    qCondsPgto: TFDQuery;
    DSCompras: TDataSource;
    DSCondsPgto: TDataSource;
    DSVendas: TDataSource;
    qVendas: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
