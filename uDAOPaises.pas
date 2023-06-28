unit uDAOPaises;

interface
 uses uDao, uDM, uColPaises, uPaises, Data.DB;

 type DAOPaises = class(DAO)
   private
   protected
      aColPaises : ColPaises;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string;     override;
      function CarregarColecao: TObject;           override;
      function Carregar(pObj : TObject): string;  override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;  override;
 end;
implementation

uses
  System.SysUtils;

{ DAOPaises }

function DAOPaises.Carregar(pObj : TObject): string;
var mPais : Paises;
begin
   try
     try
        mPais := Paises(pObj);
        with umDM.qPaises do
        begin
           mPais.setCodigo(FieldByName('CODPAIS').Value);
           mPais.setPais(FieldByName('Pais').AsString);
           mPais.setDdi(FieldByName('DDI').AsString);
           mPais.setSigla(FieldByName('SIGLA').AsString);
           mPais.setMoeda(FieldByName('MOEDA').AsString);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOPaises.CarregarColecao: TObject;
begin

end;

constructor DAOPaises.CrieObj;
begin

end;

destructor DAOPaises.Destrua_se;
begin

end;

function DAOPaises.Excluir(pObj: TOBject): string;
var mSql : string;
    mPais : Paises;
begin
   try
      mPais := Paises(pObj);
      mSql := 'delete from paises where codPais =' +quotedstr(inttostr(mPais.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qPaises.Active := false;
      umDM.qPaises.SQL.Clear;
      umDM.qPaises.SQL.Add(mSql);
      umDM.qPaises.Open;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;


function DAOPaises.getDS: TDataSource;
begin
   Result := umDM.DsPaises;
end;

function DAOPaises.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from paises';
   if pChave <> '' then
      mSql := 'select * from paises where Pais like' +quotedstr('%'+pChave+'%')+ 'order by Pais;';
   umDM.qPaises.Active := false;
   umDM.qPaises.SQL.Clear;
   umDM.qPaises.SQL.Add(mSql);
   umDM.qPaises.Open;
end;

function DAOPaises.salvar(pObj: TObject): string;
var mSql: string;
    mPaises : Paises;
begin
   try
     umDM.FDTrans.StartTransaction;
     mPaises := Paises(pObj);
     with umDM.qPaises do
     begin
        if mPaises.getCodigo = 0 then
           mSql := 'insert into paises(pais, ddi, sigla, moeda) values (:Pais, :ddi, :sigla, :moeda)'
        else
        begin
           mSql := 'update Paises set Pais = :Pais, ddi = :ddi, sigla = :sigla, moeda = :moeda';
           mSql := mSql + ' where codPais = :CodPais;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        ParamByName('PAIS').Value := mPaises.getPais;
        ParamByName('DDI').Value := mPaises.getDDI;
        ParamByName('SIGLA').Value := mPaises.getSigla;
        ParamByName('MOEDA').Value := mPaises.getMoeda;
        if mPaises.getCodigo > 0 then   // <>0
           ParamByName('CODPAIS').Value := mPaises.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
