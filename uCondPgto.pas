unit uCondPgto;

interface
   uses uPai;
   type
        CondPgto = class
   private
   protected
       Prazo : TDate;
       FormaPgto  : string;
       Percent : double;
       TotValor  : double;
     public
        constructor CrieObj;
        constructor CrieInit(pPrazo: TDate; pFormaPgto: String; pPercent, pTotValor: double);
        destructor Destrua_se;
        procedure setPrazo(pPrazo:TDate);
        procedure setFormaPgto(pFormaPgto:string);
        procedure setPercent(pPercent:double);
        procedure setTotValor(pTotValor:double);
        function getPrazo: TDate;
        function getFormaPgto: string;
        function getPercent : double;
        function getTotValor : double;
        function clone : CondPgto;
        end;
implementation

{ CondPgto }

function CondPgto.clone: CondPgto;
begin
   Result := CondPgto.CrieInit(Prazo,FormaPgto,Percent,TotValor);
end;

constructor CondPgto.CrieInit(pPrazo: TDate; pFormaPgto: String; pPercent,
  pTotValor: double);
begin
   Prazo := pPrazo;
   FormaPgto := pFormaPgto;
   Percent := pPercent;
   TotValor := pTotValor;
end;

constructor CondPgto.CrieObj;
begin
   Prazo := 01/01/2000;
   FormaPgto := ' ';
   Percent := 0;
   TotValor := 000.00;
end;

destructor CondPgto.Destrua_se;
begin

end;

function CondPgto.getFormaPgto: string;
begin
   Result := FormaPgto;
end;

function CondPgto.getPercent: double;
begin
   Result := Percent;
end;

function CondPgto.getPrazo: TDate;
begin
   Result := Prazo;
end;

function CondPgto.getTotValor: double;
begin
   Result := TotValor;
end;

procedure CondPgto.setFormaPgto(pFormaPgto: string);
begin
   FormaPgto := pFormaPgto;
end;

procedure CondPgto.setPercent(pPercent: double);
begin
   Percent := pPercent
end;

procedure CondPgto.setPrazo(pPrazo: TDate);
begin
   Prazo := pPrazo;
end;

procedure CondPgto.setTotValor(pTotValor: double);
begin
   TotValor := pTotValor;
end;

end.
