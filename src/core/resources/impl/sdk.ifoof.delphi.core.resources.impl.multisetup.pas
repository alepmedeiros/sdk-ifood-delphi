unit sdk.ifoof.delphi.core.resources.impl.multisetup;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TMultiSetup = class(TInterfacedObject, iMultiSetup)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iMultiSetup>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iMultiSetup;
    function CreateOrUpdateItem: iMultiSetup;
    function UpdateOptionPrice: iMultiSetup;
    function UpdateOptionStatus: iMultiSetup;
    function ListItemsWithinThatCategory: iMultiSetup;
    function DeleteCategory: iMultiSetup;
    function DeleteOptionGroup: iMultiSetup;
    function CheckIfMerchantUseTheMultisetupModule: iMultiSetup;
    function Parameters: iParameters<iMultiSetup>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TMultiSetup.CheckIfMerchantUseTheMultisetupModule: iMultiSetup;
begin
  Result := Self;
end;

function TMultiSetup.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TMultiSetup.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TMultiSetup.CreateOrUpdateItem: iMultiSetup;
begin
  Result := Self;
end;

function TMultiSetup.DeleteCategory: iMultiSetup;
begin
  Result := Self;
end;

function TMultiSetup.DeleteOptionGroup: iMultiSetup;
begin
  Result := Self;
end;

destructor TMultiSetup.Destroy;
begin

  inherited;
end;

function TMultiSetup.ListItemsWithinThatCategory: iMultiSetup;
begin
  Result := Self;
end;

class function TMultiSetup.New(Catalog: iCatalog): iMultiSetup;
begin
  Result := Self.Create(Catalog);
end;

function TMultiSetup.Parameters: iParameters<iMultiSetup>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iMultiSetup>.New(Self);
  Result := FParameters;
end;

function TMultiSetup.UpdateOptionPrice: iMultiSetup;
begin
  Result := Self;
end;

function TMultiSetup.UpdateOptionStatus: iMultiSetup;
begin
  Result := Self;
end;

end.
