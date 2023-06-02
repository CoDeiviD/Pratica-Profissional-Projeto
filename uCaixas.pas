unit uCaixas;

interface
  uses uPai;
   type
         Caixas = class(Pai)
    private
    protected
       Data  : TDate;
       Historico : string[45];
       Entrada : double;
       Saida  : double;
       Saldo  : double;
       SaldoTotal   : double;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo: integer; pData: TDate; pHistorico: String; pEntrada, pSaida, pSaldo, pSaldoTotal: double);
      destructor Destrua_se;
      procedure setData(pData:TDate);
      procedure setHistorico(pHistorico:string);
      procedure setEntrada(pEntrada:double);
      procedure setSaida(pSaida:double);
      procedure setSaldo(pSaldo:double);
      procedure setSaldoTot(pSaldoTot:double);
      function getData: TDate;
      function getHistorico: string;
      function getEntrada: double;
      function getSaida: double;
      function getSaldo: double;
      function getSaldoTot : double;
end;
implementation

{ Caixas }

constructor Caixas.CrieInit(pCodigo: integer; pData: TDate; pHistorico: String;
  pEntrada, pSaida, pSaldo, pSaldoTotal: double);
begin
   Data  := pData;
   Historico := pHistorico;
   Entrada := pEntrada;
   Saida  := pSaida;
   Saldo  := pSaldo;
   SaldoTotal   := pSaldoTotal;
end;

constructor Caixas.CrieObj;
begin
   Data  := 00/00/00;
   Historico := '';
   Entrada := 0.00;
   Saida  := 0.00;
   Saldo  := 0.00;
   SaldoTotal   := 0.00;
end;

destructor Caixas.Destrua_se;
begin

end;

function Caixas.getData: TDate;
begin
   Result := Data;
end;

function Caixas.getEntrada: double;
begin
   Result := Entrada;
end;

function Caixas.getHistorico: string;
begin
   Result := Historico;
end;

function Caixas.getSaida: double;
begin
   Result := Saida;
end;

function Caixas.getSaldo: double;
begin
   Result := Saldo;
end;

function Caixas.getSaldoTot: double;
begin
   Result := SaldoTotal;
end;

procedure Caixas.setData(pData: TDate);
begin
   Data := pData;
end;

procedure Caixas.setEntrada(pEntrada: double);
begin
   Entrada := pEntrada;
end;

procedure Caixas.setHistorico(pHistorico: string);
begin
   Historico := pHistorico;
end;

procedure Caixas.setSaida(pSaida: double);
begin
   Saida := pSaida;
end;

procedure Caixas.setSaldo(pSaldo: double);
begin
   Saldo := pSaldo;
end;

procedure Caixas.setSaldoTot(pSaldoTot: double);
begin
   SaldoTotal := pSaldoTot;
end;

end.
