unit uDAOEstados;

interface
 uses uDao, uDM, uColEstados, uEstados, Data.DB;

 type DAOEstados = class(DAO)
   private
   protected
      aColEstados : ColEstados;
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

{ DAOPaises }

function DAOEstados.Carregar(pObj : TObject): string;
var mEstado : Estados;
begin
   try
     try
        mEstado := Estados(pObj);
        with umDM.qEstados do
        begin
           mEstado.setCodigo(FieldByName('CODESTADO').Value);
           mEstado.setEstado(FieldByName('ESTADO').AsString);
           mEstado.setUF(FieldByName('UF').AsString);
           mEstado.getoPais.setCodigo(FieldByName('CODPAIS').Value);
           result := '';
        end;
     except on e:exception do
        Result := 'Erro ao carregar: '+E.Message;
     end;
   finally

   end;
end;

function DAOEstados.CarregarColecao: TObject;
begin

end;

constructor DAOEstados.CrieObj;
begin

end;

destructor DAOEstados.Destrua_se;
begin

end;

function DAOEstados.Excluir(pObj: TOBject): string;
var mSql : string;
    mEstado : Estados;
begin
   try
      mEstado := Estados(pObj);
      mSql := 'delete from estados where codEstado =' +quotedstr(inttostr(mEstado.getCodigo));
      umDM.FDTrans.StartTransaction;
      umDM.qEstados.Active := false;
      umDM.qEstados.SQL.Clear;
      umDM.qEstados.SQL.Add(mSql);
      umDM.qEstados.Open;
      umDM.FDTrans.Commit;
      Result := '';
    except on e:Exception do
   begin
      umDM.FDTrans.Rollback;
      Result := 'Erro ao excluir: '+e.Message;
   end;

   end;
end;

function DAOEstados.getDS: TDataSource;
begin
   Result := umDM.DsEstados;
end;

function DAOEstados.Pesquisar(pChave: string): string;
var mSql : string;
begin
   mSql := 'select * from estados';
   if pChave <> '' then
      mSql := 'select * from estados where Estado like' +quotedstr('%'+pChave+'%')+ 'order by Estado;';
   umDM.qEstados.Active := false;
   umDM.qEstados.SQL.Clear;
   umDM.qEstados.SQL.Add(mSql);
   umDM.qEstados.Open;
end;

function DAOEstados.salvar(pObj: TObject): string;
var mSql: string;
    mEstados : Estados;
begin
   try
     umDM.FDTrans.StartTransaction;
     mEstados := Estados(pObj);
     with umDM.qEstados do
     begin
        if mEstados.getCodigo = 0 then
           mSql := 'insert into Estados(estado, UF, codPais) values (:estado, :UF, :codPais)'
        else
        begin
           mSql := 'update Estados set estado = :Estado, UF = :UF, CODPAIS = :CODPAIS';
           mSql := mSql + ' where codEstado = :CodEstado;';
        end;
        SQL.Clear;
        SQL.Add(mSql);
        ParamByName('ESTADO').Value := mEstados.getEstado;
        ParamByName('UF').Value := mEstados.getUF;
        ParamByName('CODPAIS').Value := mEstados.getoPais.getCodigo;
        if mEstados.getCodigo > 0 then   // <>0
           ParamByName('CODESTADO').Value := mEstados.getCodigo;
        ExecSQL;
     end;
     umDM.FDTrans.Commit;
   except
     umDM.FDTrans.Rollback;
   end;
end;

end.
