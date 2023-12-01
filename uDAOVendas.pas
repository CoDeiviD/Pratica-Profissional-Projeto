unit uDAOVendas;

interface
  uses uDao, uDM, uColVendas, uVendas, Data.DB;

 type DAOVendas = class(DAO)
   private
   protected
      aColVendas : ColVendas;
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

{ DAOVendas }

function DAOVendas.Carregar(pObj : TObject): string;
var mVenda : Vendas;
begin
   try
     try
        mVenda := Vendas(pObj);
        with umDM.qVendas do
        begin
           mVenda.setCodigo(FieldByName('CODVENDA').Value);
           mVenda.setDtVenda(FieldByName('DTVENDA').Value);
           mVenda.setObs(FieldByName('OBS').AsString);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOVendas.CarregarColecao: TObject;
begin
//   Result := aColProdutos;
end;

constructor DAOVendas.CrieObj;
begin
//   aColProdutos := ColProdutos.CrieObj;
end;

destructor DAOVendas.Destrua_se;
begin
//   aColProdutos.Destrua_se;
end;

function DAOVendas.Excluir(pObj: TOBject): string;
var mSql : string;
    mVenda : Vendas;
begin
   try
      mVenda := Vendas(pObj);
      mSql := 'delete from vendas where codVendas =' +quotedstr(inttostr(mVenda.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qVendas.Active := false;
      umDM.qVendas.SQL.Clear;
      umDM.qVendas.SQL.Add(mSql);
      umDM.qVendas.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOVendas.getDS: TDataSource;
begin
   Result := umDM.DSCompras;
end;

function DAOVendas.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from vendas';
   if pChave <> '' then
      mSql := 'select * from vendas where OBS like' +quotedstr('%'+pChave+'%')+ 'order by OBS;';
   umDM.qVendas.Active := false;
   umDM.qVendas.SQL.Clear;
   umDM.qVendas.SQL.Add(mSql);
   umDM.qVendas.Open;
end;

function DAOVendas.salvar(pObj: TObject): string;
var mSql: string;
    mVenda : Vendas;
begin
   try
     umDM.FDTrans.StartTransaction;
     mVenda := Vendas(pObj);
     with umDM.qVendas do
     begin
        if mVenda.getCodigo = 0 then
           mSql := 'insert into vendas(DtVenda, OBS) values (:DtVenda, :OBS)'
        else
        begin
           mSql := 'update Vendas set OBS = :OBS, DtVenda = :DtVenda';
           mSql := mSql + ' where codVenda = :CodVenda;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qVendas.ParamByName('DTVENDA').Value := mVenda.getDtVenda;
        umDM.qVendas.ParamByName('OBS').Value := mVenda.getObs;
        if mVenda.getCodigo > 0 then   // <>0
           umDM.qVendas.ParamByName('CODVENDA').Value := mVenda.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
     umDM.qVendas.sql.Clear;
     umDM.qVendas.sql.add('select * from vendas;');
     UMDM.qVendas.Open;
   end;
end;

end.
