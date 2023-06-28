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
  edtPais.Enabled := false;
  edtSigla.Enabled := false;
  edtDDI.Enabled := false;
  edtMoeda.Enabled := false;
end;

procedure TFormCadastroPaises.CarregaEdit;
begin
  inherited;
  edtCodigo.Text := inttostr(oPais.getCodigo);
  edtPais.Text := oPais.getPais;
  edtSigla.Text := oPais.getSigla;
  edtDDI.Text := oPais.getDDI;
  edtMoeda.Text := oPais.getMoeda;
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
  edtPais.Enabled := true;
  edtSigla.Enabled := true;
  edtDDI.Enabled := true;
  edtMoeda.Enabled := true;
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
var msg : string;
begin
  inherited;
  if length(self.edtPais.Text) = 0 then
     self.edtPais.Color := clYellow;
  if (self.edtSigla.Text) = '' then
     self.edtSigla.Color := clYellow;
  if (self.edtDDI.Text) = '' then
     self.edtDDI.Color := clYellow;
  if (self.edtMoeda.Text) = '' then
     self.edtMoeda.Color := clYellow;
  if ehObrigatorio(self.edtPais.Text, '*') and (length(self.edtPais.Text)= 0) then
     begin
        showmessage(' Campo Pais é obrigatorio');
        self.edtPais.SetFocus;
     end
   else if ehObrigatorio(self.edtPais.Text, '*') and (self.edtSigla.Text = '') then
     begin
        showmessage(' Campo Sigla é obrigatorio');
        self.edtPais.SetFocus;
     end
     else
     begin
        if self.btnSalvar.Caption = '&Salvar' then
        begin
           oPais.setCodigo(strtoint(self.edtCodigo.Text));
           oPais.setPais(self.edtPais.Text);
           oPais.setSigla(self.edtSigla.Text);
           oPais.setDDI(self.edtDDI.Text);
           oPais.setMoeda(self.edtMoeda.Text);
           msg := aCtrlPais.Salvar(oPais.clone);
           if msg = '' then
              showmessage('Pais Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlPais.Excluir(oPais.clone);
           if msg = '' then
              showmessage('Pais Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
        inherited;
     end;
end;

procedure TFormCadastroPaises.setConsulta(pObj: TObject);
begin
  inherited;

end;

end.
