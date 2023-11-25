unit uVendas;

interface
   uses uPai, uCliente;
   type
         Vendas = class(Pai)
    private
    protected
       DtVenda : TDate;
       codClie : Clientes;
       Historico : string; //[45];
       Entrada : double;
       QtdeVenda  : integer;
       Saldo  : double;
       SaldoTotal   : double;
    end;
implementation

end.
