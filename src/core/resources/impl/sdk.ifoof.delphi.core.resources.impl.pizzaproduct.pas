unit sdk.ifoof.delphi.core.resources.impl.pizzaproduct;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TPizzaProduct = class(TInterfacedObject, iPizzaProduct)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iPizzaProduct>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iPizzaProduct;
    function CreatePizza: iPizzaProduct;
    function ListPizzas: iPizzaProduct;
    function LinkPizzaToCategory: iPizzaProduct;
    function UnLinkPizzaFromCategory: iPizzaProduct;
    function UpdatePizza: iPizzaProduct;
    function UpdatePizzasStatus: iPizzaProduct;
    function BatchUpdatePizzasPricesByPDV: iPizzaProduct;
    function BatchUpdatePizzasPrices: iPizzaProduct;
    function Parameters: iParameters<iPizzaProduct>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TPizzaProduct.BatchUpdatePizzasPrices: iPizzaProduct;
begin
  Result := Self;
end;

function TPizzaProduct.BatchUpdatePizzasPricesByPDV: iPizzaProduct;
begin
  Result := Self;
end;

function TPizzaProduct.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TPizzaProduct.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TPizzaProduct.CreatePizza: iPizzaProduct;
begin
  Result := Self;
end;

destructor TPizzaProduct.Destroy;
begin

  inherited;
end;

function TPizzaProduct.LinkPizzaToCategory: iPizzaProduct;
begin
  Result := Self;
end;

function TPizzaProduct.ListPizzas: iPizzaProduct;
begin
  Result := Self;
end;

class function TPizzaProduct.New(Catalog: iCatalog): iPizzaProduct;
begin
  Result := Self.Create(Catalog);
end;

function TPizzaProduct.Parameters: iParameters<iPizzaProduct>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iPizzaProduct>.New(Self);
  Result := FParameters;
end;

function TPizzaProduct.UnLinkPizzaFromCategory: iPizzaProduct;
begin
  Result := Self;
end;

function TPizzaProduct.UpdatePizza: iPizzaProduct;
begin
  Result := Self;
end;

function TPizzaProduct.UpdatePizzasStatus: iPizzaProduct;
begin
  Result := Self;
end;

end.
