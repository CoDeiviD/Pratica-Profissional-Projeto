unit uCtrlEstados;

interface
 uses uController, uEstados, uCtrlPaises, uDaoEstados, Data.DB;

 type CtrlEstados = class(controller)
   private
   protected
      aDaoEstados : DaoEstados;
      aCtrlPais : CtrlPaises;
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

{ CtrlEstados }

function CtrlEstados.Carregar(pPos: integer): TObject;
begin
   Result := aDaoEstados.Carregar(pPos);
end;

function CtrlEstados.CarregarColecao: TObject;
begin
   Result := aDaoEstados.CarregarColecao;
end;

constructor CtrlEstados.CrieObj;
begin
   aDaoEstados := DaoEstados.CrieObj;
end;

destructor CtrlEstados.Destrua_se;
begin
   aDaoEstados.Destrua_se;
end;

function CtrlEstados.getDS: TDataSource;
begin
   Result := aDaoEstados.getDS;
end;

function CtrlEstados.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mEstado  : Estados;
begin
   mEstado := Estados(pObj);
   if mEstado.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlEstados.salvar(pObj: TObject): string;
begin
   aDaoEstados.Salvar(pObj);
end;

procedure CtrlEstados.setDM(pDM: TObject);
begin
  inherited;
  aDaoEstados.setDM(pDM);
end;

end.
