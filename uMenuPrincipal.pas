unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  uInter,
  uPaises, uEstados, uCidades, uCliente, uFornecedor, uFuncionario,
  uCtrlPaises, uCtrlEstados, uCtrlCidades,
  uCtrlClientes, uCtrlForns, uCtrlFuncs;

type
  TFormSorveteria = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Endereo1: TMenuItem;
    Pases1: TMenuItem;
    Estados1: TMenuItem;
    Cidades1: TMenuItem;
    Visualizao1: TMenuItem;
    Sair1: TMenuItem;
    Atribui1: TMenuItem;
    Sair2: TMenuItem;
    Usurio1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Funcionrios1: TMenuItem;
    Local1: TMenuItem;
    Clientes2: TMenuItem;
    Fornecedores2: TMenuItem;
    Funcionarios1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Pases1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
  private
    { Private declarations }
    aInter : Interfaces;
    oPais  : Paises;
    oEstado: Estados;
    aCidade: Cidades;
    oCliente: Clientes;
    oForn: Fornecedores;
    oFunc: Funcionarios;

    aCtrlPais: CtrlPaises;
    aCtrlEstado: CtrlEstados;
    aCtrlCidade: CtrlCidades;
    aCtrlCliente: CtrlClientes;
    aCtrlForn: CtrlForns;
    aCtrlFunc: CtrlFuncs;
  public
    { Public declarations }
  end;

var
  FormSorveteria: TFormSorveteria;

implementation

{$R *.dfm}

procedure TFormSorveteria.Cidades1Click(Sender: TObject);
begin
   aInter.PDCidades(aCidade, aCtrlCidade);
end;

procedure TFormSorveteria.Clientes1Click(Sender: TObject);
begin
   aInter.PDClientes(oCliente, aCtrlCliente);
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

   aCtrlPais := CtrlPaises.CrieObj;
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
   aInter.PDPaises(oPais, aCtrlPais);
end;

procedure TFormSorveteria.Sair2Click(Sender: TObject);
begin
   Close;
end;

end.
