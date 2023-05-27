unit uConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPessoas, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroClientes, uCliente, uCtrlClientes;

type
  TFormConsultaClientes = class(TFormConsultaPessoas)
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
end;

procedure TFormConsultaClientes.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaClientes.Sair;
begin
  inherited;

end;

procedure TFormConsultaClientes.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
