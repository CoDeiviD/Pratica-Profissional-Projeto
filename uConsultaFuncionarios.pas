unit uConsultaFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPessoas, Vcl.ComCtrls,
  Vcl.StdCtrls, uCadastroFuncionarios, uFuncionario;

type
  TFormConsultaFuncionarios = class(TFormConsultaPessoas)
  private
    { Private declarations }
    umFormCadastroFuncionarios : TFormCadastroFuncionarios;
    oFuncionario : Funcionarios;
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
  FormConsultaFuncionarios: TFormConsultaFuncionarios;

implementation

{$R *.dfm}

{ TFormConsultaFuncionarios }

procedure TFormConsultaFuncionarios.Alterar;
begin
  inherited;
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, nil);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.CarregaEdit;
  umFormCadastroFuncionarios.ShowModal;
end;

procedure TFormConsultaFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFuncionario := Funcionarios(pObj);
end;

procedure TFormConsultaFuncionarios.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroFuncionarios.btnSalvar.Caption;
  umFormCadastroFuncionarios.btnSalvar.Caption := '&Excluir';
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, nil);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.CarregaEdit;
  umFormCadastroFuncionarios.ShowModal;
  umFormCadastroFuncionarios.btnSalvar.Caption := aux;

end;

procedure TFormConsultaFuncionarios.Inserir;
begin
  inherited;
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, nil);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.ShowModal;
end;

procedure TFormConsultaFuncionarios.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaFuncionarios.Sair;
begin
  inherited;

end;

procedure TFormConsultaFuncionarios.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
