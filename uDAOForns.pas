unit uDAOForns;

interface
 uses uDao, uDM, uColForns, uFornecedor, Data.DB;

 type DAOForns = class(DAO)
   private
   protected
      aColForns : ColFornecedores;
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

{ DAOForns }

function DAOForns.Carregar(pObj : TObject): string;
var mForn : Fornecedores;
begin
   try
     try
        mForn := Fornecedores(pObj);
        with umDM.qForns do
        begin
           mForn.setCodigo(FieldByName('CODFORNECEDOR').Value);
           mForn.setNomeFantasia(FieldByName('NOME').AsString);
           mForn.setRazaoSocial(FieldByName('RAZAOSOCIAL').AsString);
           mForn.setInscrEstadual(FieldByName('INSCRESTADUAL').AsString);
           mForn.setCNPJ(FieldByName('CNPJ').AsString);
           mForn.setCEP(FieldByName('CEP').AsString);
           mForn.setEndereco(FieldByName('ENDERECO').AsString);
           mForn.setEmail(FieldByName('EMAIL').AsString);
           mForn.setTelefone(FieldByName('TELEFONE').AsString);
           mForn.getoProduto.setCodigo(FieldByName('CODPRODUTO').Value);
           mForn.getaCidade.setCodigo(FieldByName('CODCIDADE').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOForns.CarregarColecao: TObject;
begin
//   Result := aColForns;
end;

constructor DAOForns.CrieObj;
begin
//   aColForns := ColFornecedores.CrieObj;
end;

destructor DAOForns.Destrua_se;
begin
//   aColForns.Destrua_se;
end;

function DAOForns.Excluir(pObj: TOBject): string;
var mSql : string;
    mForn : Fornecedores;
begin
   try
      mForn := Fornecedores(pObj);
      mSql := 'delete from fornecedores where codFornecedor =' +quotedstr(inttostr(mForn.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qForns.Active := false;
      umDM.qForns.SQL.Clear;
      umDM.qForns.SQL.Add(mSql);
      umDM.qForns.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOForns.getDS: TDataSource;
begin
   Result := umDM.DsForns;
end;

function DAOForns.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from fornecedores';
   if pChave <> '' then
      mSql := 'select * from fornecedores where Nome like' +quotedstr('%'+pChave+'%')+ 'order by Nome;';
   umDM.qForns.Active := false;
   umDM.qForns.SQL.Clear;
   umDM.qForns.SQL.Add(mSql);
   umDM.qForns.Open;
end;

function DAOForns.salvar(pObj: TObject): string;
var mSql: string;
    mForn : Fornecedores;
begin
   try
     umDM.FDTrans.StartTransaction;
     mForn := Fornecedores(pObj);
     with umDM.qForns do
     begin
        if mForn.getCodigo = 0 then
           mSql := 'insert into fornecedores(Nome, razaosocial, inscrestadual, cnpj, cep, endereco, email, telefone, codcidade, codproduto)  values   (:Nome, :razsoc, :inscrestadual, :cnpj, :cep, :endereco, :email, :telefone, :codcidade, :codproduto)'
        else
        begin
           mSql := 'update Fornecedores set Nome = :Nome, razsoc = :razsoc, inscrestadual = :inscrestadual, cnpj = :cnpj, cep = :cep, endereco = :endereco, email = :email, telefone = :telefone, codproduto = :codproduto, codcidade = :codcidade';
           mSql := mSql + ' where codFornecedor = :CodFornecedor;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        UMDM.qForns.ParamByName('NOME').Value := mForn.getNomeFantasia;
        UMDM.qForns.ParamByName('RAZAOSOCIAL').Value := mForn.getRazaoSocial;
        UMDM.qForns.ParamByName('INSCRESTADUAL').Value := mForn.getInscrEstadual;
        UMDM.qForns.ParamByName('CNPJ').Value := mForn.getCNPJ;
        UMDM.qForns.ParamByName('CEP').Value := mForn.getCEP;
        UMDM.qForns.ParamByName('ENDERECO').Value := mForn.getEndereco;
        UMDM.qForns.ParamByName('EMAIL').Value := mForn.getEmail;
        UMDM.qForns.ParamByName('TELEFONE').Value := mForn.getTelefone;
        UMDM.qForns.ParamByName('CODPRODUTO').Value := mForn.getoProduto.getCodigo;
        UMDM.qForns.ParamByName('CODCIDADE').Value := mForn.getaCidade.getCodigo;
        if mForn.getCodigo > 0 then   // <>0
           UMDM.qForns.ParamByName('CODFORNECEDOR').Value := mForn.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
     umDM.qForns.sql.Clear;
     umDM.qForns.sql.add('select * from fornecedores;');
     UMDM.qForns.Open;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
