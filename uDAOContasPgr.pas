unit uDAOContasPgr;

interface
 uses uDao, uDM, uColContasPgr, uContasPgr, Data.DB;

 type DAOContasPgr = class(DAO)
   private
   protected
      aColContasPgr : ColContasPgr;
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

{ DAOCidades }

function DAOContasPgr.Carregar(pObj : TObject): string;
var mCPgr : ContasPgr;
begin
   try
     try
        mCPgr := ContasPgr(pObj);
        with umDM.qContPgr do
        begin
           mCPgr.setCodigo(FieldByName('CODCONTAPGR').Value);
           mCPgr.setValor(FieldByName('VALOR').Value);
           mCPgr.setDtVencimento(FieldByName('DTVENCIMENTO').Value);
           mCPgr.setDtPagamento(FieldByName('DTPAGAMENTO').Value);
           mCPgr.setVPago(FieldByName('VPAGO').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOContasPgr.CarregarColecao: TObject;
begin

end;

constructor DAOContasPgr.CrieObj;
begin

end;

destructor DAOContasPgr.Destrua_se;
begin

end;

function DAOContasPgr.Excluir(pObj: TOBject): string;
var mSql : string;
    mCPgr : ContasPgr;
begin
   try
      mCPgr := ContasPgr(pObj);
      mSql := 'delete from contaspgr where codContaPgr =' +quotedstr(inttostr(mCPgr.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qContPgr.Active := false;
      umDM.qContPgr.SQL.Clear;
      umDM.qContPgr.SQL.Add(mSql);
      umDM.qContPgr.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOContasPgr.getDS: TDataSource;
begin
   Result := umDM.DSContPgr;
end;

function DAOContasPgr.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from contaspgr';
   if pChave <> '' then
      mSql := 'select * from contaspgr where Valor like' +quotedstr('%'+pChave+'%')+ 'order by Valor;';
   umDM.qContPgr.Active := false;
   umDM.qContPgr.SQL.Clear;
   umDM.qContPgr.SQL.Add(mSql);
   umDM.qContPgr.Open;
end;

function DAOContasPgr.salvar(pObj: TObject): string;
var mSql: string;
    mContasPgr : ContasPgr;
begin
   try
     umDM.FDTrans.StartTransaction;
     mContasPgr := ContasPgr(pObj);
     with umDM.qContPgr do
     begin
        if mContasPgr.getCodigo = 0 then
           mSql := 'insert into ContasPgr(valor, dtvencimento, dtpagamento, vpago) values (:Valor, :dtvencimento, :dtpagamento, :vpago)'
        else
        begin
           mSql := 'update ContasPgr set Valor = :Valor, dtvencimento = :dtvencimento, dtpagamento = :dtpagamento, vpago = :vpago';
           mSql := mSql + ' where codContaPgr = :CodContaPgr;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qContPgr.ParamByName('VALOR').Value := mContasPgr.getValor;
        umDM.qContPgr.ParamByName('DTVENCIMENTO').Value := mContasPgr.getDtVencimento;
        umDM.qContPgr.ParamByName('DTPAGAMENTO').Value := mContasPgr.getDtPagamento;
        umDM.qContPgr.ParamByName('VPAGO').Value := mContasPgr.getVPago;
        if mContasPgr.getCodigo > 0 then   // <>0
           umDM.qContPgr.ParamByName('CODCONTAPGR').Value := mContasPgr.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
     umDM.qContPgr.sql.Clear;
     umDM.qContPgr.sql.add('select * from contaspgr;');
     UMDM.qContPgr.Open;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
