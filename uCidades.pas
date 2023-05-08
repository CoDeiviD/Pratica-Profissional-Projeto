unit uCidades;

interface
  uses uPai, uEstados;
   type
         Cidades = class(Pai)
    private
    protected
       Cidade  : string[40];
       DDD : string[3];
       oEstado   : Estados;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo: integer; pCidade, pDDD: String; poEstado: integer);
      destructor Destrua_se;
      procedure setCidade(pCidade:string);
      procedure setDDD(pDDD:string);
      procedure setoEstado(poEstado:estados);
      function getCidade: string;
      function getDDD: string;
      function getoEstado : Estados;
end;
implementation

{ Cidades }

constructor Cidades.CrieInit(pCodigo: integer; pCidade, pDDD: String;
  poEstado: integer);
begin
   codigo := pCodigo;
   cidade := pCidade;
   DDD := pDDD;
   oEstado := Estados.CrieInit(poEstado,'','',0);
end;

constructor Cidades.CrieObj;
begin
   codigo := 0;
   Cidade := '';
   DDD := '';
   oEstado := Estados.CrieObj;
end;

destructor Cidades.Destrua_se;
begin
   oEstado.Destrua_se;
end;

function Cidades.getCidade: string;
begin
   Result := Cidade;
end;

function Cidades.getDDD: string;
begin
   Result := DDD;
end;

function Cidades.getoEstado: Estados;
begin
   Result := oEstado;
end;

procedure Cidades.setCidade(pCidade: string);
begin
   Cidade := pCidade;
end;

procedure Cidades.setDDD(pDDD: string);
begin
   DDD := pDDD;
end;

procedure Cidades.setoEstado(poEstado: estados);
begin
   oEstado := poEstado;
end;

end.
