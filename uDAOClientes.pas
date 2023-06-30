unit uDAOClientes;

interface
 uses uDao, uDM, uColClientes, uCliente, Data.DB;

 type DAOClientes = class(DAO)
   private
   protected
      aColClientes : ColClientes;
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

{ DAOClientes }

function DAOClientes.Carregar(pObj : TObject): string;
var mCliente : Clientes;
begin
   try
     try
        mCliente := Clientes(pObj);
        with umDM.qClientes do
        begin
           mCliente.setCodigo(FieldByName('CODCLIENTE').Value);
           mCliente.setNome(FieldByName('NOME').AsString);
           mCliente.setDtNasc(FieldByName('DTNASC').Value);
           mCliente.setCPF_CNPJ(FieldByName('CPF_CNPJ').AsString);
           mCliente.setRG(FieldByName('RG').AsString);
           mCliente.setCEP(FieldByName('CEP').AsString);
           mCliente.setEndereco(FieldByName('ENDERECO').AsString);
           mCliente.setEmail(FieldByName('EMAIL').AsString);
           mCliente.setTelefone(FieldByName('TELEFONE').AsString);
           mCliente.setMidia(FieldByName('MIDIA').AsString);
           mCliente.getaCidade.setCodigo(FieldByName('CODCIDADE').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOClientes.CarregarColecao: TObject;
begin

end;

constructor DAOClientes.CrieObj;
begin

end;

destructor DAOClientes.Destrua_se;
begin

end;

function DAOClientes.Excluir(pObj: TOBject): string;
var mSql : string;
    mCliente : Clientes;
begin
   try
      mCliente := Clientes(pObj);
      mSql := 'delete from clientes where codCliente =' +quotedstr(inttostr(mCliente.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qClientes.Active := false;
      umDM.qClientes.SQL.Clear;
      umDM.qClientes.SQL.Add(mSql);
      umDM.qClientes.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOClientes.getDS: TDataSource;
begin
   Result := umDM.DsClientes;
end;

function DAOClientes.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from clientes';
   if pChave <> '' then
      mSql := 'select * from clientes where Nome like' +quotedstr('%'+pChave+'%')+ 'order by Nome;';
   umDM.qClientes.Active := false;
   umDM.qClientes.SQL.Clear;
   umDM.qClientes.SQL.Add(mSql);
   umDM.qClientes.Open;
end;

function DAOClientes.salvar(pObj: TObject): string;
var mSql: string;
    mCliente : Clientes;
begin
   try
     umDM.FDTrans.StartTransaction;
     mCliente := Clientes(pObj);
     with umDM.qClientes do
     begin
        if mCliente.getCodigo = 0 then
           mSql := 'insert into clientes(Nome, dtnasc, cpf_cnpj, rg, cep, endereco, email, telefone, midia, codcidade) values (:Nome, :dtnasc, :cpf_cnpj, :rg, :cep, :endereco, :email, :telefone, :midia, :codcidade)'
        else
        begin
           mSql := 'update Clientes set Nome = :Nome, dtnasc = :dtnasc, cpf_cnpj = :cpf_cnpj, rg = :rg, cep = :cep, endereco = :endereco, email = :email, telefone = :telefone, midia = :midia, codcidade = :codcidade';
           mSql := mSql + ' where codCliente = :CodCliente;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qClientes.ParamByName('NOME').Value := mCliente.getNome;
        umDM.qClientes.ParamByName('DTNASC').Value := mCliente.getDtNasc;
        umDM.qClientes.ParamByName('CPF_CNPJ').Value := mCliente.getCPF_CNPJ;
        umDM.qClientes.ParamByName('RG').Value := mCliente.getRG;
        umDM.qClientes.ParamByName('CEP').Value := mCliente.getCEP;
        umDM.qClientes.ParamByName('ENDERECO').Value := mCliente.getEndereco;
        umDM.qClientes.ParamByName('EMAIL').Value := mCliente.getEmail;
        umDM.qClientes.ParamByName('TELEFONE').Value := mCliente.getTelefone;
        umDM.qClientes.ParamByName('MIDIA').Value := mCliente.getMidia;
        umDM.qClientes.ParamByName('CODCIDADE').Value := mCliente.getaCidade.getCodigo;
        if mCliente.getCodigo > 0 then   // <>0
           umDM.qClientes.ParamByName('CODCLIENTE').Value := mCliente.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
     umDM.qClientes.sql.Clear;
     umDM.qClientes.sql.add('select * from clientes;');
     UMDM.qClientes.Open;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
