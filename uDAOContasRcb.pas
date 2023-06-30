unit uDAOContasRcb;

interface
 uses uDao, uDM, uColContasRcb, uContasRcb, Data.DB;

 type DAOContasRcb = class(DAO)
   private
   protected
      aColContasRcb : ColContasRcb;
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

{ DAOContasRcb }

function DAOContasRcb.Carregar(pObj : TObject): string;
var mCRcb : ContasRcb;
begin
   try
     try
        mCRcb := ContasRcb(pObj);
        with umDM.qContRcb do
        begin
           mCRcb.setCodigo(FieldByName('CODCONTARCB').Value);
           mCRcb.setValor(FieldByName('VALOR').Value);
           mCRcb.setDtVencimento(FieldByName('DTVENCIMENTO').Value);
           mCRcb.setDtPagamento(FieldByName('DTPAGAMENTO').Value);
           mCRcb.setVReceb(FieldByName('VRECEB').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOContasRcb.CarregarColecao: TObject;
begin
//   Result := aColContasRcb;
end;

constructor DAOContasRcb.CrieObj;
begin
//   aColContasRcb := ColContasRcb.CrieObj;
end;

destructor DAOContasRcb.Destrua_se;
begin
//   aColContasRcb.Destrua_se;
end;

function DAOContasRcb.Excluir(pObj: TOBject): string;
var mSql : string;
    mCRcb : ContasRcb;
begin
   try
      mCRcb := ContasRcb(pObj);
      mSql := 'delete from contasRcb where codContaRcb =' +quotedstr(inttostr(mCRcb.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qContRcb.Active := false;
      umDM.qContRcb.SQL.Clear;
      umDM.qContRcb.SQL.Add(mSql);
      umDM.qContRcb.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOContasRcb.getDS: TDataSource;
begin
   Result := umDM.DSContRcb;
end;

function DAOContasRcb.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from contasrcb';
   if pChave <> '' then
      mSql := 'select * from contasrcb where Valor like' +quotedstr('%'+pChave+'%')+ 'order by Valor;';
   umDM.qContRcb.Active := false;
   umDM.qContRcb.SQL.Clear;
   umDM.qContRcb.SQL.Add(mSql);
   umDM.qContRcb.Open;
end;

function DAOContasRcb.salvar(pObj: TObject): string;
var mSql: string;
    mContasRcb : ContasRcb;
begin
   try
     umDM.FDTrans.StartTransaction;
     mContasRcb := ContasRcb(pObj);
     with umDM.qContRcb do
     begin
        if mContasRcb.getCodigo = 0 then
           mSql := 'insert into ContasRcb(valor, dtvencimento, dtpagamento, vreceb) values (:Valor, :dtvencimento, :dtpagamento, :vreceb)'
        else
        begin
           mSql := 'update ContasRcb set valor = :valor, dtvencimento = :dtvencimento, dtpagamento = :dtpagamento, vreceb = :vreceb';
           mSql := mSql + ' where codContaRcb = :CodContaRcb;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qContRcb.ParamByName('VALOR').Value := mContasRcb.getValor;
        umDM.qContRcb.ParamByName('DTVENCIMENTO').Value := mContasRcb.getDtVencimento;
        umDM.qContRcb.ParamByName('DTPAGAMENTO').Value := mContasRcb.getDtPagamento;
        umDM.qContRcb.ParamByName('VRECEB').Value := mContasRcb.getVReceb;
        if mContasRcb.getCodigo > 0 then   // <>0
           umDM.qContRcb.ParamByName('CODCONTARCB').Value := mContasRcb.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
     umDM.qContRcb.sql.Clear;
     umDM.qContRcb.sql.add('select * from contasrcb;');
     UMDM.qContRcb.Open;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
