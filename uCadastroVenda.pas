unit uCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls;

type
  TFormCadastroPai1 = class(TFormCadastroPai)
    lbCliente: TLabel;
    edtCliente: TEdit;
    Button1: TButton;
    cbxData: TComboBox;
    lbDataV: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPai1: TFormCadastroPai1;

implementation

{$R *.dfm}

end.
