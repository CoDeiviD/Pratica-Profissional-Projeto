unit uDAOFuncs;

interface
 uses uDao, uDM, uColFuncs, uFuncionario, Data.DB;

 type DAOFuncs = class(DAO)
   private
   protected
      aColFuncs : ColFuncionarios;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pObj : TObject): string;                override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;  override;
 end;
implementation

uses
  System.SysUtils;

{ DAOFuncs }

function DAOFuncs.Carregar(pObj : TObject): string;
var mFunc : Funcionarios;
begin
   try
     try
        mFunc := Funcionarios(pObj);
        with umDM.qFuncs do
        begin
           mFunc.setCodigo(FieldByName('CODCLIENTE').Value);
           mFunc.setNome(FieldByName('NOME').AsString);
           mFunc.setDtNasc(FieldByName('DTNASC').Value);
           mFunc.setCPF_CNPJ(FieldByName('CPF_CNPJ').AsString);
           mFunc.setRG(FieldByName('RG').AsString);
           mFunc.setCEP(FieldByName('CEP').AsString);
           mFunc.setEndereco(FieldByName('ENDERECO').AsString);
           mFunc.setEmail(FieldByName('EMAIL').AsString);
           mFunc.setTelefone(FieldByName('TELEFONE').AsString);
           mFunc.setMidia(FieldByName('MIDIA').AsString);
           mFunc.getaCidade.setCodigo(FieldByName('CODCIDADE').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOFuncs.CarregarColecao: TObject;
begin
//   Result := aColFuncs;
end;

constructor DAOFuncs.CrieObj;
begin
//   aColFuncs := ColFuncionarios.CrieObj;
end;

destructor DAOFuncs.Destrua_se;
begin
//   aColFuncs.Destrua_se;
end;

function DAOFuncs.Excluir(pObj: TOBject): string;
var mSql : string;
    mFunc : Funcionarios;
begin
   try
      mFunc := Funcionarios(pObj);
      mSql := 'delete from funcionarios where codFuncionario =' +quotedstr(inttostr(mFunc.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qFuncs.Active := false;
      umDM.qFuncs.SQL.Clear;
      umDM.qFuncs.SQL.Add(mSql);
      umDM.qFuncs.Open;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOFuncs.getDS: TDataSource;
begin
   Result := umDM.DSFuncs;
end;

function DAOFuncs.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from funcionarios';
   if pChave <> '' then
      mSql := 'select * from funcionarios where Nome like' +quotedstr('%'+pChave+'%')+ 'order by Nome;';
   umDM.qFuncs.Active := false;
   umDM.qFuncs.SQL.Clear;
   umDM.qFuncs.SQL.Add(mSql);
   umDM.qFuncs.Open;
end;

function DAOFuncs.salvar(pObj: TObject): string;
var mSql: string;
    mFunc : Funcionarios;
begin
   try
     umDM.FDTrans.StartTransaction;
     mFunc := Funcionarios(pObj);
     with umDM.qFuncs do
     begin
        if mFunc.getCodigo = 0 then
           mSql := 'insert into funcionarios(Nome, dtnasc, cpf_cnpj, rg, cep, endereco, email, telefone, midia, salario, cargah, codcidade) values (:Nome, :dtnasc, :cpf_cnpj, :rg, :cep, :endereco, :email, :telefone, :midia, :salario, :cargah, :codcidade)'
        else
        begin
           mSql := 'update Funcionarios set Nome = :Nome, dtnasc = :dtnasc, cpf_cnpj = :cpf_cnpj, rg = :rg, cep = :cep, endereco = :endereco, email = :email, telefone = :telefone, midia = :midia, salario = :salario, cargah = :cargah, codcidade = :codcidade';
           mSql := mSql + ' where codFunc = :CodFunc;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        ParamByName('NOME').Value := mFunc.getNome;
        ParamByName('DTNASC').Value := mFunc.getDtNasc;
        ParamByName('CPF_CNPJ').Value := mFunc.getCPF_CNPJ;
        ParamByName('RG').Value := mFunc.getRG;
        ParamByName('CEP').Value := mFunc.getCEP;
        ParamByName('ENDERECO').Value := mFunc.getEndereco;
        ParamByName('EMAIL').Value := mFunc.getEmail;
        ParamByName('TELEFONE').Value := mFunc.getTelefone;
        ParamByName('MIDIA').Value := mFunc.getMidia;
        ParamByName('SALARIO').Value := mFunc.getSalario;
        ParamByName('CARGAH').Value := mFunc.getCargaH;
        ParamByName('CODCIDADE').Value := mFunc.getaCidade.getCodigo;
        if mFunc.getCodigo > 0 then   // <>0
           ParamByName('CODFUNC').Value := mFunc.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
