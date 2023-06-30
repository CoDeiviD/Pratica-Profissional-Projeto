unit uDAOCidades;

interface
 uses uDao, uDM, uColCidades, uCidades, Data.DB;

 type DAOCidades = class(DAO)
   private
   protected
      aColCidades : ColCidades;
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

function DAOCidades.Carregar(pObj : TObject): string;
var mCidade : Cidades;
begin
   try
     try
        mCidade := Cidades(pObj);
        with umDM.qCidades do
        begin
           mCidade.setCodigo(FieldByName('CODCIDADE').Value);
           mCidade.setCidade(FieldByName('CIDADE').AsString);
           mCidade.setDDD(FieldByName('DDD').AsString);
           mCidade.getoEstado.setCodigo(FieldByName('CODESTADO').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOCidades.CarregarColecao: TObject;
begin

end;

constructor DAOCidades.CrieObj;
begin

end;

destructor DAOCidades.Destrua_se;
begin

end;

function DAOCidades.Excluir(pObj: TOBject): string;
var mSql : string;
    mCidade : Cidades;
begin
   try
      mCidade := Cidades(pObj);
      mSql := 'delete from cidades where codCidade =' +quotedstr(inttostr(mCidade.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qCidades.Active := false;
      umDM.qCidades.SQL.Clear;
      umDM.qCidades.SQL.Add(mSql);
      umDM.qCidades.ExecSQL;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOCidades.getDS: TDataSource;
begin
   Result := umDM.DsCidades;
end;

function DAOCidades.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from cidades';
   if pChave <> '' then
      mSql := 'select * from cidades where Cidade like' +quotedstr('%'+pChave+'%')+ 'order by Cidade;';
   umDM.qCidades.Active := false;
   umDM.qCidades.SQL.Clear;
   umDM.qCidades.SQL.Add(mSql);
   umDM.qCidades.Open;
end;

function DAOCidades.salvar(pObj: TObject): string;
var mSql: string;
    mCidade : Cidades;
begin
   try
     umDM.FDTrans.StartTransaction;
     mCidade := Cidades(pObj);
     with umDM.qCidades do
     begin
        if mCidade.getCodigo = 0 then
           mSql := 'insert into cidades(cidade, ddd, codestado) values (:Cidade, :ddd, :codestado)'
        else
        begin
           mSql := 'update Cidades set Cidade = :Cidade, ddd = :ddd, codestado = :codestado';
           mSql := mSql + ' where codCidade = :CodCidade;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        umDM.qCidades.ParamByName('CIDADE').Value := mCidade.getCidade;
        umDM.qCidades.ParamByName('DDD').Value := mCidade.getDDD;
        umDM.qCidades.ParamByName('CODESTADO').Value := mCidade.getoEstado.getCodigo;
        if mCidade.getCodigo > 0 then   // <>0
           umDM.qCidades.ParamByName('CODCIDADE').Value := mCidade.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
     umDM.qCidades.SQL.Clear;
     umDM.qCidades.SQL.Add('select * from cidades;');
     umDM.qCidades.Open;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
