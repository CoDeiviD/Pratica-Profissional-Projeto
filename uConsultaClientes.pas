unit uConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPessoas, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroClientes, uCliente, uCtrlClientes, uColClientes;

type
  TFormConsultaClientes = class(TFormConsultaPessoas)
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroClientes : TFormCadastroClientes;
    oCliente : Clientes;
    aCtrlCliente: CtrlClientes;
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
  FormConsultaClientes: TFormConsultaClientes;

implementation

{$R *.dfm}

{ TFormConsultaClientes }

procedure TFormConsultaClientes.Alterar;
begin
  inherited;
  umFormCadastroClientes.ConhecaObj(oCliente, aCtrlCliente);
  umFormCadastroClientes.LimpaEdit;
  umFormCadastroClientes.CarregaEdit;
  umFormCadastroClientes.ShowModal;
end;

procedure TFormConsultaClientes.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaClientes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaClientes.btnInserirClick(Sender: TObject);
begin
   self.Inserir;
end;

procedure TFormConsultaClientes.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFormConsultaClientes.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaClientes.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    oCliente  : Clientes;
    aColClientes : ColClientes;
begin
  inherited;
  aColClientes := ColClientes(aCtrlCliente.CarregarColecao);
  self.ListView1.Clear;
  tam := aColClientes.getTam;
  for k  := 1 to tam do
  begin
     oCliente := Clientes(aColClientes.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(oCliente.getCodigo);
     LVItem.SubItems.Add(oCliente.getNome);
     LVItem.Caption := datetostr(oCliente.getDtNasc);
     LVItem.SubItems.Add(oCliente.getCPF_CNPJ);
     LVItem.SubItems.Add(oCliente.getEndereco);
     LVItem.SubItems.Add(oCliente.getEmail);
     LVItem.SubItems.Add(oCliente.getTelefone);
     LVItem.Caption := inttostr(oCliente.getQtdeGrupo);
     LVItem.Caption := booltostr(oCliente.getPagou);
  end;
end;

procedure TFormConsultaClientes.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oCliente := Clientes(pObj);
  aCtrlCliente := CtrlClientes(pCtrl);
end;

procedure TFormConsultaClientes.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroClientes.btnSalvar.Caption;
  umFormCadastroClientes.btnSalvar.Caption := '&Excluir';
  umFormCadastroClientes.ConhecaObj(oCliente, aCtrlCliente);

  umFormCadastroClientes.LimpaEdit;
  umFormCadastroClientes.CarregaEdit;
  umFormCadastroClientes.ShowModal;
  umFormCadastroClientes.btnSalvar.Caption := aux;

end;

procedure TFormConsultaClientes.Inserir;
begin
  inherited;
  umFormCadastroClientes.ConhecaObj(oCliente, aCtrlCliente);
  umFormCadastroClientes.LimpaEdit;
  umFormCadastroClientes.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaClientes.Pesquisar;
begin
  inherited;
  aCtrlCliente.Pesquisar(self.edtChave.Text, oCliente);
end;

procedure TFormConsultaClientes.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaClientes.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroClientes := TFormCadastroClientes(pObj);
end;

end.
