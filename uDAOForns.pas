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
           mForn.setNomeFantasia(FieldByName('NOMEFANTASIA').AsString);
           mForn.setRazaoSocial(FieldByName('RAZAOSOCIAL').AsString);
           mForn.setInscrEstadual(FieldByName('INSCTICAOESTADUAL').AsString);
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
      umDM.qForns.Open;
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
      mSql := 'select * from fornecedores where NomeFantasia like' +quotedstr('%'+pChave+'%')+ 'order by NomeFantasia;';
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
           mSql := 'insert into fornecedores(Nomefantasia, razsoc, inscrestad, cnpj, cep, endereco, email, telefone, codcidade) values (:Nomefantasia, :razsoc, :inscrestad, :cnpj, :cep, :endereco, :email, :telefone, :codproduto, :codcidade)'
        else
        begin
           mSql := 'update Fornecedores set Nomefantasia = :Nomefantasia, razsoc = :razsoc, inscrestad = :inscrestad, cnpj = :cnpj, cep = :cep, endereco = :endereco, email = :email, telefone = :telefone, codproduto = :codproduto, codcidade = :codcidade';
           mSql := mSql + ' where codFornecedor = :CodFornecedor;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        ParamByName('NOMEFANTASIA').Value := mForn.getNomeFantasia;
        ParamByName('RAZAOSOCIAL').Value := mForn.getRazaoSocial;
        ParamByName('INSCTICAOESTADUAL').Value := mForn.getInscrEstadual;
        ParamByName('CNPJ').Value := mForn.getCNPJ;
        ParamByName('CEP').Value := mForn.getCEP;
        ParamByName('ENDERECO').Value := mForn.getEndereco;
        ParamByName('EMAIL').Value := mForn.getEmail;
        ParamByName('TELEFONE').Value := mForn.getTelefone;
        ParamByName('CODPRODUTO').Value := mForn.getoProduto.getCodigo;
        ParamByName('CODCIDADE').Value := mForn.getaCidade.getCodigo;
        if mForn.getCodigo > 0 then   // <>0
           ParamByName('CODFORNECEDOR').Value := mForn.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
