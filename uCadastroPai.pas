unit uCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormCadastroPai = class(TForm)
    edtCodigo: TEdit;
    lbCodigo: TLabel;
    btnSalvar: TButton;
    btnSair: TButton;
    lbDtCad: TLabel;
    lbDtUltAlt: TLabel;
    edtDtCad: TEdit;
    edtDtUltAlt: TEdit;
    lbObrigadtorio: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ConhecaObj(pObj: TObject; pCtrl: TObject); virtual;
     procedure LimpaEdit;                                 virtual;
     procedure CarregaEdit;                               virtual;
     procedure BloqueiaEdit;                              virtual;
     procedure DesbloqueiaEdit;                           virtual;
     procedure Salvar;                                    virtual;
     procedure Sair;                                      virtual;
     procedure setConsulta(pObj: TObject);                virtual;
  end;

var
  FormCadastroPai: TFormCadastroPai;

implementation

{$R *.dfm}

{ TFormCadastroPai }

procedure TFormCadastroPai.BloqueiaEdit;
begin

end;

procedure TFormCadastroPai.btnSairClick(Sender: TObject);
begin
   Sair;
end;

procedure TFormCadastroPai.btnSalvarClick(Sender: TObject);
begin
   Salvar;
end;

procedure TFormCadastroPai.CarregaEdit;
begin

end;

procedure TFormCadastroPai.ConhecaObj(pObj, pCtrl: TObject);
begin

end;

procedure TFormCadastroPai.DesbloqueiaEdit;
begin

end;

procedure TFormCadastroPai.LimpaEdit;
begin

end;

procedure TFormCadastroPai.Sair;
begin
   Close;
end;

procedure TFormCadastroPai.Salvar;
begin
   Sair;
end;

procedure TFormCadastroPai.setConsulta(pObj: TObject);
begin

end;

end.
