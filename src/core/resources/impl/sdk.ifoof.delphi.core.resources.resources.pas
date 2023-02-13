unit sdk.ifoof.delphi.core.resources.resources;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.impl.authentication,
  sdk.ifoof.delphi.core.resources.impl.catalog,
  sdk.ifoof.delphi.core.resources.financial,
  sdk.ifoof.delphi.core.resources.groceries,
  sdk.ifoof.delphi.core.resources.impl.merchant,
  sdk.ifoof.delphi.core.resources.impl.order,
  sdk.ifoof.delphi.core.resources.review,
  sdk.ifoof.delphi.core.resources.impl.shelves,
  sdk.ifoof.delphi.core.resources.impl.shipping,
  sdk.ifoof.delphi.core.configuration.interfaces;

type
  TResources = class(TInterfacedObject, iResources)
  private
    FConfig: iConfiguration;
    FAuthentication: iAuthentication;
    FMerchant: iMerchant;
    FOrder: iOrder;
    FShipping: iShipping;
    FCatalog: iCatalog;
    FShelves: iShelves;
    FFinancial: iFinancial;
    FReview: iReview;
    FGroceries: iGroceries;
  public
    constructor Create(Config: iConfiguration);
    destructor Destroy; override;
    class function New(Config: iConfiguration): iResources;
    function authentication: iAuthentication;
    function merchant: iMerchant;
    function order: iOrder;
    function shipping: iShipping;
    function catalog: iCatalog;
    function shelves: iShelves;
    function financial: iFinancial;
    function review: iReview;
    function groceries: iGroceries;
    function &End: iResources;
  end;

implementation

{ TMyClass }

function TResources.authentication: iAuthentication;
begin
  if not Assigned(FAuthentication) then
    FAuthentication := TAuthentication.New(FConfig);
  Result := FAuthentication;
end;

function TResources.catalog: iCatalog;
begin
  if not Assigned(FCatalog) then
    FCatalog := TCatalog.New;
  Result := FCatalog;
end;

function TResources.&End: iResources;
begin
  Result := Self;
end;

constructor TResources.Create(Config: iConfiguration);
begin
  FConfig := Config;
end;

destructor TResources.Destroy;
begin

  inherited;
end;

function TResources.financial: iFinancial;
begin
  if not Assigned(FFinancial) then
    FFinancial := TFinancial.New;
  Result := FFinancial;
end;

function TResources.groceries: iGroceries;
begin
  if not Assigned(FGroceries) then
    FGroceries := TGroceries.New;
  Result := FGroceries;
end;

function TResources.merchant: iMerchant;
begin
  if not Assigned(FMerchant) then
    FMerchant := TMerchant.New;
  Result := FMerchant;
end;

class function TResources.New(Config: iConfiguration): iResources;
begin
  Result := Self.Create(Config);
end;

function TResources.order: iOrder;
begin
  if not Assigned(FOrder) then
    FOrder := TOrder.New;
  Result := FOrder;
end;

function TResources.review: iReview;
begin
  if not Assigned(FReview) then
    FReview := TReview.New;
  Result := FReview;
end;

function TResources.shelves: iShelves;
begin
  if not Assigned(FShelves) then
    FShelves := TShelves.New;
  Result := FShelves;
end;

function TResources.shipping: iShipping;
begin
  if not Assigned(FShipping) then
    FShipping := TShipping.New;
  Result := FShipping;
end;

end.
