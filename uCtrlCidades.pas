unit uCtrlCidades;

interface
 uses uController, uCidades, uDaoCidades, Data.DB;

 type CtrlCidades = class(controller)
   private
   protected
      aDaoCidades : DaoCidades;
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

{ CtrlCidades }

function CtrlCidades.Carregar(pPos: integer): TObject;
begin
   Result := aDaoCidades.Carregar(pPos);
end;

function CtrlCidades.CarregarColecao: TObject;
begin
   Result := aDAOCidades.CarregarColecao;
end;

constructor CtrlCidades.CrieObj;
begin
   aDaoCidades := DaoCidades.CrieObj;
end;

destructor CtrlCidades.Destrua_se;
begin
   aDaoCidades.Destrua_se;
end;

function CtrlCidades.getDS: TDataSource;
begin
   Result := aDaoCidades.getDS;
end;

function CtrlCidades.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mCidade  : Cidades;
begin
   mCidade := Cidades(pObj);
   if mCidade.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlCidades.salvar(pObj: TObject): string;
begin
   aDaoCidades.Salvar(pObj);
end;

procedure CtrlCidades.setDM(pDM: TObject);
begin
  inherited;
   aDaoCidades.setDM(pDM);
end;

end.
