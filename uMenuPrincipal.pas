unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  uInter,
  uPaises, uEstados, uCidades;

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
    procedure FormCreate(Sender: TObject);
    procedure Pases1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
  private
    { Private declarations }
    aInter : Interfaces;
    oPais  : Paises;
    oEstado: Estados;
    aCidade: Cidades;
  public
    { Public declarations }
  end;

var
  FormSorveteria: TFormSorveteria;

implementation

{$R *.dfm}

procedure TFormSorveteria.Cidades1Click(Sender: TObject);
begin
   aInter.PDCidades(nil, nil);
end;

procedure TFormSorveteria.Estados1Click(Sender: TObject);
begin
   aInter.PDEstados(nil, nil);
end;

procedure TFormSorveteria.FormCreate(Sender: TObject);
begin
   aInter  := Interfaces.CrieObj;
   oPais   := Paises.CrieObj;
   oEstado := Estados.CrieObj;
   aCidade := Cidades.CrieObj;
end;

procedure TFormSorveteria.Pases1Click(Sender: TObject);
begin
   aInter.PDPaises(oPais, nil);
end;

procedure TFormSorveteria.Sair2Click(Sender: TObject);
begin
   Close;
end;

end.
