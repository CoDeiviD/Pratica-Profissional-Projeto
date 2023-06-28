unit uContasPgr;

interface
  uses uPai, uFornecedor;
   type
         ContasPgr = class(Pai)
    private
    protected
       Valor  : double;
       DtVencimento : TDateTime;
       DtPagamento : TDateTime;
       VPago : double;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pValor, pVPago: double; pDtVencimento, pDtPagamento: TDateTime);
      destructor Destrua_se;
      procedure setValor(pValor:double);
      procedure setDtVencimento(pDtVencimento:TDateTime);
      procedure setDtPagamento(pDtPagamento:TDateTime);
      procedure setVPago(pVPago:double);
      function getValor: double;
      function getDtVencimento: TDateTime;
      function getDtPagamento: TDateTime;
      function getVPago: double;
      function clone : ContasPgr;
end;
implementation

{ ContasPgr }

function ContasPgr.clone: ContasPgr;
begin
   Result := ContasPgr.CrieInit(codigo,Valor,VPago,DtVencimento,DtPagamento);
end;

constructor ContasPgr.CrieInit(pCodigo : integer; pValor, pVPago: double;
  pDtVencimento, pDtPagamento: TDateTime);
begin
   Valor  := pValor;
   DtVencimento := pDtVencimento;
   DtPagamento := pDtPagamento;
   VPago  := pVPago;
end;

constructor ContasPgr.CrieObj;
begin
   Valor := 0.00;
   DtVencimento := 00/00/00;
   DtPagamento := 00/00/00;
   VPago := 0.00;
end;

destructor ContasPgr.Destrua_se;
begin
end;

function ContasPgr.getDtPagamento: TDateTime;
begin
   Result := DtPagamento;
end;

function ContasPgr.getDtVencimento: TDateTime;
begin
   Result := DtVencimento;
end;

function ContasPgr.getValor: double;
begin
   Result := Valor;
end;

function ContasPgr.getVPago: double;
begin
   Result := VPago;
end;

procedure ContasPgr.setDtPagamento(pDtPagamento: TDateTime);
begin
   DtPagamento := pDtPagamento;
end;

procedure ContasPgr.setDtVencimento(pDtVencimento: TDateTime);
begin
   DtVencimento := pDtVencimento;
end;

procedure ContasPgr.setValor(pValor: double);
begin
   Valor := pValor;
end;

procedure ContasPgr.setVPago(pVPago: double);
begin
   VPago := VPago;
end;

end.
