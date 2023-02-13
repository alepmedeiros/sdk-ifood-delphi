unit sdk.ifoof.delphi.core.resources.aisle;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TAisle = class(TInterfacedObject, iAisle)
  private
    FShelves: iShelves;
    FParameters: iParameters<iAisle>;
  public
    constructor Create(Shelves: iShelves);
    destructor Destroy; override;
    class function New(Shelves: iShelves): iAisle;
    function CreateAisle: iAisle;
    function EditAisle: iAisle;
    function GetAisle: iAisle;
    function CreateAisleProductRelation: iAisle;
    function DeleteAisleProductRelation: iAisle;
    function Parameters: iParameters<iAisle>;
    function &End: iShelves;
  end;

implementation

{ TMyClass }

function TAisle.&End: iShelves;
begin
  Result := FShelves;
end;

constructor TAisle.Create(Shelves: iShelves);
begin
  FShelves := Shelves;
end;

function TAisle.CreateAisle: iAisle;
begin
  Result := Self;
end;

function TAisle.CreateAisleProductRelation: iAisle;
begin
  Result := Self;
end;

function TAisle.DeleteAisleProductRelation: iAisle;
begin
  Result := Self;
end;

destructor TAisle.Destroy;
begin

  inherited;
end;

function TAisle.EditAisle: iAisle;
begin
  Result := Self;
end;

function TAisle.GetAisle: iAisle;
begin
  Result := Self;
end;

class function TAisle.New(Shelves: iShelves): iAisle;
begin
  Result := Self.Create(Shelves);
end;

function TAisle.Parameters: iParameters<iAisle>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iAisle>.New(Self);
  Result := FParameters;
end;

end.
