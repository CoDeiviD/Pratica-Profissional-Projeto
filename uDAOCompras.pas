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
           mCompra.setCodigo(FieldByName('CODCOMPRA').Value);
           mCompra.setModelo(FieldByName('MODELO').AsString);
           mCompra.setSerie(FieldByName('SERIE').AsString);
           mCompra.setNumero(FieldByName('NUMERO').Value);
           mCompra.setDtEmissao(FieldByName('DTEMISSAO').Value);
           mCompra.setDtChegada(FieldByName('DTCHEGADA').Value);
           mCompra.setQtde(FieldByName('QTDE').Value);
           mCompra.setVCusto(FieldByName('VCUSTO').Value);
           mCompra.setDesconto(FieldByName('DESCONTO').Value);
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
      mSql := 'delete from compras where codCompra =' +quotedstr(inttostr(mCompra.getCodigo));
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
      mSql := 'select * from compras where TpProduto like' +quotedstr('%'+pChave+'%')+ 'order by TpProduto;';
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
           mSql := 'insert into compras(codcompra, modelo, serie, numero, dtemissao, dtchegada, qtde, vcusto, desconto) values (:codcompra, :modelo, :serie, :numero, :dtemissao, :dtchegada, :qtde, :vcusto, :desconto)'
        else
        begin
           mSql := 'update Compras set modelo = :modelo, serie = :serie, numero = :numero, dtemissao = :dtemissao, dtchegada = :dtchegada, qtde = :qtde, vcusto = :vcusto, desconto = :desconto';
           mSql := mSql + ' where codCompra = :CodCompra;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qCompras.ParamByName('MODELO').Value := mCompra.getModelo;
        umDM.qCompras.ParamByName('SERIE').Value := mCompra.getSerie;
        umDM.qCompras.ParamByName('NUMERO').Value := mCompra.getNumero;
        umDM.qCompras.ParamByName('DTEMISSAO').Value := mCompra.getDtEmissao;
        umDM.qCompras.ParamByName('DTCHEGADA').Value := mCompra.getDtChegada;
        umDM.qCompras.ParamByName('QTDE').Value := mCompra.getQtde;
        umDM.qCompras.ParamByName('VCUSTO').Value := mCompra.getVCusto;
        umDM.qCompras.ParamByName('DESCONTO').Value := mCompra.getDesconto;
        if mCompra.getCodigo > 0 then   // <>0
           umDM.qCompras.ParamByName('CODCOMPRA').Value := mCompra.getCodigo;
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
