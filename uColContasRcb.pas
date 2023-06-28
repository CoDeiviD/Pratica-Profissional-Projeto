unit uColContasRcb;

interface
 uses uColecoes, uContasRcb;
  type ColContasRcb = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: double; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColContasRcb }

procedure ColContasRcb.LerArq;
begin

end;

function ColContasRcb.Pesquisar(pChave: double; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > ContasRcb(item[k]).getVReceb) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = ContasRcb(item[k]).getVReceb then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = ContasRcb(item[k]).getVReceb then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColContasRcb.SalvarArq;
begin

end;

end.
