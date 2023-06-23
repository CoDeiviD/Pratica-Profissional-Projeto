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
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
      function Pesquisar (pChave: string; pOBJ: TObject): integer; override;
 end;
implementation

{ CtrlContasRcb }

function CtrlContasRcb.Carregar(pPos: integer): TObject;
begin
   Result := aDaoCOntasRcb.Carregar(pPos);
end;

function CtrlContasRcb.CarregarColecao: TObject;
begin
   Result := aDAOContasRcb.CarregarColecao;
end;

constructor CtrlContasRcb.CrieObj;
begin
   aDaoContasRcb := DaoContasRcb.CrieObj;
end;

destructor CtrlContasRcb.Destrua_se;
begin
   aDaoContasRcb.Destrua_se;
end;

function CtrlContasRcb.getDS: TDataSource;
begin
   Result := aDaoContasRcb.getDS;
end;

function CtrlContasRcb.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mCRcv  : ContasRcb;
begin
   mCRcv := ContasRcb(pObj);
   if mCRcv.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlContasRcb.salvar(pObj: TObject): string;
begin
   aDaoContasRcb.Salvar(pObj);
end;

procedure CtrlContasRcb.setDM(pDM: TObject);
begin
  inherited;
   aDaoContasRcb.setDM(pDM);
end;

end.
