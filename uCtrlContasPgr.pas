unit uCtrlContasPgr;

interface
 uses uController, uContasPgr, uDaoContasPgr, Data.DB;

 type CtrlContasPgr = class(controller)
   private
   protected
      aDaoContasPgr : DaoContasPgr;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
      function Pesquisar (pChave: string; pOBJ: TObject): integer; override;
 end;
implementation

{ CtrlContasPgr }

function CtrlContasPgr.Carregar(pPos: integer): TObject;
begin
   Result := aDaoContasPgr.Carregar(pPos);
end;

function CtrlContasPgr.CarregarColecao: TObject;
begin
   Result := aDAOContasPgr.CarregarColecao;
end;

constructor CtrlContasPgr.CrieObj;
begin
   aDaoContasPgr := DaoContasPgr.CrieObj;
end;

destructor CtrlContasPgr.Destrua_se;
begin
   aDaoContasPgr.Destrua_se;
end;

function CtrlContasPgr.getDS: TDataSource;
begin
   Result := aDaoContasPgr.getDS;
end;

function CtrlContasPgr.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mCPgr  : ContasPgr;
begin
   mCPgr := ContasPgr(pObj);
   if mCPgr.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlContasPgr.salvar(pObj: TObject): string;
begin
  aDaoContasPgr.Salvar(pObj);
end;

procedure CtrlContasPgr.setDM(pDM: TObject);
begin
  inherited;
   aDaoContasPgr.setDM(pDM);
end;

end.
