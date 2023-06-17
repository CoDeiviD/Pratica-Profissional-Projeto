unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uProdutos;

type
  TFormCadastroProduto = class(TFormCadastroPai)
    lbNomeProd: TLabel;
    lbSabor: TLabel;
    lbPreco: TLabel;
    edtNomeProd: TEdit;
    edtSabor: TEdit;
    edtPreco: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    oProd : Produtos;
  public
    { Public declarations }
  end;

var
  FormCadastroProduto: TFormCadastroProduto;

implementation

{$R *.dfm}

procedure TFormCadastroProduto.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastroProduto.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if length(self.edtNomeProd.Text) = 0 then
  begin
     showmessage('Campo Cidade é Obrigatório');
     self.edtNomeProd.Color := clYellow;
     self.edtNomeProd.SetFocus;
  end
  else
  begin
     oProd.setCodigo(strtoint(self.edtCodigo.Text));
     oProd.setSabor(self.edtSabor.Text);
     oProd.setPreco(self.edtPreco.MaxLength);
  end;
end;

end.
