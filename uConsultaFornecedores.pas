unit uConsultaFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPessoas, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroFornecedores, uFornecedor, uCtrlForns, uColForns;

type
  TFormConsultaFornecedores = class(TFormConsultaPessoas)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroFornecedores : TFormCadastroFornecedores;
    oFornecedor : Fornecedores;
    aCtrlForns : CtrlForns;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  virtual;
    procedure Inserir;                    virtual;
    procedure Alterar;                    virtual;
    procedure Excluir;                    virtual;
    procedure Sair;                       virtual;
    procedure Pesquisar;                  virtual;
    procedure setCadastro(pObj: TObject); virtual;
    procedure CarregaLV;                  virtual;
  end;

var
  FormConsultaFornecedores: TFormConsultaFornecedores;

implementation

{$R *.dfm}

{ TFormConsultaFornecedores }

procedure TFormConsultaFornecedores.Alterar;
begin
  inherited;
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlForns);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.CarregaEdit;
  umFormCadastroFornecedores.ShowModal;
end;

procedure TFormConsultaFornecedores.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaFornecedores.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaFornecedores.btnInserirClick(Sender: TObject);
begin
   self.Inserir;
end;

procedure TFormConsultaFornecedores.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFormConsultaFornecedores.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaFornecedores.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    oForn  : Fornecedores;
    aColForns : ColFornecedores;
begin
  inherited;
  aColForns := ColFornecedores(aCtrlForns.CarregarColecao);
  self.ListView1.Clear;
  tam := aColForns.getTam;
  for k  := 1 to tam do
  begin
     oForn := Fornecedores(aColForns.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(oForn.getCodigo);
     LVItem.SubItems.Add(oForn.getNome);
     LVItem.Caption := datetostr(oForn.getDtNasc);
     LVItem.SubItems.Add(oForn.getCPF_CNPJ);
     LVItem.SubItems.Add(oForn.getEndereco);
     LVItem.SubItems.Add(oForn.getEmail);
     LVItem.SubItems.Add(oForn.getTelefone);
     LVItem.Caption := floattostr(oForn.getVCombustivel);
     LVItem.Caption := inttostr(oForn.getQtdeCarga);
  end;
end;

procedure TFormConsultaFornecedores.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFornecedor := Fornecedores(pObj);
  aCtrlForns := CtrlForns(pCtrl);
end;

procedure TFormConsultaFornecedores.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroFornecedores.btnSalvar.Caption;
  umFormCadastroFornecedores.btnSalvar.Caption := '&Excluir';
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlForns);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.CarregaEdit;
  umFormCadastroFornecedores.ShowModal;
  umFormCadastroFornecedores.btnSalvar.Caption := aux;

end;

procedure TFormConsultaFornecedores.Inserir;
begin
  inherited;
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlForns);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaFornecedores.Pesquisar;
begin
  inherited;
  aCtrlForns.Pesquisar(self.edtChave.Text, oFornecedor);
end;

procedure TFormConsultaFornecedores.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaFornecedores.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroFornecedores:= TFormCadastroFornecedores(pObj);
end;

end.
