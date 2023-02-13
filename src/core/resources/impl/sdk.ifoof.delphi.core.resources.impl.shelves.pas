unit sdk.ifoof.delphi.core.resources.impl.shelves;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.impl.aislegroup,
  sdk.ifoof.delphi.core.resources.aisle,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TShelves = class(TInterfacedObject, iShelves)
  private
    FAisle: iAisle;
    FAisleGroup: iAisleGroup;
    FParameters: iParameters<iShelves>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iShelves;
    function CreateShelves: iShelves;
    function GetShelves: iShelves;
    function EditShelf: iShelves;
    function DeleteShelf: iShelves;
    function GetShelfProductByEan: iShelves;
    function LinkProductToShelf: iShelves;
    function CreateShelfProduct: iShelves;
    function EditShelfProduct: iShelves;
    function UpdateSellingOptionByMerchant: iShelves;
    function MigrateCatalogTagAndCombo: iShelves;
    function CreatesSMMigrationCatalog: iShelves;
    function Aisle: iAisle;
    function AisleGroup: iAisleGroup;
    function Parameters: iParameters<iShelves>;
    function &End: iShelves;
  end;

implementation

{ TMyClass }

function TShelves.Aisle: iAisle;
begin
  if not Assigned(FAisle) then
    FAisle := TAisle.New(Self);
  Result := FAisle;
end;

function TShelves.AisleGroup: iAisleGroup;
begin
  if not Assigned(FAisleGroup) then
    FAisleGroup := TAisleGroup.New(Self);
  Result := FAisleGroup;
end;

function TShelves.&End: iShelves;
begin
  Result := Self;
end;

constructor TShelves.Create;
begin

end;

function TShelves.CreateShelfProduct: iShelves;
begin
  Result := Self;
end;

function TShelves.CreateShelves: iShelves;
begin
  Result := Self;
end;

function TShelves.CreatesSMMigrationCatalog: iShelves;
begin
  Result := Self;
end;

function TShelves.DeleteShelf: iShelves;
begin
  Result := Self;
end;

destructor TShelves.Destroy;
begin

  inherited;
end;

function TShelves.EditShelf: iShelves;
begin
  Result := Self;
end;

function TShelves.EditShelfProduct: iShelves;
begin
  Result := Self;
end;

function TShelves.GetShelfProductByEan: iShelves;
begin
  Result := Self;
end;

function TShelves.GetShelves: iShelves;
begin
  Result := Self;
end;

function TShelves.LinkProductToShelf: iShelves;
begin
  Result := Self;
end;

function TShelves.MigrateCatalogTagAndCombo: iShelves;
begin
  Result := Self;
end;

class function TShelves.New: iShelves;
begin
  Result := Self.Create;
end;

function TShelves.Parameters: iParameters<iShelves>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iShelves>.New(Self);
  Result := FParameters;
end;

function TShelves.UpdateSellingOptionByMerchant: iShelves;
begin
  Result := Self;
end;

end.
