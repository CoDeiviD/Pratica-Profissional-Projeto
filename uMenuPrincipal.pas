unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  uInter, uDM,
  uPaises, uEstados, uCidades,
  uCliente, uFornecedor, uFuncionario,
  uContasPgr, uContasRcb, uProdutos, uCaixas,
  uCtrlPaises, uCtrlEstados, uCtrlCidades,
  uCtrlClientes, uCtrlForns, uCtrlFuncs,
  uCtrlContasPgr, uCtrlContasRcb, uCtrlProdutos, uCtrlCaixas,
  uConsultaPaises, uConsultaEstados, uConsultaCidades,
  uConsultaClientes, uConsultaFornecedores, uConsultaFuncionarios,
  uConsultaContaPgo, uConsultaContaRcb, uConsultaProduto, uConsultaCaixa;

type
  TFormSorveteria = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Endereo1: TMenuItem;
    Pases1: TMenuItem;
    Estados1: TMenuItem;
    Cidades1: TMenuItem;
    Sair1: TMenuItem;
    Usurio1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Funcionrios1: TMenuItem;
    Banco1: TMenuItem;
    ContasPagas1: TMenuItem;
    ContasRecebidas1: TMenuItem;
    Caixa1: TMenuItem;
    Produto1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Pases1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure ContasPagas1Click(Sender: TObject);
    procedure ContasRecebidas1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
    aInter : Interfaces;
    oPais  : Paises;
    oEstado: Estados;
    aCidade: Cidades;
    oCliente: Clientes;
    oForn: Fornecedores;
    oFunc: Funcionarios;
    aContaPgr: ContasPgr;
    aContaRcb: ContasRcb;
    oProd: Produtos;
    aCaixa: Caixas;

    umDM: TDM;

    aCtrlPais: CtrlPaises;
    aCtrlEstado: CtrlEstados;
    aCtrlCidade: CtrlCidades;
    aCtrlCliente: CtrlClientes;
    aCtrlForn: CtrlForns;
    aCtrlFunc: CtrlFuncs;
    aCtrlContaPgr: CtrlContasPgr;
    aCtrlContaRcb: CtrlContasRcb;
    aCtrlProduto: CtrlProdutos;
    aCtrlCaixa: CtrlCaixas;

    oConsultaPais : TFormConsultaPaises;
  public
    { Public declarations }
  end;

var
  FormSorveteria: TFormSorveteria;

implementation

{$R *.dfm}

procedure TFormSorveteria.Caixa1Click(Sender: TObject);
begin
   aInter.PDCaixas(aCaixa, aCtrlCaixa);
end;

procedure TFormSorveteria.Cidades1Click(Sender: TObject);
begin
   aInter.PDCidades(aCidade, aCtrlCidade);
end;

procedure TFormSorveteria.Clientes1Click(Sender: TObject);
begin
   aInter.PDClientes(oCliente, aCtrlCliente);
end;

procedure TFormSorveteria.ContasPagas1Click(Sender: TObject);
begin
   aInter.PDContasPgo(aContaPgr, aCtrlContaPgr);
end;

procedure TFormSorveteria.ContasRecebidas1Click(Sender: TObject);
begin
   aInter.PDContasRcb(aContaRcb, aCtrlContaRcb);
end;

procedure TFormSorveteria.Estados1Click(Sender: TObject);
begin
   aInter.PDEstados(oEstado, aCtrlEstado);
end;

procedure TFormSorveteria.FormCreate(Sender: TObject);
begin
   aInter  := Interfaces.CrieObj;
   oPais   := Paises.CrieObj;
   oEstado := Estados.CrieObj;
   aCidade := Cidades.CrieObj;
   oCliente := Clientes.CrieObj;
   oForn := Fornecedores.Create;
   oFunc := Funcionarios.Create;
   aContaPgr:= ContasPgr.CrieObj;
   aContaRcb:= ContasRcb.CrieObj;
   oProd:= Produtos.CrieObj;
   aCaixa:= Caixas.CrieObj;

   umDM := TDM.Create(nil);

   aCtrlPais := CtrlPaises.CrieObj;
   aCtrlEstado:= CtrlEstados.CrieObj;
   aCtrlCidade:= CtrlCidades.CrieObj;
   aCtrlCliente:= CtrlClientes.CrieObj;
   aCtrlForn:= CtrlForns.CrieObj;
   aCtrlFunc:= CtrlFuncs.CrieObj;
   aCtrlContaPgr:= CtrlContasPgr.CrieObj;
   aCtrlContaRcb:= CtrlContasRcb.CrieObj;
   aCtrlProduto:= CtrlProdutos.CrieObj;
   aCtrlCaixa:= CtrlCaixas.CrieObj;

   aCtrlPais.setDM(umDM);
   aCtrlEstado.setDM(umDM);
   aCtrlCidade.setDM(umDM);
   aCtrlCliente.setDM(umDM);
   aCtrlForn.setDM(umDM);
   aCtrlFunc.setDM(umDM);
   aCtrlContaPgr.setDM(umDM);
   aCtrlContaRcb.setDM(umDM);
   aCtrlProduto.setDM(umDM);
   aCtrlCaixa.setDM(umDM);

   oConsultaPais := TFormConsultaPaises.Create(nil);
end;

procedure TFormSorveteria.Fornecedores1Click(Sender: TObject);
begin
   aInter.PDFornecedores(oForn, aCtrlForn);
end;

procedure TFormSorveteria.Funcionrios1Click(Sender: TObject);
begin
   aInter.PDFuncionarios(oFunc, aCtrlFunc);
end;

procedure TFormSorveteria.Pases1Click(Sender: TObject);
begin
   //aInter.PDPaises(oPais, aCtrlPais);
   oConsultaPais.ShowModal;
end;

procedure TFormSorveteria.Produto1Click(Sender: TObject);
begin
   aInter.PDProdutos(oProd, aCtrlProduto);
end;

procedure TFormSorveteria.Sair1Click(Sender: TObject);
begin
   Close;
end;

end.
