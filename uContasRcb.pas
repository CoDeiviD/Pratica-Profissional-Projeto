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
       oCliente   : Clientes;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer; pValor, pVReceb: double; pDtVencimento, pDtPagamento: TDateTime; poCliente: string);
      destructor Destrua_se;
      procedure setValor(pValor:double);
      procedure setDtVencimento(pDtVencimento:TDateTime);
      procedure setDtPagamento(pDtPagamento:TDateTime);
      procedure setVReceb(pVReceb:double);
      procedure setoCliente(poCliente:Clientes);
      function getValor: double;
      function getDtVencimento: TDateTime;
      function getDtPagamento: TDateTime;
      function getVReceb: double;
      function getoCliente : Clientes;
end;
implementation

{ ContasRcb }

constructor ContasRcb.CrieInit(pCodigo : integer; pValor, pVReceb: double;
  pDtVencimento, pDtPagamento: TDateTime; poCliente: string);
begin
//  inherited;
   Valor  := pValor;
   DtVencimento := pDtVencimento;
   DtPagamento := pDtPagamento;
   VReceb  := pVReceb;
//   oCliente := Clientes.CrieInit(poCliente,'','','','',00/00/00,0,False);
end;

constructor ContasRcb.CrieObj;
begin
  inherited;
   Valor := 0.00;
   DtVencimento := 00/00/00;
   DtPagamento := 00/00/00;
   VReceb := 0.00;
   oCliente := Clientes.CrieObj;
end;

destructor ContasRcb.Destrua_se;
begin
   oCliente.Destrua_se;
end;

function ContasRcb.getDtPagamento: TDateTime;
begin
   Result := DtPagamento;
end;

function ContasRcb.getDtVencimento: TDateTime;
begin
   Result := DtVencimento;
end;

function ContasRcb.getoCliente: Clientes;
begin
   Result := oCliente;
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

procedure ContasRcb.setoCliente(poCliente: Clientes);
begin
   oCliente := poCliente;
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
