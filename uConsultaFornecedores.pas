unit uConsultaFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroFornecedores, uFornecedor,
  uCtrlForns,
  uColForns, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormConsultaFornecedores = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFormCadastroFornecedores : TFormCadastroFornecedores;
    oFornecedor : Fornecedores;
    aCtrlForns : CtrlForns;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  override;
    procedure Inserir;                    override;
    procedure Alterar;                    override;
    procedure Excluir;                    override;
    procedure Sair;                       override;
    procedure Pesquisar;                  override;
    procedure setCadastro(pCad: TObject); override;
  end;

var
  FormConsultaFornecedores: TFormConsultaFornecedores;

implementation

{$R *.dfm}

uses uDM;

{ TFormConsultaFornecedores }

procedure TFormConsultaFornecedores.Alterar;
var mMsg :string;
begin
  inherited;
  mMsg := aCtrlForns.Carregar(oFornecedor);
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlForns);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.CarregaEdit;
  umFormCadastroFornecedores.ShowModal;
end;

procedure TFormConsultaFornecedores.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Alterar;
end;

procedure TFormConsultaFornecedores.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TFormConsultaFornecedores.btnInserirClick(Sender: TObject);
begin
  inherited;
  Inserir;
end;

procedure TFormConsultaFornecedores.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFormConsultaFornecedores.btnSairClick(Sender: TObject);
begin
  inherited;
  Sair;
end;

procedure TFormConsultaFornecedores.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFornecedor := Fornecedores(pObj);
  aCtrlForns := CtrlForns(pCtrl);
  self.DBGrid1.DataSource := aCtrlForns.getDS;
  aCtrlForns.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaFornecedores.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlForns.Carregar(oFornecedor);
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlForns);
  mAux := umFormCadastroFornecedores.btnSalvar.Caption;
  umFormCadastroFornecedores.btnSalvar.Caption := '&Excluir';
  umFormCadastroFornecedores.LimpaEdit;

  umFormCadastroFornecedores.CarregaEdit;
  umFormCadastroFornecedores.BloqueiaEdit;
  umFormCadastroFornecedores.ShowModal;
  umFormCadastroFornecedores.DesbloqueiaEdit;
  umFormCadastroFornecedores.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroFornecedores := TFormCadastroFornecedores.Create(nil);
end;

procedure TFormConsultaFornecedores.Inserir;
begin
  inherited;
  oFornecedor.setCodigo(0);
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlForns);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaFornecedores.Pesquisar;
begin
  inherited;
  aCtrlForns.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaFornecedores.Sair;
begin
  inherited;

end;

procedure TFormConsultaFornecedores.setCadastro(pCad: TObject);
begin
  inherited;

end;

end.
