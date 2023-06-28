unit uColClientes;

interface
 uses uColecoes, uCliente;
  type ColClientes = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColClientes }

procedure ColClientes.LerArq;
begin

end;

function ColClientes.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Clientes(item[k]).getNome) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Clientes(item[k]).getNome then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Clientes(item[k]).getNome then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColClientes.SalvarArq;
begin

end;

end.
