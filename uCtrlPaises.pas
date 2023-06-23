unit uCtrlPaises;

interface
 uses uController, uPaises, uDaoPaises, Data.DB;

 type CtrlPaises = class(controller)
   private
   protected
      aDaoPaises : DaoPaises;
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

{ CtrlPaises }

function CtrlPaises.Carregar(pPos : integer): TObject;
begin
   Result := aDaoPaises.Carregar(pPos);
end;

function CtrlPaises.CarregarColecao: TObject;
begin
   Result := aDAOPaises.CarregarColecao;
end;

constructor CtrlPaises.CrieObj;
begin
   aDaoPaises := DaoPaises.CrieObj;
end;

destructor CtrlPaises.Destrua_se;
begin
   aDaoPaises.Destrua_se;
end;

function CtrlPaises.getDS: TDataSource;
begin
   Result := aDaoPaises.getDS;
end;

function CtrlPaises.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mPais  : Paises;
begin
   mPais := Paises(pObj);
   if mPais.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlPaises.salvar(pObj: TObject): string;
begin
   aDaoPaises.Salvar(pObj);
end;

procedure CtrlPaises.setDM(pDM: TObject);
begin
  inherited;
   aDaoPaises.setDM(pDM);
end;

end.
