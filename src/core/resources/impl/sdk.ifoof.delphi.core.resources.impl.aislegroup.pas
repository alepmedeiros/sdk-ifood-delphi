unit sdk.ifoof.delphi.core.resources.impl.aislegroup;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TAisleGroup = class(TInterfacedObject, iAisleGroup)
  private
    FShelves: iShelves;
    FParameters: iParameters<iAisleGroup>;
  public
    constructor Create(Shelves: iShelves);
    destructor Destroy; override;
    class function New(Shelves: iShelves): iAisleGroup;
    function CreateAisleGroup: iAisleGroup;
    function EditAisleGroup: iAisleGroup;
    function GetAisleGroup: iAisleGroup;
    function Parameters: iParameters<iAisleGroup>;
    function &End: iShelves;
  end;

implementation

{ TMyClass }

function TAisleGroup.&End: iShelves;
begin
  Result := FShelves;
end;

constructor TAisleGroup.Create(Shelves: iShelves);
begin
  FShelves := Shelves;
end;

function TAisleGroup.CreateAisleGroup: iAisleGroup;
begin
  Result := Self;
end;

destructor TAisleGroup.Destroy;
begin

  inherited;
end;

function TAisleGroup.EditAisleGroup: iAisleGroup;
begin
  Result := Self;
end;

function TAisleGroup.GetAisleGroup: iAisleGroup;
begin
  Result := Self;
end;

class function TAisleGroup.New(Shelves: iShelves): iAisleGroup;
begin
  Result := Self.Create(Shelves);
end;

function TAisleGroup.Parameters: iParameters<iAisleGroup>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iAisleGroup>.New(Self);
  Result := FParameters;
end;

end.
