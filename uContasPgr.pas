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
       oForn   : Fornecedores;
    public
      constructor CrieObj;
      constructor CrieInit(pValor, pVPago: double; pDtVencimento, pDtPagamento: TDateTime; poForn: string);
      destructor Destrua_se;
      procedure setValor(pValor:double);
      procedure setDtVencimento(pDtVencimento:TDateTime);
      procedure setDtPagamento(pDtPagamento:TDateTime);
      procedure setVPago(pVPago:double);
      procedure setoForn(poForn:Fornecedores);
      function getValor: double;
      function getDtVencimento: TDateTime;
      function getDtPagamento: TDateTime;
      function getVPago: double;
      function getoForn : Fornecedores;
end;
implementation

{ ContasPgr }

constructor ContasPgr.CrieInit(pValor, pVPago: double;
  pDtVencimento, pDtPagamento: TDateTime; poForn: string);
begin
   Valor  := pValor;
   DtVencimento := pDtVencimento;
   DtPagamento := pDtPagamento;
   VPago  := pVPago;
   oForn   := Fornecedores.CrieInit(poForn,'','','','',00/00/00,0,0);
end;

constructor ContasPgr.CrieObj;
begin
   Valor := 0.00;
   DtVencimento := 00/00/00;
   DtPagamento := 00/00/00;
   VPago := 0.00;
   oForn := Fornecedores.CrieObj;
end;

destructor ContasPgr.Destrua_se;
begin
   oForn.Destrua_se;
end;

function ContasPgr.getDtPagamento: TDateTime;
begin
   Result := DtPagamento;
end;

function ContasPgr.getDtVencimento: TDateTime;
begin
   Result := DtVencimento;
end;

function ContasPgr.getoForn: Fornecedores;
begin
   Result := oForn;
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

procedure ContasPgr.setoForn(poForn: Fornecedores);
begin
   oForn := poForn;
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
