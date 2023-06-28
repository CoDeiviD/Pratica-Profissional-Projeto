unit uContasRcb;

interface
  uses uPai, uCliente;
   type
         ContasRcb = class(Pai)
    private
    protected
       Valor  : double;
       DtVencimento : TDateTime;
       DtPagamento : TDateTime;
       VReceb : double;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pValor, pVReceb: double; pDtVencimento, pDtPagamento: TDateTime);
      destructor Destrua_se;
      procedure setValor(pValor:double);
      procedure setDtVencimento(pDtVencimento:TDateTime);
      procedure setDtPagamento(pDtPagamento:TDateTime);
      procedure setVReceb(pVReceb:double);
      function getValor: double;
      function getDtVencimento: TDateTime;
      function getDtPagamento: TDateTime;
      function getVReceb: double;
      function clone : ContasRcb;
end;
implementation

{ ContasRcb }

function ContasRcb.clone: ContasRcb;
begin
   Result := ContasRcb.CrieInit(codigo,Valor,DtVencimento,DtPagamento,VReceb);
end;

constructor ContasRcb.CrieInit(pCodigo : integer; pValor, pVReceb: double;
  pDtVencimento, pDtPagamento: TDateTime);
begin
   Valor  := pValor;
   DtVencimento := pDtVencimento;
   DtPagamento := pDtPagamento;
   VReceb  := pVReceb;
end;

constructor ContasRcb.CrieObj;
begin
   Valor := 0.00;
   DtVencimento := 00/00/00;
   DtPagamento := 00/00/00;
   VReceb := 0.00;
end;

destructor ContasRcb.Destrua_se;
begin
end;

function ContasRcb.getDtPagamento: TDateTime;
begin
   Result := DtPagamento;
end;

function ContasRcb.getDtVencimento: TDateTime;
begin
   Result := DtVencimento;
end;

function ContasRcb.getValor: double;
begin
   Result := Valor;
end;

function ContasRcb.getVReceb: double;
begin
   Result := VReceb;
end;

procedure ContasRcb.setDtPagamento(pDtPagamento: TDateTime);
begin
   DtPagamento := pDtPagamento;
end;

procedure ContasRcb.setDtVencimento(pDtVencimento: TDateTime);
begin
   DtVencimento := pDtVencimento;
end;

procedure ContasRcb.setValor(pValor: double);
begin
   Valor := pValor;
end;

procedure ContasRcb.setVReceb(pVReceb: double);
begin
   VReceb := pVReceb;
end;

end.
