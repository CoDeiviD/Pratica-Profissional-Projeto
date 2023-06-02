unit uColContasPgr;

interface
 uses uColecoes, uContasPgr;
  type ColContasPgr = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: double; pQuero: boolean): integer; overload;
     function Pesquisar(pChave: integer; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColContasPgr }

procedure ColContasPgr.LerArq;
begin

end;

function ColContasPgr.Pesquisar(pChave: double; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > ContasPgr(item[k]).getVPago) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = ContasPgr(item[k]).getVPago then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = ContasPgr(item[k]).getVPago then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

function ColContasPgr.Pesquisar(pChave: integer; pQuero: boolean): integer;
begin

end;

procedure ColContasPgr.SalvarArq;
begin

end;

end.
