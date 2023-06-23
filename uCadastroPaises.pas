unit uCadastroPaises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls, uPai,
  uPaises,
  uCtrlPaises;

type
  TFormCadastroPaises = class(TFormCadastroPai)
    edtPais: TEdit;
    edtSigla: TEdit;
    edtDDI: TEdit;
    lbPais: TLabel;
    lbSigla: TLabel;
    lbDDI: TLabel;
    edtMoeda: TEdit;
    lbMoeda: TLabel;
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
     oPais : Paises;
     aCtrlPais : CtrlPaises;
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
  self.edtPais.Enabled := false;
  self.edtSigla.Enabled := false;
  self.edtDDI.Enabled := false;
  self.edtMoeda.Enabled := false;
end;

procedure TFormCadastroPaises.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtPais.Text <> '' then
     self.edtPais.Color := clWindow;
end;

procedure TFormCadastroPaises.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(oPais.getCodigo);
  self.edtPais.Text := oPais.getPais;
  self.edtSigla.Text := oPais.getSigla;
  self.edtDDI.Text := oPais.getDDI;
  self.edtMoeda.Text := oPais.getMoeda;
end;

procedure TFormCadastroPaises.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oPais := Paises(pObj);
  aCtrlPais := CtrlPaises(pCtrl);
end;

procedure TFormCadastroPaises.DesbloqueiaEdit;
begin
  inherited;
  self.edtPais.Enabled := true;
  self.edtSigla.Enabled := true;
  self.edtDDI.Enabled := true;
  self.edtMoeda.Enabled := true;
end;

procedure TFormCadastroPaises.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtPais.Clear;
  edtSigla.Clear;
  edtDDI.Clear;
  edtMoeda.Clear;
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
  else if (self.edtMoeda.Text) = '' then
  begin
     showmessage('Campo Moeda é Obrigatório');
     self.edtMoeda.Color := clYellow;
     self.edtMoeda.SetFocus;
  end
  else
  begin
     oPais.setCodigo(strtoint(self.edtCodigo.Text));
     oPais.setPais(self.edtPais.Text);
     oPais.setSigla(self.edtSigla.Text);
     oPais.setDDI(self.edtDDI.Text);
     oPais.setMoeda(self.edtMoeda.Text);
     aCtrlPais.Salvar(oPais.clone);
     inherited;
  end;
end;

procedure TFormCadastroPaises.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
