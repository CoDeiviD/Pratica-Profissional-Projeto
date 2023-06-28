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
      function Carregar(pOBJ: TObject): string;    override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlContasPgr }

function CtrlContasPgr.Carregar(pOBJ: TObject): string;
begin
   Result := aDaoContasPgr.Carregar(pObj);
end;

constructor CtrlContasPgr.CrieObj;
begin
   aDaoContasPgr := DaoContasPgr.CrieObj;
end;

destructor CtrlContasPgr.Destrua_se;
begin
   aDaoContasPgr.Destrua_se;
end;

function CtrlContasPgr.Excluir(pObj: TOBject): string;
begin
   Result := aDaoContasPgr.Excluir(pObj);
end;

function CtrlContasPgr.getDS: TDataSource;
begin
   Result := aDaoContasPgr.getDS;
end;

function CtrlContasPgr.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mCPgr  : ContasPgr;
begin
   Result := aDaoContasPgr.Pesquisar(pChave);

end;

function CtrlContasPgr.salvar(pObj: TObject): string;
begin
  Result := aDaoContasPgr.Salvar(pObj);
end;

procedure CtrlContasPgr.setDM(pDM: TObject);
begin
  inherited;
   aDaoContasPgr.setDM(pDM);
end;

end.
