unit uConsultaFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPessoas, Vcl.ComCtrls,
  Vcl.StdCtrls, uCadastroFornecedores, uFornecedor;

type
  TFormConsultaFornecedores = class(TFormConsultaPessoas)
  private
    { Private declarations }
    umFormCadastroFornecedores : TFormCadastroFornecedores;
    oFornecedor : Fornecedores;
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
  FormConsultaFornecedores: TFormConsultaFornecedores;

implementation

{$R *.dfm}

{ TFormConsultaFornecedores }

procedure TFormConsultaFornecedores.Alterar;
begin
  inherited;
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, nil);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.CarregaEdit;
  umFormCadastroFornecedores.ShowModal;
end;

procedure TFormConsultaFornecedores.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFornecedor := Fornecedores(pObj);
end;

procedure TFormConsultaFornecedores.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroFornecedores.btnSalvar.Caption;
  umFormCadastroFornecedores.btnSalvar.Caption := '&Excluir';
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, nil);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.CarregaEdit;
  umFormCadastroFornecedores.ShowModal;
  umFormCadastroFornecedores.btnSalvar.Caption := aux;

end;

procedure TFormConsultaFornecedores.Inserir;
begin
  inherited;
  umFormCadastroFornecedores.ConhecaObj(oFornecedor, nil);
  umFormCadastroFornecedores.LimpaEdit;
  umFormCadastroFornecedores.ShowModal;
end;

procedure TFormConsultaFornecedores.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaFornecedores.Sair;
begin
  inherited;

end;

procedure TFormConsultaFornecedores.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
