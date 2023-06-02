unit uConsultaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroCaixa, uCaixas, uCtrlCaixas, uColCaixas;

type
  TFormConsultaCaixa = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroCaixas : TFormCadastroCaixa;
    aCaixa : Caixas;
    aCtrlCaixa: CtrlCaixas;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  override;
    procedure Inserir;                    override;
    procedure Alterar;                    override;
    procedure Excluir;                    override;
    procedure Sair;                       override;
    procedure Pesquisar;                  override;
    procedure setCadastro(pObj: TObject); override;
    procedure CarregaLV;                  override;
  end;

var
  FormConsultaCaixa: TFormConsultaCaixa;

implementation

{$R *.dfm}

{ TFormConsultaCaixa }

procedure TFormConsultaCaixa.Alterar;
begin
  inherited;

end;

procedure TFormConsultaCaixa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaCaixa.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaCaixa.btnInserirClick(Sender: TObject);
begin
  inherited;
  self.Inserir;
end;

procedure TFormConsultaCaixa.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaCaixa.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    aCaixa  : Caixas;
    aColCaixas : ColCaixas;
begin
  inherited;
  aColCaixas := ColCaixas(aCtrlCaixa.CarregarColecao);
  self.ListView1.Clear;
  tam := aColCaixas.getTam;
  for k  := 1 to tam do
  begin
     aCaixa := Caixas(aColCaixas.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(aCaixa.getCodigo);
     LVItem.Caption := datetostr(aCaixa.getData);
     LVItem.SubItems.Add(aCaixa.getHistorico);
     LVItem.Caption := floattostr(aCaixa.getEntrada);
     LVItem.Caption := floattostr(aCaixa.getSaida);
     LVItem.Caption := floattostr(aCaixa.getSaldo);
     LVItem.Caption := floattostr(aCaixa.getSaldoTot);
  end;
end;

procedure TFormConsultaCaixa.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCaixa := Caixas(pObj);
  aCtrlCaixa := CtrlCaixas(pCtrl);
end;

procedure TFormConsultaCaixa.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroCaixas.btnSalvar.Caption;
  umFormCadastroCaixas.btnSalvar.Caption := '&Excluir';
  umFormCadastroCaixas.ConhecaObj(aCaixa, aCtrlCaixa);
  umFormCadastroCaixas.LimpaEdit;
  umFormCadastroCaixas.CarregaEdit;
  umFormCadastroCaixas.ShowModal;
  umFormCadastroCaixas.btnSalvar.Caption := aux;
end;

procedure TFormConsultaCaixa.Inserir;
begin
  inherited;
  umFormCadastroCaixas.ConhecaObj(aCaixa, aCtrlCaixa);
  umFormCadastroCaixas.LimpaEdit;
  umFormCadastroCaixas.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaCaixa.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaCaixa.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaCaixa.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroCaixas := TFormCadastroCaixa(pObj);
end;

end.
