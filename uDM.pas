unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
