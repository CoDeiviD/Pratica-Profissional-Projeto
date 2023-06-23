unit uConsultaContaPgo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroContaPgo, uContasPgr, uCtrlContasPgr, uColContasPgr;

type
  TFormConsultaContaPgo = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroContaPgo : TFormCadastroContaPgo;
    aContaPgo : ContasPgr;
    aCtrlContaPgo: CtrlContasPgr;
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
  FormConsultaContaPgo: TFormConsultaContaPgo;

implementation

{$R *.dfm}

procedure TFormConsultaContaPgo.Alterar;
begin
  inherited;

end;

procedure TFormConsultaContaPgo.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaContaPgo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaContaPgo.btnInserirClick(Sender: TObject);
begin
  inherited;
  self.Inserir;
end;

procedure TFormConsultaContaPgo.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFormConsultaContaPgo.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaContaPgo.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    aContaPgo  : ContasPgr;
    aColContaPgo : ColContasPgr;
begin
  inherited;
  aColContaPgo := ColContasPgr(aCtrlContaPgo.CarregarColecao);
  self.ListView1.Clear;
  tam := aColContaPgo.getTam;
  for k  := 1 to tam do
  begin
     aContaPgo := ContasPgr(aColContaPgo.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(aContaPgo.getCodigo);
     LVItem.Caption := floattostr(aContaPgo.getValor);
     LVItem.Caption := datetostr(aContaPgo.getDtVencimento);
     LVItem.Caption := datetostr(aContaPgo.getDtPagamento);
     LVItem.Caption := floattostr(aContaPgo.getVPago);
  end;
end;

procedure TFormConsultaContaPgo.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aContaPgo := ContasPgr(pObj);
  aCtrlContaPgo := CtrlContasPgr(pCtrl);
end;

procedure TFormConsultaContaPgo.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroContaPgo.btnSalvar.Caption;
  umFormCadastroContaPgo.btnSalvar.Caption := '&Excluir';
  umFormCadastroContaPgo.ConhecaObj(aContaPgo, aCtrlContaPgo);
  umFormCadastroContaPgo.LimpaEdit;
  umFormCadastroContaPgo.CarregaEdit;
  umFormCadastroContaPgo.ShowModal;
  umFormCadastroContaPgo.btnSalvar.Caption := aux;
end;

procedure TFormConsultaContaPgo.Inserir;
begin
  inherited;
  umFormCadastroContaPgo.ConhecaObj(aContaPgo, aCtrlContaPgo);
  umFormCadastroContaPgo.LimpaEdit;
  umFormCadastroContaPgo.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaContaPgo.Pesquisar;
begin
  inherited;
  aCtrlContaPgo.Pesquisar(self.edtChave.Text, aContaPgo);
end;

procedure TFormConsultaContaPgo.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaContaPgo.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroContaPgo := TFormCadastroContaPgo(pObj);
end;

end.
