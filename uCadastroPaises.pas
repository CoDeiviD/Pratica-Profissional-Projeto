unit uCadastroPaises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uPaises;

type
  TFormCadastroPaises = class(TFormCadastroPai)
    edtPais: TEdit;
    edtSigla: TEdit;
    edtDDI: TEdit;
    lbPais: TLabel;
    lbSigla: TLabel;
    lbDDI: TLabel;
    procedure edtPaisExit(Sender: TObject);
  private
    { Private declarations }
     oPais : Paises;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure LimpaEdit;                                 override;
    procedure CarregaEdit;                               override;
    procedure BloqueiaEdit;                              override;
    procedure DesbloqueiaEdit;                           override;
    procedure Salvar;                                    override;
    procedure Sair;                                      override;
    procedure setConsulta(pObj: TObject);                override;
  end;

var
  FormCadastroPaises: TFormCadastroPaises;

implementation

{$R *.dfm}

{ TFormCadastroPaises }

procedure TFormCadastroPaises.BloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroPaises.CarregaEdit;
begin
  inherited;

end;

procedure TFormCadastroPaises.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;

end;

procedure TFormCadastroPaises.DesbloqueiaEdit;
begin
  inherited;

end;

procedure TFormCadastroPaises.edtPaisExit(Sender: TObject);
begin
  inherited;
  if self.edtPais.Text <> '' then
     self.edtPais.Color := clWindow;
end;

procedure TFormCadastroPaises.LimpaEdit;
begin
  inherited;

end;

procedure TFormCadastroPaises.Sair;
begin
  inherited;

end;

procedure TFormCadastroPaises.Salvar;
begin
  inherited;
  if length(self.edtPais.Text) = 0 then
  begin
     showmessage('Campo Pais é Obrigatório');
     self.edtPais.Color := clYellow;
     self.edtPais.SetFocus;
  end
  else if (self.edtSigla.Text) = '' then
  begin
     showmessage('Campo Sigla é Obrigatório');
     self.edtSigla.Color := clYellow;
     self.edtSigla.SetFocus;
  end
  else if (self.edtDDI.Text) = '' then
  begin
     showmessage('Campo DDI é Obrigatório');
     self.edtDDI.Color := clYellow;
     self.edtDDI.SetFocus;
  end
  else
  begin
     oPais.setCodigo(strtoint(self.edtCodigo.Text));
     oPais.setPais(self.edtPais.Text);
     oPais.setSigla(self.edtSigla.Text);
     oPais.setDDI(self.edtDDI.Text);
  end;
end;

procedure TFormCadastroPaises.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
