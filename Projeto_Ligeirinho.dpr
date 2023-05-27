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
  uPai in 'uPai.pas',
  uPaises in 'uPaises.pas',
  uPessoas in 'uPessoas.pas',
  uEstados in 'uEstados.pas',
  uFornecedor in 'uFornecedor.pas',
  uFuncionario in 'uFuncionario.pas',
  uCidades in 'uCidades.pas',
  uCliente in 'uCliente.pas',
  uConsultaPessoas in 'uConsultaPessoas.pas' {FormConsultaPessoas},
  uCadastroPessoas in 'uCadastroPessoas.pas' {FormCadastroPessoas},
  uCadastroCidades in 'uCadastroCidades.pas' {FormCadastroCidades},
  uCadastroClientes in 'uCadastroClientes.pas' {FormCadastroClientes},
  uCadastroFornecedores in 'uCadastroFornecedores.pas' {FormCadastroFornecedores},
  uCadastroFuncionarios in 'uCadastroFuncionarios.pas' {FormCadastroFuncionarios},
  uConsultaClientes in 'uConsultaClientes.pas' {FormConsultaClientes},
  uConsultaFornecedores in 'uConsultaFornecedores.pas' {FormConsultaFornecedores},
  uConsultaFuncionarios in 'uConsultaFuncionarios.pas' {FormConsultaFuncionarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSorveteria, FormSorveteria);
  Application.CreateForm(TFormConsultaPai, FormConsultaPai);
  Application.CreateForm(TFormConsultaPaises, FormConsultaPaises);
  Application.CreateForm(TFormConsultaEstados, FormConsultaEstados);
  Application.CreateForm(TFormConsultaCidades, FormConsultaEstados);
  Application.CreateForm(TFormCadastroPai, FormCadastroPai);
  Application.CreateForm(TFormCadastroPaises, FormCadastroPaises);
  Application.CreateForm(TFormCadastroEstados, FormCadastroEstados);
  Application.CreateForm(TFormCadastroCidades, FormCadastroCidades);
  Application.CreateForm(TFormCadastroPessoas, FormCadastroPessoas);
  Application.CreateForm(TFormConsultaPessoas, FormConsultaPessoas);
  Application.CreateForm(TFormCadastroPessoas, FormCadastroPessoas);
  Application.CreateForm(TFormCadastroCidades, FormCadastroCidades);
  Application.CreateForm(TFormCadastroClientes, FormCadastroClientes);
  Application.CreateForm(TFormCadastroFornecedores, FormCadastroFornecedores);
  Application.CreateForm(TFormCadastroFuncionarios, FormCadastroFuncionarios);
  Application.CreateForm(TFormConsultaClientes, FormConsultaClientes);
  Application.CreateForm(TFormConsultaFornecedores, FormConsultaFornecedores);
  Application.CreateForm(TFormConsultaFuncionarios, FormConsultaFuncionarios);
  Application.Run;
end.
