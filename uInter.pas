unit uInter;

interface
   uses uConsultaPaises, uConsultaEstados, uConsultaCidades,
        uCadastroPaises, uCadastroEstados, uCadastroCidades,
        uConsultaClientes, uConsultaFornecedores, uConsultaFuncionarios,
        uCadastroClientes, uCadastroFornecedores, uCadastroFuncionarios;
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

     public
        constructor CrieObj;
        destructor Destrua_se;
        procedure PDPaises(pObj, pCtrl : TObject);
        procedure PDEstados(pObj, pCtrl : TObject);
        procedure PDCidades(pObj, pCtrl : TObject);
        procedure PDClientes(pObj, pCtrl : TObject);
        procedure PDFornecedores(pObj, pCtrl : TObject);
        procedure PDFuncionarios(pObj, pCtrl : TObject);
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

   umFormCadastroPaises := TFormCadastroPaises.Create(nil);
   umFormCadastroEstados := TFormCadastroEstados.Create(nil);
   umFormCadastroCidades := TFormCadastroCidades.Create(nil);
   umFormCadastroClientes := TFormCadastroClientes.Create(nil);
   umFormCadastroFornecedores := TFormCadastroFornecedores.Create(nil);
   umFormCadastroFuncionarios := TFormCadastroFuncionarios.Create(nil);

   umFormConsultaPaises.setCadastro(umFormCadastroPaises);
   umFormConsultaEstados.setCadastro(umFormCadastroEstados);
   umFormConsultaCidades.setCadastro(umFormCadastroCidades);
   umFormConsultaClientes.setCadastro(umFormCadastroClientes);
   umFormConsultaFornecedores.setCadastro(umFormCadastroFornecedores);
   umFormConsultaFuncionarios.setCadastro(umFormCadastroFuncionarios);

   umFormCadastroCidades.setConsulta(umFormConsultaCidades);
   umFormCadastroEstados.setConsulta(umFormConsultaEstados);
   umFormCadastroPaises.setConsulta(umFormConsultaPaises);
   umFormCadastroClientes.setConsulta(umFormConsultaClientes);
   umFormCadastroFornecedores.setConsulta(umFormConsultaFornecedores);
   umFormCadastroFuncionarios.setConsulta(umFormConsultaFuncionarios);
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

end.
