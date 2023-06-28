unit uConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroProduto, uProdutos, uCtrlProdutos, uColProdutos, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormConsultaProduto = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
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

procedure TFormConsultaProduto.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oProd := Produtos(pObj);
  aCtrlProd := CtrlProdutos(pCtrl);
  self.DBGrid1.DataSource := aCtrlProd.getDS;
  aCtrlProd.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaProduto.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlProd.Carregar(oProd);
  umFormCadastroProdutos.ConhecaObj(oProd, aCtrlProd);
  mAux := umFormCadastroProdutos.btnSalvar.Caption;
  umFormCadastroProdutos.btnSalvar.Caption := '&Excluir';
  umFormCadastroProdutos.LimpaEdit;

  umFormCadastroProdutos.CarregaEdit;
  umFormCadastroProdutos.BloqueiaEdit;
  umFormCadastroProdutos.ShowModal;
  umFormCadastroProdutos.DesbloqueiaEdit;
  umFormCadastroProdutos.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaProduto.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroProdutos := TFormCadastroProduto.Create(nil);
end;

procedure TFormConsultaProduto.Inserir;
begin
  inherited;
  oProd.setCodigo(0);
  umFormCadastroProdutos.ConhecaObj(oProd, aCtrlProd);
  umFormCadastroProdutos.LimpaEdit;
  umFormCadastroProdutos.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaProduto.Pesquisar;
begin
  inherited;
  aCtrlProd.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaProduto.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaProduto.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroProdutos := TFormCadastroProduto(pObj);
end;

end.
