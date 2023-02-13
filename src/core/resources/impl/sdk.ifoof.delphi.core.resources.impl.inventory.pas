unit sdk.ifoof.delphi.core.resources.impl.inventory;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TInventory = class(TInterfacedObject, iInventory)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iInventory>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iInventory;
    function CreateOrUptadeTheStockOfProduct: iInventory;
    function GetsTheStockOfProductForGivenOwnerId: iInventory;
    function DeletesTheStockForListOfProductsForGivenOwnerId: iInventory;
    function Parameters: iParameters<iInventory>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TInventory.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TInventory.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TInventory.CreateOrUptadeTheStockOfProduct: iInventory;
begin
  Result := Self;
end;

function TInventory.DeletesTheStockForListOfProductsForGivenOwnerId: iInventory;
begin
  Result := Self;
end;

destructor TInventory.Destroy;
begin

  inherited;
end;

function TInventory.GetsTheStockOfProductForGivenOwnerId: iInventory;
begin
  Result := Self;
end;

class function TInventory.New(Catalog: iCatalog): iInventory;
begin
  Result := Self.Create(Catalog);
end;

function TInventory.Parameters: iParameters<iInventory>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iInventory>.New(Self);
  Result := FParameters;
end;

end.
