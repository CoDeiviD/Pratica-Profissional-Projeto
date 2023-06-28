unit uCtrlContasRcb;

interface
 uses uController, uContasRcb, uDaoContasRcb, Data.DB;

 type CtrlContasRcb = class(controller)
   private
   protected
      aDaoContasRcb : DaoContasRcb;
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

{ CtrlContasRcb }

function CtrlContasRcb.Carregar(pOBJ: TObject): string;
begin
   Result := aDaoCOntasRcb.Carregar(pObj);
end;

constructor CtrlContasRcb.CrieObj;
begin
   aDaoContasRcb := DaoContasRcb.CrieObj;
end;

destructor CtrlContasRcb.Destrua_se;
begin
   aDaoContasRcb.Destrua_se;
end;

function CtrlContasRcb.Excluir(pObj: TOBject): string;
begin
   Result := aDaoContasRcb.Excluir(pObj);
end;

function CtrlContasRcb.getDS: TDataSource;
begin
   Result := aDaoContasRcb.getDS;
end;

function CtrlContasRcb.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mCRcv  : ContasRcb;
begin
   Result := aDaoContasRcb.Pesquisar(pChave);

end;

function CtrlContasRcb.salvar(pObj: TObject): string;
begin
   Result := aDaoContasRcb.Salvar(pObj);
end;

procedure CtrlContasRcb.setDM(pDM: TObject);
begin
  inherited;
   aDaoContasRcb.setDM(pDM);
end;

end.
