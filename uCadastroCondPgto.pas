unit uCadastroCondPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCondPgto;

type
  TfrmCadastroCondPgto = class(TForm)
    lbPrazo: TLabel;
    lbFormaPgto: TLabel;
    lbPerc: TLabel;
    lbVTot: TLabel;
    edtPrazo: TEdit;
    edtFormaPgto: TEdit;
    edtPerc: TEdit;
    edtVTot: TEdit;
    btnSalvar: TButton;
    btnSair: TButton;
  private
    { Private declarations }
    aCondPgto : CondPgto;
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
    function ehObrigatorio(pTexto: string; pLetra: char): boolean; virtual;
  end;

var
  frmCadastroCondPgto: TfrmCadastroCondPgto;

implementation

{$R *.dfm}

{ TfrmCadastroCondPgto }

procedure TfrmCadastroCondPgto.BloqueiaEdit;
begin
  self.edtPrazo.Enabled := false;
  self.edtFormaPgto.Enabled := false;
  self.edtPerc.Enabled := false;
  self.edtVTot.Enabled := false;
end;

procedure TfrmCadastroCondPgto.CarregaEdit;
begin
  self.edtPrazo.Text := datetostr(aCondPgto.getPrazo);
  self.edtFormaPgto.Text := aCondPgto.getFormaPgto;
  self.edtPerc.Text := floattostr(aCondPgto.getPercent);
  self.edtVTot.Text := floattostr(aCondPgto.getTotValor);
end;

procedure TfrmCadastroCondPgto.ConhecaObj(pObj, pCtrl: TObject);
begin
   inherited;
  aCondPgto := CondPgto(pObj);
end;

procedure TfrmCadastroCondPgto.DesbloqueiaEdit;
begin
  self.edtPrazo.Enabled := true;
  self.edtFormaPgto.Enabled := true;
  self.edtPerc.Enabled := true;
  self.edtVTot.Enabled := true;
end;

function TfrmCadastroCondPgto.ehObrigatorio(pTexto: string;
  pLetra: char): boolean;
begin

end;

procedure TfrmCadastroCondPgto.LimpaEdit;
begin
   edtPrazo.Clear;
   edtFormaPgto.Clear;
   edtPerc.Clear;
   edtVTot.Clear;
end;

procedure TfrmCadastroCondPgto.Sair;
begin

end;

procedure TfrmCadastroCondPgto.Salvar;
begin

end;

procedure TfrmCadastroCondPgto.setConsulta(pObj: TObject);
begin

end;

end.
