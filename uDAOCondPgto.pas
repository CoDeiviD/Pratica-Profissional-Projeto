unit uDAOCondPgto;

interface
  uses uDao, uDM, uColCondPgto, uCondPgto, Data.DB;

 type DAOCondPgto = class(DAO)
   private
   protected
      aColCondPgto : ColCondPgto;
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

{ DAOCondPgto }

function DAOCondPgto.Carregar(pObj: TObject): string;
var mCondPg : CondPgto;
begin
   try
     try
        mCondPg := CondPgto(pObj);
        with umDM.qCondsPgto do
        begin
           mCondPg.setPrazo(FieldByName('PRAZO').Value);
           mCondPg.setFormaPgto(FieldByName('FORMAPGTO').AsString);
           mCondPg.setPercent(FieldByName('PERCENT').Value);
           mCondPg.setTotValor(FieldByName('TOTVALOR').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOCondPgto.CarregarColecao: TObject;
begin

end;

constructor DAOCondPgto.CrieObj;
begin

end;

destructor DAOCondPgto.Destrua_se;
begin

end;

function DAOCondPgto.Excluir(pObj: TOBject): string;
var mSql : string;
    mCondPg : CondPgto;
begin
   try
      mCondPg := CondPgto(pObj);
      mSql := 'delete from condpgto where prazo =' +quotedstr(datetostr(mCondPg.getPrazo));
      umDM.FDTrans.StartTransaction;
      umDM.qCondsPgto.Active := false;
      umDM.qCondsPgto.SQL.Clear;
      umDM.qCondsPgto.SQL.Add(mSql);
      umDM.qCondsPgto.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOCondPgto.getDS: TDataSource;
begin
   Result := umDM.DSCondsPgto;
end;

function DAOCondPgto.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from condspgto';
   if pChave <> '' then
      mSql := 'select * from condspgto where TpProduto like' +quotedstr('%'+pChave+'%')+ 'order by TpProduto;';
   umDM.qCondsPgto.Active := false;
   umDM.qCondsPgto.SQL.Clear;
   umDM.qCondsPgto.SQL.Add(mSql);
   umDM.qCondsPgto.Open;
end;

function DAOCondPgto.salvar(pObj: TObject): string;
var mSql: string;
    mCondPg : CondPgto;
begin
   try
     umDM.FDTrans.StartTransaction;
     mCondPg := CondPgto(pObj);
     with umDM.qCompras do
     begin
        if mCondPg.getPrazo = 0 then
           mSql := 'insert into condspgto(codproduto, TpProduto, sabor, preco) values (:codproduto, :TpProduto, :sabor, :preco)'
        else
        begin
           mSql := 'update Condspgto set TpProduto = :TpProduto, sabor = :sabor, preco = :preco';
           mSql := mSql + ' where codProduto = :CodProduto;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qCompras.ParamByName('FORMAPGTO').Value := mCondPg.getFormaPgto;
        umDM.qCompras.ParamByName('PERC').Value := mCondPg.getPercent;
        umDM.qCompras.ParamByName('TVALOR').Value := mCondPg.getTotValor;
        if mCondPg.getPrazo > 0 then   // <>0
           umDM.qCondsPgto.ParamByName('PRAZO').Value := mCondPg.getPrazo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
     umDM.qCondsPgto.sql.Clear;
     umDM.qCondsPgto.sql.add('select * from condspgto;');
     UMDM.qCondsPgto.Open;
   end;
end;

end.
