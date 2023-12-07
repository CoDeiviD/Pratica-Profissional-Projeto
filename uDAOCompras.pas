unit uDAOCompras;

interface
 uses uDao, uDM, uColCompras, uCompras, Data.DB;

 type DAOCompras = class(DAO)
   private
   protected
      aColCompras : ColCompras;
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

{ DAOCompras }

function DAOCompras.Carregar(pObj : TObject): string;
var mCompra : Compras;
begin
   try
     try
        mCompra := Compras(pObj);
        with umDM.qCompras do
        begin
           mCompra.setModelo(FieldByName('MODELO').AsString);
           mCompra.setSerie(FieldByName('SERIE').AsString);
           mCompra.setNumero(FieldByName('NUMERO').Value);
           mCompra.setDtEmissao(FieldByName('DTEMISSAO').Value);
           mCompra.setDtChegada(FieldByName('DTCHEGADA').Value);
           mCompra.getoForn.setCodigo(FieldByName('CODFORN').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOCompras.CarregarColecao: TObject;
begin
//   Result := aColProdutos;
end;

constructor DAOCompras.CrieObj;
begin
//   aColProdutos := ColProdutos.CrieObj;
end;

destructor DAOCompras.Destrua_se;
begin
//   aColProdutos.Destrua_se;
end;

function DAOCompras.Excluir(pObj: TOBject): string;
var mSql : string;
    mCompra : Compras;
begin
   try
      mCompra := Compras(pObj);
      mSql := 'delete from compras where NUMERO =' +quotedstr(inttostr(mCompra.getNumero));
      umDM.FDTrans.StartTransaction;
      umDM.qCompras.Active := false;
      umDM.qCompras.SQL.Clear;
      umDM.qCompras.SQL.Add(mSql);
      umDM.qCompras.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOCompras.getDS: TDataSource;
begin
   Result := umDM.DSCompras;
end;

function DAOCompras.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from compras';
   if pChave <> '' then
      mSql := 'select * from compras where MODELO like' +quotedstr('%'+pChave+'%')+ 'order by MODELO;';
   umDM.qCompras.Active := false;
   umDM.qCompras.SQL.Clear;
   umDM.qCompras.SQL.Add(mSql);
   umDM.qCompras.Open;
end;

function DAOCompras.salvar(pObj: TObject): string;
var mSql: string;
    mCompra : Compras;
begin
   try
     umDM.FDTrans.StartTransaction;
     mCompra := Compras(pObj);
     with umDM.qCompras do
     begin
        if mCompra.getCodigo = 0 then
           mSql := 'insert into compras(modelo, serie, numero, dtemissao, dtchegada) values (:modelo, :serie, :numero, :dtemissao, :dtchegada)'
        else
        begin
           mSql := 'update Compras set  serie = :serie, numero = :numero, dtemissao = :dtemissao, dtchegada = :dtchegada';
           mSql := mSql + ' where modelo = :modelo;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qCompras.ParamByName('MODELO').Value := mCompra.getModelo;
        umDM.qCompras.ParamByName('SERIE').Value := mCompra.getSerie;
        umDM.qCompras.ParamByName('DTEMISSAO').Value := mCompra.getDtEmissao;
        umDM.qCompras.ParamByName('DTCHEGADA').Value := mCompra.getDtChegada;
        if mCompra.getNumero > 0 then   // <>0
           umDM.qCompras.ParamByName('NUMERO').Value := mCompra.getNumero;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
     umDM.qCompras.sql.Clear;
     umDM.qCompras.sql.add('select * from compras;');
     UMDM.qCompras.Open;
   end;
end;

end.
