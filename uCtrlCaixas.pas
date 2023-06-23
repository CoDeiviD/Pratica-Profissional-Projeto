unit uCtrlCaixas;

interface
 uses uController, uCaixas, uDaoCaixas, Data.DB;

 type CtrlCaixas = class(controller)
   private
   protected
      aDaoCaixas : DaoCaixas;
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

{ CtrlCaixas }

function CtrlCaixas.Carregar(pPos: integer): TObject;
begin
   Result := aDaoCaixas.Carregar(pPos);
end;

function CtrlCaixas.CarregarColecao: TObject;
begin
   Result := aDAOCaixas.CarregarColecao;
end;

constructor CtrlCaixas.CrieObj;
begin
   aDaoCaixas := DaoCaixas.CrieObj;
end;

destructor CtrlCaixas.Destrua_se;
begin
   aDaoCaixas.Destrua_se;
end;

function CtrlCaixas.getDS: TDataSource;
begin
   Result := aDaoCaixas.getDS;
end;

function CtrlCaixas.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mCaixa  : Caixas;
begin
   mCaixa := Caixas(pObj);
   if mCaixa.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlCaixas.salvar(pObj: TObject): string;
begin
   aDaoCaixas.Salvar(pObj);
end;

procedure CtrlCaixas.setDM(pDM: TObject);
begin
  inherited;
  aDaoCaixas.setDM(pDM);
end;

end.
