unit uInter;

interface
   uses uConsultaPaises, uConsultaEstados, uConsultaCidades,
        uCadastroPaises, uCadastroEstados, uCadastroCidades;
   type Interfaces = class
     private
     protected
        umFormConsultaPaises : TFormConsultaPaises;
        umFormConsultaEstados : TFormConsultaEstados;
        umFormConsultaCidades : TFormConsultaCidades;
        umFormCadastroPaises : TFormCadastroPaises;
        umFormCadastroEstados : TFormCadastroEstados;
        umFormCadastroCidades : TFormCadastroCidades;

     public
        constructor CrieObj;
        destructor Destrua_se;
        procedure PDPaises(pObj, pCtrl : TObject);
        procedure PDEstados(pObj, pCtrl : TObject);
        procedure PDCidades(pObj, pCtrl : TObject);
   end;
implementation

{ Interfaces }

constructor Interfaces.CrieObj;
begin
   umFormConsultaPaises := TFormConsultaPaises.Create(nil);
   umFormConsultaEstados := TFormConsultaEstados.Create(nil);
   umFormConsultaCidades := TFormConsultaCidades.Create(nil);

   umFormCadastroPaises := TFormCadastroPaises.Create(nil);
   umFormCadastroEstados := TFormCadastroEstados.Create(nil);

   umFormConsultaPaises.setCadastro(umFormCadastroPaises);
   umFormConsultaEstados.setCadastro(umFormCadastroEstados);
   umFormConsultaCidades.setCadastro(umFormCadastroCidades);

   umFormCadastroEstados.setConsulta(umFormConsultaEstados);
   umFormCadastroPaises.setConsulta(umFormConsultaPaises);
end;

destructor Interfaces.Destrua_se;
begin
   umFormConsultaPaises.FreeInstance;
   umFormConsultaEstados.FreeInstance;
   umFormConsultaCidades.FreeInstance;

   umFormCadastroPaises.FreeInstance;
   umFormCadastroEstados.FreeInstance;
   umFormCadastroCidades.FreeInstance;
end;

procedure Interfaces.PDCidades(pObj, pCtrl : TObject);
begin
   umFormConsultaCidades.ConhecaObj(pObj, pCtrl);
   umFormConsultaCidades.ShowModal;
end;

procedure Interfaces.PDEstados(pObj, pCtrl : TObject);
begin
   umFormConsultaEstados.ConhecaObj(pObj, pCtrl);
   umFormConsultaEstados.ShowModal;
end;

procedure Interfaces.PDPaises(pObj, pCtrl : TObject);
begin
   umFormConsultaPaises.ConhecaObj(pObj, pCtrl);
   umFormConsultaPaises.ShowModal;
end;

end.
