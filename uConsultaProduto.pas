unit uConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroProduto, uProdutos, uCtrlProdutos, uColProdutos;

type
  TFormConsultaProduto = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroProdutos : TFormCadastroProduto;
    oProd : Produtos;
    aCtrlProd: CtrlProdutos;
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
  FormConsultaProduto: TFormConsultaProduto;

implementation

{$R *.dfm}

{ TFormConsultaProduto }

procedure TFormConsultaProduto.Alterar;
begin
  inherited;
  umFormCadastroProdutos.ConhecaObj(oProd, aCtrlProd);
  umFormCadastroProdutos.LimpaEdit;
  umFormCadastroProdutos.CarregaEdit;
  umFormCadastroProdutos.ShowModal;
end;

procedure TFormConsultaProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaProduto.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaProduto.btnInserirClick(Sender: TObject);
begin
   self.Inserir;
end;

procedure TFormConsultaProduto.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFormConsultaProduto.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaProduto.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    aCidade  : Produtos;
    aColProdutos : ColProdutos;
begin
  inherited;
  aColProdutos := ColProdutos(aCtrlProd.CarregarColecao);
  self.ListView1.Clear;
  tam := aColProdutos.getTam;
  for k  := 1 to tam do
  begin
     oProd := Produtos(aColProdutos.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(oProd.getCodigo);
     LVItem.SubItems.Add(oProd.getTpProduto);
     LVItem.SubItems.Add(oProd.getSabor);
     LVItem.Caption := floattostr(oProd.getPreco);
  end;
end;

procedure TFormConsultaProduto.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oProd := Produtos(pObj);
  aCtrlProd := CtrlProdutos(pCtrl);
end;

procedure TFormConsultaProduto.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroProdutos.btnSalvar.Caption;
  umFormCadastroProdutos.btnSalvar.Caption := '&Excluir';
  umFormCadastroProdutos.ConhecaObj(oProd, aCtrlProd);

  umFormCadastroProdutos.LimpaEdit;
  umFormCadastroProdutos.CarregaEdit;
  umFormCadastroProdutos.ShowModal;
  umFormCadastroProdutos.btnSalvar.Caption := aux;
end;

procedure TFormConsultaProduto.Inserir;
begin
  inherited;
  umFormCadastroProdutos.ConhecaObj(oProd, aCtrlProd);
  umFormCadastroProdutos.LimpaEdit;
  umFormCadastroProdutos.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaProduto.Pesquisar;
begin
  inherited;
  aCtrlProd.Pesquisar(self.edtChave.Text, oProd);
end;

procedure TFormConsultaProduto.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaProduto.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroProdutos := TFormCadastroProduto(pObj);
end;

end.
