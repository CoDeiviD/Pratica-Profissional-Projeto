unit uConsultaFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroFuncionarios, uFuncionario, uCtrlFuncs, uColFuncs, uConsultaPessoas,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormConsultaFuncionarios = class(TFormConsultaPessoas)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroFuncionarios : TFormCadastroFuncionarios;
    oFuncionario : Funcionarios;
    aCtrlFuncs : CtrlFuncs;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  virtual;
    procedure Inserir;                    virtual;
    procedure Alterar;                    virtual;
    procedure Excluir;                    virtual;
    procedure Sair;                       virtual;
    procedure Pesquisar;                  virtual;
    procedure setCadastro(pObj: TObject); virtual;
  end;

var
  FormConsultaFuncionarios: TFormConsultaFuncionarios;

implementation

{$R *.dfm}

{ TFormConsultaFuncionarios }

procedure TFormConsultaFuncionarios.Alterar;
begin
  inherited;
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncs);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.CarregaEdit;
  umFormCadastroFuncionarios.ShowModal;
end;

procedure TFormConsultaFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFuncionario := Funcionarios(pObj);
  aCtrlFuncs := CtrlFuncs(pCtrl);
  self.DBGrid1.DataSource := aCtrlFuncs.getDS;
  aCtrlFuncs.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaFuncionarios.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlFuncs.Carregar(oFuncionario);
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncs);
  mAux := umFormCadastroFuncionarios.btnSalvar.Caption;
  umFormCadastroFuncionarios.btnSalvar.Caption := '&Excluir';
  umFormCadastroFuncionarios.LimpaEdit;

  umFormCadastroFuncionarios.CarregaEdit;
  umFormCadastroFuncionarios.BloqueiaEdit;
  umFormCadastroFuncionarios.ShowModal;
  umFormCadastroFuncionarios.DesbloqueiaEdit;
  umFormCadastroFuncionarios.btnSalvar.Caption := mAux;
  self.Pesquisar;

end;

procedure TFormConsultaFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroFuncionarios := TFormCadastroFuncionarios.Create(nil);
end;

procedure TFormConsultaFuncionarios.Inserir;
begin
  inherited;
  oFuncionario.setCodigo(0);
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncs);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaFuncionarios.Pesquisar;
begin
  inherited;
  aCtrlFuncs.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaFuncionarios.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaFuncionarios.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroFuncionarios := TFormCadastroFuncionarios(pObj);
end;

end.
