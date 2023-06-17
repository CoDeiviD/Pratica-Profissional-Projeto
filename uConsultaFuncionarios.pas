unit uConsultaFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroFuncionarios, uFuncionario, uCtrlFuncs, uColFuncs, uConsultaPessoas;

type
  TFormConsultaFuncionarios = class(TFormConsultaPessoas)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
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
    procedure CarregaLV;                  virtual;
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

procedure TFormConsultaFuncionarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaFuncionarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaFuncionarios.btnInserirClick(Sender: TObject);
begin
   self.Inserir;
end;

procedure TFormConsultaFuncionarios.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaFuncionarios.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    aFunc  : Funcionarios;
    aColFuncs : ColFuncionarios;
begin
  inherited;
  aColFuncs := ColFuncionarios(aCtrlFuncs.CarregarColecao);
  self.ListView1.Clear;
  tam := aColFuncs.getTam;
  for k  := 1 to tam do
  begin
     aFunc := Funcionarios(aColFuncs.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(aFunc.getCodigo);
     LVItem.SubItems.Add(aFunc.getNome);
     LVItem.Caption := datetostr(aFunc.getDtNasc);
     LVItem.SubItems.Add(aFunc.getCPF_CNPJ);
     LVItem.SubItems.Add(aFunc.getEndereco);
     LVItem.SubItems.Add(aFunc.getEmail);
     LVItem.SubItems.Add(aFunc.getTelefone);
     LVItem.Caption := floattostr(aFunc.getSalario);
     LVItem.Caption := timetostr(aFunc.getCargaH);
  end;
end;

procedure TFormConsultaFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFuncionario := Funcionarios(pObj);
  aCtrlFuncs := CtrlFuncs(pCtrl);
end;

procedure TFormConsultaFuncionarios.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroFuncionarios.btnSalvar.Caption;
  umFormCadastroFuncionarios.btnSalvar.Caption := '&Excluir';
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncs);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.CarregaEdit;
  umFormCadastroFuncionarios.ShowModal;
  umFormCadastroFuncionarios.btnSalvar.Caption := aux;

end;

procedure TFormConsultaFuncionarios.Inserir;
begin
  inherited;
  umFormCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncs);
  umFormCadastroFuncionarios.LimpaEdit;
  umFormCadastroFuncionarios.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaFuncionarios.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaFuncionarios.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaFuncionarios.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroFuncionarios := TFormCadastroFuncionarios(pObj);
end;

end.
