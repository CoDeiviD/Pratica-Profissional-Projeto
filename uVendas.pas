unit uVendas;

interface
   uses uPai, uCliente, uCondPgto;
   type
         Vendas = class(Pai)
    private
    protected
       DtVenda : TDate;
       oCodClie : Clientes;
       Obs : string;
       aCondPgto: CondPgto;
    public
        constructor CrieObj;
        constructor CrieInit(pCodigo: integer; pDtVenda: TDate; pObs: String; poCodClie: integer; paCondP: string);
        destructor Destrua_se;
        procedure setDtVenda(pDtVenda:TDate);
        procedure setObs(pObs:string);
        procedure setoCodClie(poCodClie:Clientes);
        procedure setaCondP(paCondP: CondPgto);
        function getDtVenda : TDate;
        function getObs: string;
        function getoCodClie : Clientes;
        function getaCondP: CondPgto;
        function clone: Vendas;
     end;
implementation

{ Vendas }

function Vendas.clone: Vendas;
begin
   //Result := CondPgto.CrieInit(Codigo,Obs,DtVenda,oCodClie.getCodigo);
end;

constructor Vendas.CrieInit(pCodigo: integer; pDtVenda: TDate; pObs: String; poCodClie: integer;
  paCondP: string);
begin
   Codigo := pCodigo;
   DtVenda := pDtVenda;
   Obs := pObs;
   oCodClie := Clientes.CrieInit(poCodClie,'','','','','','','','','',0,0);
   aCondPgto := CondPgto.CrieInit(0,paCondP,0,0);
end;

constructor Vendas.CrieObj;
begin
   Codigo := 0;
   DtVenda := 01/01/2000;
   Obs := ' ';
   oCodClie := Clientes.CrieObj;
   aCondPgto := CondPgto.CrieObj;
end;

destructor Vendas.Destrua_se;
begin
   oCodClie.Destrua_se;
   aCondPgto.Destrua_se;
end;

function Vendas.getaCondP: CondPgto;
begin
   Result := aCondPgto;
end;

function Vendas.getDtVenda: TDate;
begin
   Result := DtVenda;
end;

function Vendas.getObs: string;
begin
   Result := Obs;
end;

function Vendas.getoCodClie: Clientes;
begin
   Result := oCodClie;
end;

procedure Vendas.setaCondP(paCondP: CondPgto);
begin
   aCondPgto := paCondP;
end;

procedure Vendas.setDtVenda(pDtVenda: TDate);
begin
   DtVenda := pDtVenda;
end;

procedure Vendas.setObs(pObs: string);
begin
   Obs := pObs;
end;

procedure Vendas.setoCodClie(poCodClie: Clientes);
begin
   oCodClie := poCodClie;
end;

end.
