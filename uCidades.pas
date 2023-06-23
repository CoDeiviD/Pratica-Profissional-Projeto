unit uCidades;

interface
  uses uPai, uEstados;
   type
         Cidades = class(Pai)
    private
    protected
       Codigo : integer;
       Cidade  : string[40];
       DDD : string[3];
       oEstado   : Estados;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo: integer; pCidade, pDDD: String; poEstado: integer);
      destructor Destrua_se;
      procedure setCodigo(pCodigo: integer);
      procedure setCidade(pCidade:string);
      procedure setDDD(pDDD:string);
      procedure setoEstado(poEstado:estados);
      function getCodigo: integer;
      function getCidade: string;
      function getDDD: string;
      function getoEstado : Estados;
      function clone : Cidades;
end;
implementation

{ Cidades }

function Cidades.clone: Cidades;
begin
   Result := Cidades.CrieInit(codigo,Cidade,DDD,oEstado.getCodigo);
end;

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

function Cidades.getCodigo: integer;
begin
   Result := Codigo;
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

procedure Cidades.setCodigo(pCodigo: integer);
begin
   Codigo := pCodigo;
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
