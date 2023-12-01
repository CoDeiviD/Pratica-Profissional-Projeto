unit uInter;

interface
   uses uConsultaPaises, uConsultaEstados, uConsultaCidades,
        uCadastroPaises, uCadastroEstados, uCadastroCidades,
        uConsultaClientes, uConsultaFornecedores, uConsultaFuncionarios,
        uCadastroClientes, uCadastroFornecedores, uCadastroFuncionarios,
        uConsultaContaPgo, uConsultaContaRcb, uConsultaProduto, uConsultaCaixa,
        uCadastroContaPgo, uCadastroContaRcb, uCadastroProduto, uCadastroCaixa,
        uCadastroCompra, uConsultaCompra, uCadastroCondPgto, uConsultaCondPgto,
        uCadastroVenda, uConsultaVenda;
   type Interfaces = class
     private
     protected
        umFormConsultaPaises : TFormConsultaPaises;
        umFormConsultaEstados : TFormConsultaEstados;
        umFormConsultaCidades : TFormConsultaCidades;
        umFormCadastroPaises : TFormCadastroPaises;
        umFormCadastroEstados : TFormCadastroEstados;
        umFormCadastroCidades : TFormCadastroCidades;
        umFormConsultaClientes : TFormConsultaClientes;
        umFormConsultaFornecedores : TFormConsultaFornecedores;
        umFormConsultaFuncionarios: TFormConsultaFuncionarios;
        umFormCadastroClientes : TFormCadastroClientes;
        umFormCadastroFornecedores : TFormCadastroFornecedores;
        umFormCadastroFuncionarios : TFormCadastroFuncionarios;
        umFormConsultaContaPgo : TFormConsultaContaPgo;
        umFormConsultaContaRcb : TFormConsultaContaRcb;
        umFormConsultaProdutos: TFormConsultaProduto;
        umFormConsultaCaixas: TFormConsultaCaixa;
        umFormCadastroContaPgo : TFormCadastroContaPgo;
        umFormCadastroContaRcb : TFormCadastroContaRcb;
        umFormCadastroProdutos : TFormCadastroProduto;
        umFormCadastroCaixas : TFormCadastroCaixa;
        umFormConsultaCompra : TfrmConsultaCompra;
        umFormCadastroCompra : TfrmCadastroCompra;
        umFormConsultaCondPgto : TfrmConsultaCondPgto;
        umFormCadastroCondPgto : TfrmCadastroCondPgto;
        umFormConsultaVenda : TfrmConsultaVenda;
        umFormCadastroVenda : TfrmCadastroVenda;

     public
        constructor CrieObj;
        destructor Destrua_se;
        procedure PDPaises(pObj, pCtrl : TObject);
        procedure PDEstados(pObj, pCtrl : TObject);
        procedure PDCidades(pObj, pCtrl : TObject);
        procedure PDClientes(pObj, pCtrl : TObject);
        procedure PDFornecedores(pObj, pCtrl : TObject);
        procedure PDFuncionarios(pObj, pCtrl : TObject);
        procedure PDContasPgo(pObj, pCtrl : TObject);
        procedure PDContasRcb(pObj, pCtrl : TObject);
        procedure PDProdutos(pObj, pCtrl : TObject);
        procedure PDCaixas(pObj, pCtrl : TObject);
        procedure PDCompras(pObj, pCtrl : TObject);
        procedure PDCondPgto(pObj, pCtrl : TObject);
        procedure PDVendas(pObj, pCtrl : TObject);
   end;
implementation

{ Interfaces }

constructor Interfaces.CrieObj;
begin
   umFormConsultaPaises := TFormConsultaPaises.Create(nil);
   umFormConsultaEstados := TFormConsultaEstados.Create(nil);
   umFormConsultaCidades := TFormConsultaCidades.Create(nil);
   umFormConsultaClientes := TFormConsultaClientes.Create(nil);
   umFormConsultaFornecedores := TFormConsultaFornecedores.Create(nil);
   umFormConsultaFuncionarios := TFormConsultaFuncionarios.Create(nil);
   umFormConsultaContaPgo := TFormConsultaContaPgo.Create(nil);
   umFormConsultaContaRcb := TFormConsultaContaRcb.Create(nil);
   umFormConsultaProdutos := TFormConsultaProduto.Create(nil);
   umFormConsultaCaixas := TFormConsultaCaixa.Create(nil);
   umFormConsultaCompra := TFrmConsultaCompra.Create(nil);
   umFormConsultaCondPgto := TFrmConsultaCondPgto.Create(nil);
   umFormConsultaVenda := TFrmConsultaVenda.Create(nil);

   umFormCadastroPaises := TFormCadastroPaises.Create(nil);
   umFormCadastroEstados := TFormCadastroEstados.Create(nil);
   umFormCadastroCidades := TFormCadastroCidades.Create(nil);
   umFormCadastroClientes := TFormCadastroClientes.Create(nil);
   umFormCadastroFornecedores := TFormCadastroFornecedores.Create(nil);
   umFormCadastroFuncionarios := TFormCadastroFuncionarios.Create(nil);
   umFormCadastroContaPgo := TFormCadastroContaPgo.Create(nil);
   umFormCadastroContaRcb := TFormCadastroContaRcb.Create(nil);
   umFormCadastroProdutos := TFormCadastroProduto.Create(nil);
   umFormCadastroCaixas := TFormCadastroCaixa.Create(nil);
   umFormCadastroCompra := TFrmCadastroCompra.Create(nil);
   umFormCadastroCondPgto := TFrmCadastroCondPgto.Create(nil);
   umFormCadastroVenda := TFrmCadastroVenda.Create(nil);

   umFormConsultaPaises.setCadastro(umFormCadastroPaises);
   umFormConsultaEstados.setCadastro(umFormCadastroEstados);
   umFormConsultaCidades.setCadastro(umFormCadastroCidades);
   umFormConsultaClientes.setCadastro(umFormCadastroClientes);
   umFormConsultaFornecedores.setCadastro(umFormCadastroFornecedores);
   umFormConsultaFuncionarios.setCadastro(umFormCadastroFuncionarios);
   umFormConsultaContaPgo.setCadastro(umFormCadastroContaPgo);
   umFormConsultaContaRcb.setCadastro(umFormCadastroContaRcb);
   umFormConsultaProdutos.setCadastro(umFormCadastroProdutos);
   umFormConsultaCaixas.setCadastro(umFormCadastroCaixas);
   umFormConsultaCompra.setCadastro(umFormCadastroCompra);
   umFormConsultaCondPgto.setCadastro(umFormCadastroCondPgto);
   umFormConsultaVenda.setCadastro(umFormCadastroVenda);

   umFormCadastroCidades.setConsulta(umFormConsultaCidades);
   umFormCadastroEstados.setConsulta(umFormConsultaEstados);
   umFormCadastroPaises.setConsulta(umFormConsultaPaises);
   umFormCadastroClientes.setConsulta(umFormConsultaClientes);
   umFormCadastroFornecedores.setConsulta(umFormConsultaFornecedores);
   umFormCadastroFuncionarios.setConsulta(umFormConsultaFuncionarios);
   umFormCadastroContaPgo.setConsulta(umFormConsultaContaPgo);
   umFormCadastroContaRcb.setConsulta(umFormConsultaContaRcb);
   umFormCadastroProdutos.setConsulta(umFormConsultaProdutos);
   umFormCadastroCaixas.setConsulta(umFormConsultaCaixas);
   umFormCadastroCompra.setConsulta(umFormConsultaCompra);
   umFormCadastroCondPgto.setConsulta(umFormConsultaCondPgto);
   umFormCadastroVenda.setConsulta(umFormConsultaVenda);
end;

destructor Interfaces.Destrua_se;
begin
   umFormConsultaPaises.FreeInstance;
   umFormConsultaEstados.FreeInstance;
   umFormConsultaCidades.FreeInstance;

   umFormCadastroPaises.FreeInstance;
   umFormCadastroEstados.FreeInstance;
   umFormCadastroCidades.FreeInstance;

   umFormConsultaClientes.FreeInstance;
   umFormConsultaFornecedores.FreeInstance;
   umFormConsultaFuncionarios.FreeInstance;

   umFormCadastroClientes.FreeInstance;
   umFormCadastroFornecedores.FreeInstance;
   umFormCadastroFuncionarios.FreeInstance;

   umFormConsultaContaPgo.FreeInstance;
   umFormConsultaContaRcb.FreeInstance;
   umFormConsultaProdutos.FreeInstance;
   umFormConsultaCaixas.FreeInstance;

   umFormConsultaCompra.FreeInstance;
   umFormConsultaCondPgto.FreeInstance;
   umFormConsultaVenda.FreeInstance;

   umFormCadastroContaPgo.FreeInstance;
   umFormCadastroContaRcb.FreeInstance;
   umFormCadastroProdutos.FreeInstance;
   umFormCadastroCaixas.FreeInstance;

   umFormCadastroCompra.FreeInstance;
   umFormCadastroCondPgto.FreeInstance;
   umFormCadastroVenda.FreeInstance;
end;

procedure Interfaces.PDCaixas(pObj, pCtrl: TObject);
begin
   umFormConsultaCaixas.ConhecaObj(pObj, pCtrl);
   umFormConsultaCaixas.ShowModal;
end;

procedure Interfaces.PDCidades(pObj, pCtrl : TObject);
begin
   umFormConsultaCidades.ConhecaObj(pObj, pCtrl);
   umFormConsultaCidades.ShowModal;
end;

procedure Interfaces.PDClientes(pObj, pCtrl: TObject);
begin
   umFormConsultaClientes.ConhecaObj(pObj, pCtrl);
   umFormConsultaClientes.ShowModal;
end;

procedure Interfaces.PDCompras(pObj, pCtrl: TObject);
begin
   umFormConsultaCompra.ConhecaObj(pObj, pCtrl);
   umFormConsultaCompra.ShowModal;
end;

procedure Interfaces.PDCondPgto(pObj, pCtrl: TObject);
begin
   umFormConsultaCondPgto.ConhecaObj(pObj, pCtrl);
   umFormConsultaCondPgto.ShowModal;
end;

procedure Interfaces.PDContasPgo(pObj, pCtrl: TObject);
begin
   umFormConsultaContaPgo.ConhecaObj(pObj, pCtrl);
   umFormConsultaContaPgo.ShowModal;
end;

procedure Interfaces.PDContasRcb(pObj, pCtrl: TObject);
begin
   umFormConsultaContaRcb.ConhecaObj(pObj, pCtrl);
   umFormConsultaContaRcb.ShowModal;
end;

procedure Interfaces.PDEstados(pObj, pCtrl : TObject);
begin
   umFormConsultaEstados.ConhecaObj(pObj, pCtrl);
   umFormConsultaEstados.ShowModal;
end;

procedure Interfaces.PDFornecedores(pObj, pCtrl: TObject);
begin
   umFormConsultaFornecedores.ConhecaObj(pObj, pCtrl);
   umFormConsultaFornecedores.ShowModal;
end;

procedure Interfaces.PDFuncionarios(pObj, pCtrl: TObject);
begin
   umFormConsultaFuncionarios.ConhecaObj(pObj, pCtrl);
   umFormConsultaFuncionarios.ShowModal;
end;

procedure Interfaces.PDPaises(pObj, pCtrl : TObject);
begin
   umFormConsultaPaises.ConhecaObj(pObj, pCtrl);
   umFormConsultaPaises.ShowModal;
end;

procedure Interfaces.PDProdutos(pObj, pCtrl: TObject);
begin
   umFormConsultaProdutos.ConhecaObj(pObj, pCtrl);
   umFormConsultaProdutos.ShowModal;
end;

procedure Interfaces.PDVendas(pObj, pCtrl: TObject);
begin
   umFormConsultaVenda.ConhecaObj(pObj, pCtrl);
   umFormConsultaVenda.ShowModal;
end;

end.
