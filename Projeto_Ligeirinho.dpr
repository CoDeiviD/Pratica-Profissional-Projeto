program Projeto_Ligeirinho;

uses
  Vcl.Forms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {FormSorveteria},
  uConsultaPai in 'uConsultaPai.pas' {FormConsultaPai},
  uConsultaPaises in 'uConsultaPaises.pas' {FormConsultaPaises},
  uConsultaEstados in 'uConsultaEstados.pas' {FormConsultaEstados},
  uConsultaCidades in 'uConsultaCidades.pas' {FormConsultaCidades},
  uInter in 'uInter.pas',
  uCadastroPai in 'uCadastroPai.pas' {FormCadastroPai},
  uCadastroPaises in 'uCadastroPaises.pas' {FormCadastroPaises},
  uCadastroEstados in 'uCadastroEstados.pas' {FormCadastroEstados},
  uCadastroCidades in 'uCadastroCidades.pas' {FormCadastroCidades};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSorveteria, FormSorveteria);
  Application.CreateForm(TFormConsultaPai, FormConsultaPai);
  Application.CreateForm(TFormConsultaPaises, FormConsultaPaises);
  Application.CreateForm(TFormConsultaEstados, FormConsultaEstados);
  Application.CreateForm(TFormConsultaCidades, FormConsultaCidades);
  Application.CreateForm(TFormCadastroPai, FormCadastroPai);
  Application.CreateForm(TFormCadastroPaises, FormCadastroPaises);
  Application.CreateForm(TFormCadastroEstados, FormCadastroEstados);
  Application.CreateForm(TFormCadastroCidades, FormCadastroCidades);
  Application.Run;
end.
