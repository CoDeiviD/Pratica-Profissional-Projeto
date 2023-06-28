program Projeto_Ligeirinho;



uses
  Vcl.Forms,
  uCadastroCaixa in 'uCadastroCaixa.pas' {FormCadastroCaixa},
  uCadastroCidades in 'uCadastroCidades.pas' {FormCadastroCidades},
  uCadastroClientes in 'uCadastroClientes.pas' {FormCadastroClientes},
  uCadastroContaPgo in 'uCadastroContaPgo.pas' {FormCadastroContaPgo},
  uCadastroContaRcb in 'uCadastroContaRcb.pas' {FormCadastroContaRcb},
  uCadastroEstados in 'uCadastroEstados.pas' {FormCadastroEstados},
  uCadastroFuncionarios in 'uCadastroFuncionarios.pas' {FormCadastroFuncionarios},
  uCadastroPai in 'uCadastroPai.pas' {FormCadastroPai},
  uCadastroPaises in 'uCadastroPaises.pas' {FormCadastroPaises},
  uCadastroPessoas in 'uCadastroPessoas.pas' {FormCadastroPessoas},
  uCadastroProduto in 'uCadastroProduto.pas' {FormCadastroProduto},
  uCadPessoas in 'uCadPessoas.pas' {FormCadPessoas},
  uCaixas in 'uCaixas.pas',
  uCidades in 'uCidades.pas',
  uCliente in 'uCliente.pas',
  uColCaixas in 'uColCaixas.pas',
  uColCidades in 'uColCidades.pas',
  uColClientes in 'uColClientes.pas',
  uColContasPgr in 'uColContasPgr.pas',
  uColContasRcb in 'uColContasRcb.pas',
  uColecoes in 'uColecoes.pas',
  uColEstados in 'uColEstados.pas',
  uColFuncs in 'uColFuncs.pas',
  uColPaises in 'uColPaises.pas',
  uColProdutos in 'uColProdutos.pas',
  uConsultaCaixa in 'uConsultaCaixa.pas' {FormConsultaCaixa},
  uConsultaCidades in 'uConsultaCidades.pas' {FormConsultaCidades},
  uConsultaClientes in 'uConsultaClientes.pas' {FormConsultaClientes},
  uConsultaContaPgo in 'uConsultaContaPgo.pas' {FormConsultaContaPgo},
  uConsultaContaRcb in 'uConsultaContaRcb.pas' {FormConsultaContaRcb},
  uConsultaEstados in 'uConsultaEstados.pas' {FormConsultaEstados},
  uConsultaFuncionarios in 'uConsultaFuncionarios.pas' {FormConsultaFuncionarios},
  uConsultaPai in 'uConsultaPai.pas' {FormConsultaPai},
  uConsultaPaises in 'uConsultaPaises.pas' {FormConsultaPaises},
  uConsultaPessoas in 'uConsultaPessoas.pas' {FormConsultaPessoas},
  uConsultaProduto in 'uConsultaProduto.pas' {FormConsultaProduto},
  uContasPgr in 'uContasPgr.pas',
  uContasRcb in 'uContasRcb.pas',
  uController in 'uController.pas',
  uCtrlCaixas in 'uCtrlCaixas.pas',
  uCtrlCidades in 'uCtrlCidades.pas',
  uCtrlClientes in 'uCtrlClientes.pas',
  uCtrlContasPgr in 'uCtrlContasPgr.pas',
  uCtrlContasRcb in 'uCtrlContasRcb.pas',
  uCtrlEstados in 'uCtrlEstados.pas',
  uCtrlForns in 'uCtrlForns.pas',
  uCtrlFuncs in 'uCtrlFuncs.pas',
  uCtrlPaises in 'uCtrlPaises.pas',
  uCtrlProdutos in 'uCtrlProdutos.pas',
  uDao in 'uDao.pas',
  uDAOCaixas in 'uDAOCaixas.pas',
  uDAOCidades in 'uDAOCidades.pas',
  uDAOClientes in 'uDAOClientes.pas',
  uDAOContasPgr in 'uDAOContasPgr.pas',
  uDAOContasRcb in 'uDAOContasRcb.pas',
  uDAOEstados in 'uDAOEstados.pas',
  uDAOForns in 'uDAOForns.pas',
  uDAOFuncs in 'uDAOFuncs.pas',
  uDAOPaises in 'uDAOPaises.pas',
  uDAOProdutos in 'uDAOProdutos.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uEstados in 'uEstados.pas',
  uFuncionario in 'uFuncionario.pas',
  uInter in 'uInter.pas',
  uMenuPrincipal in 'uMenuPrincipal.pas' {FormSorveteria},
  uPai in 'uPai.pas',
  uPaises in 'uPaises.pas',
  uPessoas in 'uPessoas.pas',
  uProdutos in 'uProdutos.pas',
  uCtrlPessoas in 'uCtrlPessoas.pas',
  uDAOPessoas in 'uDAOPessoas.pas',
  uColPessoas in 'uColPessoas.pas',
  uFornecedor in 'uFornecedor.pas',
  uConsultaFornecedores in 'uConsultaFornecedores.pas' {FormConsultaFornecedores},
  uCadastroFornecedores in 'uCadastroFornecedores.pas' {FormCadastroFornecedores},
  uColForns in 'uColForns.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSorveteria, FormSorveteria);
  Application.CreateForm(TFormConsultaPai, FormConsultaPai);
  Application.CreateForm(TFormConsultaPaises, FormConsultaPaises);
  Application.CreateForm(TFormConsultaEstados, FormConsultaEstados);
  Application.CreateForm(TFormConsultaEstados, FormConsultaEstados);
  Application.CreateForm(TFormCadastroPai, FormCadastroPai);
  Application.CreateForm(TFormCadastroPaises, FormCadastroPaises);
  Application.CreateForm(TFormCadastroEstados, FormCadastroEstados);
  Application.CreateForm(TFormCadastroCidades, FormCadastroCidades);
  Application.CreateForm(TFormCadastroPessoas, FormCadastroPessoas);
  Application.CreateForm(TFormConsultaPessoas, FormConsultaPessoas);
  Application.CreateForm(TFormCadastroPessoas, FormCadastroPessoas);
  Application.CreateForm(TFormCadastroCidades, FormCadastroCidades);
  Application.CreateForm(TFormCadastroClientes, FormCadastroClientes);
  Application.CreateForm(TFormCadastroFuncionarios, FormCadastroFuncionarios);
  Application.CreateForm(TFormConsultaClientes, FormConsultaClientes);
  Application.CreateForm(TFormConsultaFuncionarios, FormConsultaFuncionarios);
  Application.CreateForm(TFormCadastroCaixa, FormCadastroCaixa);
  Application.CreateForm(TFormCadastroContaPgo, FormCadastroContaPgo);
  Application.CreateForm(TFormCadastroContaRcb, FormCadastroContaRcb);
  Application.CreateForm(TFormConsultaContaPgo, FormConsultaContaPgo);
  Application.CreateForm(TFormConsultaContaRcb, FormConsultaContaRcb);
  Application.CreateForm(TFormConsultaCaixa, FormConsultaCaixa);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormCadastroCaixa, FormCadastroCaixa);
  Application.CreateForm(TFormCadastroCidades, FormCadastroCidades);
  Application.CreateForm(TFormCadastroClientes, FormCadastroClientes);
  Application.CreateForm(TFormCadastroContaPgo, FormCadastroContaPgo);
  Application.CreateForm(TFormCadastroContaRcb, FormCadastroContaRcb);
  Application.CreateForm(TFormCadastroEstados, FormCadastroEstados);
  Application.CreateForm(TFormCadastroFornecedores, FormCadastroFornecedores);
  Application.CreateForm(TFormCadastroFuncionarios, FormCadastroFuncionarios);
  Application.CreateForm(TFormCadastroPai, FormCadastroPai);
  Application.CreateForm(TFormCadastroPaises, FormCadastroPaises);
  Application.CreateForm(TFormCadastroPessoas, FormCadastroPessoas);
  Application.CreateForm(TFormCadastroProduto, FormCadastroProduto);
  Application.CreateForm(TFormCadPessoas, FormCadPessoas);
  Application.CreateForm(TFormConsultaCaixa, FormConsultaCaixa);
  Application.CreateForm(TFormConsultaClientes, FormConsultaClientes);
  Application.CreateForm(TFormConsultaContaPgo, FormConsultaContaPgo);
  Application.CreateForm(TFormConsultaContaRcb, FormConsultaContaRcb);
  Application.CreateForm(TFormConsultaEstados, FormConsultaEstados);
  Application.CreateForm(TFormConsultaFornecedores, FormConsultaFornecedores);
  Application.CreateForm(TFormConsultaFuncionarios, FormConsultaFuncionarios);
  Application.CreateForm(TFormConsultaPai, FormConsultaPai);
  Application.CreateForm(TFormConsultaPaises, FormConsultaPaises);
  Application.CreateForm(TFormConsultaPessoas, FormConsultaPessoas);
  Application.CreateForm(TFormConsultaProduto, FormConsultaProduto);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormSorveteria, FormSorveteria);
  Application.CreateForm(TFormConsultaFornecedores, FormConsultaFornecedores);
  Application.CreateForm(TFormCadastroFornecedores, FormCadastroFornecedores);
  Application.Run;
end.
