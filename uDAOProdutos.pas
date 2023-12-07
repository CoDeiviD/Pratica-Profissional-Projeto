unit uDAOProdutos;

interface
 uses uDao, uDM, uColProdutos, uProdutos, Data.DB;

 type DAOProdutos = class(DAO)
   private
   protected
      aColProdutos : ColProdutos;
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

{ DAOProdutos }

function DAOProdutos.Carregar(pObj : TObject): string;
var mProduto : Produtos;
begin
   try
     try
        mProduto := Produtos(pObj);
        with umDM.qProdutos do
        begin
           mProduto.setCodigo(FieldByName('CODPRODUTO').Value);
           mProduto.setTpProduto(FieldByName('TPPRODUTO').AsString);
           mProduto.setSabor(FieldByName('SABOR').AsString);
           mProduto.setQtde(FieldByName('QTDE').Value);
           mProduto.setVCusto(FieldByName('VCUSTO').Value);
           mProduto.setDesconto(FieldByName('DESCONTO').Value);
           mProduto.setPreco(FieldByName('PRECO').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOProdutos.CarregarColecao: TObject;
begin
//   Result := aColProdutos;
end;

constructor DAOProdutos.CrieObj;
begin
//   aColProdutos := ColProdutos.CrieObj;
end;

destructor DAOProdutos.Destrua_se;
begin
//   aColProdutos.Destrua_se;
end;

function DAOProdutos.Excluir(pObj: TOBject): string;
var mSql : string;
    mProduto : Produtos;
begin
   try
      mProduto := Produtos(pObj);
      mSql := 'delete from produtos where codProduto =' +quotedstr(inttostr(mProduto.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qProdutos.Active := false;
      umDM.qProdutos.SQL.Clear;
      umDM.qProdutos.SQL.Add(mSql);
      umDM.qProdutos.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOProdutos.getDS: TDataSource;
begin
   Result := umDM.DSProdutos;
end;

function DAOProdutos.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from produtos';
   if pChave <> '' then
      mSql := 'select * from produtos where TpProduto like' +quotedstr('%'+pChave+'%')+ 'order by TpProduto;';
   umDM.qProdutos.Active := false;
   umDM.qProdutos.SQL.Clear;
   umDM.qProdutos.SQL.Add(mSql);
   umDM.qProdutos.Open;
end;

function DAOProdutos.salvar(pObj: TObject): string;
var mSql: string;
    mProduto : Produtos;
begin
   try
     umDM.FDTrans.StartTransaction;
     mProduto := Produtos(pObj);
     with umDM.qProdutos do
     begin
        if mProduto.getCodigo = 0 then
           mSql := 'insert into produtos(codproduto, TpProduto, sabor, qtde, vcusto, desconto, preco) values (:codproduto, :TpProduto, :sabor, :qtde, :vcusto, :desconto :preco)'
        else
        begin
           mSql := 'update Produtos set TpProduto = :TpProduto, sabor = :sabor, qtde = :qtde, vcusto = :vcusto, desconto = :desconto, preco = :preco';
           mSql := mSql + ' where codProduto = :CodProduto;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qProdutos.ParamByName('TPPRODUTO').Value := mProduto.getTpProduto;
        umDM.qProdutos.ParamByName('SABOR').Value := mProduto.getSabor;
        umDM.qProdutos.ParamByName('QTDE').Value := mProduto.getQtde;
        umDM.qProdutos.ParamByName('VCUSTO').Value := mProduto.getVCusto;
        umDM.qProdutos.ParamByName('DESCONTO').Value := mProduto.getDesconto;
        umDM.qProdutos.ParamByName('PRECO').Value := mProduto.getPreco;
        if mProduto.getCodigo > 0 then   // <>0
           umDM.qProdutos.ParamByName('CODPRODUTO').Value := mProduto.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
     umDM.qProdutos.sql.Clear;
     umDM.qProdutos.sql.add('select * from produtos;');
     UMDM.qProdutos.Open;
   end;
end;

end.
