unit uConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPessoas, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroClientes, uCliente, uCtrlClientes, uColClientes, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormConsultaClientes = class(TFormConsultaPessoas)
    procedure FormCreate(Sender: TObject);
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

procedure TFormConsultaClientes.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oCliente := Clientes(pObj);
  aCtrlCliente := CtrlClientes(pCtrl);
  self.DBGrid1.DataSource := aCtrlCliente.getDS;
  aCtrlCliente.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaClientes.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlCliente.Carregar(oCliente);
  umFormCadastroClientes.ConhecaObj(oCliente, aCtrlCliente);
  mAux := umFormCadastroClientes.btnSalvar.Caption;
  umFormCadastroClientes.btnSalvar.Caption := '&Excluir';
  umFormCadastroClientes.LimpaEdit;

  umFormCadastroClientes.CarregaEdit;
  umFormCadastroClientes.BloqueiaEdit;
  umFormCadastroClientes.ShowModal;
  umFormCadastroClientes.DesbloqueiaEdit;
  umFormCadastroClientes.btnSalvar.Caption := mAux;
  self.Pesquisar;

end;

procedure TFormConsultaClientes.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroClientes := TFormCadastroClientes.Create(nil);
end;

procedure TFormConsultaClientes.Inserir;
begin
  inherited;
  oCliente.setCodigo(0);
  umFormCadastroClientes.ConhecaObj(oCliente, aCtrlCliente);
  umFormCadastroClientes.LimpaEdit;
  umFormCadastroClientes.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaClientes.Pesquisar;
begin
  inherited;
  aCtrlCliente.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaClientes.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaClientes.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroClientes := TFormCadastroClientes(pObj);
end;

end.
