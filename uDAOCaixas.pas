unit uDAOCaixas;

interface
 uses uDao, uDM, uColCaixas, uCaixas, Data.DB;

 type DAOCaixas = class(DAO)
   private
   protected
      aColCaixas : ColCaixas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pObj : TObject): string;  override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;  override;
 end;
implementation

uses
  System.SysUtils;

{ DAOCaixas }

function DAOCaixas.Carregar(pObj : TObject): string;
var mCaixa : Caixas;
begin
   try
     try
        mCaixa := Caixas(pObj);
        with umDM.qCaixas do
        begin
           mCaixa.setCodigo(FieldByName('CODCAIXA').Value);
           mCaixa.setData(FieldByName('DATA').Value);
           mCaixa.setHistorico(FieldByName('HISTORICO').AsString);
           mCaixa.setEntrada(FieldByName('ENTRADA').Value);
           mCaixa.setSaida(FieldByName('SAIDA').Value);
           mCaixa.setSaldo(FieldByName('SALDO').Value);
           mCaixa.setSaldoTot(FieldByName('SALDOTOTAL').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOCaixas.CarregarColecao: TObject;
begin
//   Result := aColCaixas;
end;

constructor DAOCaixas.CrieObj;
begin
//   aColCaixas := ColCaixas.CrieObj;
end;

destructor DAOCaixas.Destrua_se;
begin
//   aColCaixas.Destrua_se;
end;

function DAOCaixas.Excluir(pObj: TOBject): string;
var mSql : string;
    mCaixa : Caixas;
begin
   try
      mCaixa := Caixas(pObj);
      mSql := 'delete from caixas where codCaixa =' +quotedstr(inttostr(mCaixa.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qCaixas.Active := false;
      umDM.qCaixas.SQL.Clear;
      umDM.qCaixas.SQL.Add(mSql);
      umDM.qCaixas.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOCaixas.getDS: TDataSource;
begin
   Result := umDM.DSCaixas;
end;

function DAOCaixas.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from caixas';
   if pChave <> '' then
      mSql := 'select * from caixas where Data like' +quotedstr('%'+pChave+'%')+ 'order by Data;';
   umDM.qCaixas.Active := false;
   umDM.qCaixas.SQL.Clear;
   umDM.qCaixas.SQL.Add(mSql);
   umDM.qCaixas.Open;
end;

function DAOCaixas.salvar(pObj: TObject): string;
var mSql: string;
    mCaixa : Caixas;
begin
   try
     umDM.FDTrans.StartTransaction;
     mCaixa := Caixas(pObj);
     with umDM.qCaixas do
     begin
        if mCaixa.getCodigo = 0 then
           mSql := 'insert into caixas(data, historico, entrada, saida, saldo, saldotot) values (:Data, :historico, :entrada, :saida, :saldo, :saldotot)'
        else
        begin
           mSql := 'update Caixas set Data = :Data, historico = :historico, entrada = :entrada, saida = :saida, saldo = :saldo, saldotot = :saldotot';
           mSql := mSql + ' where codCaixa = :CodCaixa;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qCaixas.ParamByName('DATA').Value := mCaixa.getData;
        umDM.qCaixas.ParamByName('HISTORICO').Value := mCaixa.getHistorico;
        umDM.qCaixas.ParamByName('ENTRADA').Value := mCaixa.getEntrada;
        umDM.qCaixas.ParamByName('SAIDA').Value := mCaixa.getSaida;
        umDM.qCaixas.ParamByName('SALDO').Value := mCaixa.getSaldo;
        umDM.qCaixas.ParamByName('SALDOTOT').Value := mCaixa.getSaldoTot;
        if mCaixa.getCodigo > 0 then   // <>0
           umDM.qCaixas.ParamByName('CODCAIXA').Value := mCaixa.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
     umDM.qCaixas.sql.Clear;
     umDM.qCaixas.sql.add('select * from caixas;');
     UMDM.qCaixas.Open;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
