unit sdk.ifoof.delphi.core.resources.impl.optiongroup;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TOptionGroup = class(TInterfacedObject, iOptionGroup)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iOptionGroup>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iOptionGroup;
    function CreateOptionGroup: iOptionGroup;
    function ListOptinoGroups: iOptionGroup;
    function UpdateOptionGroups: iOptionGroup;
    function DeleteOptionGroup: iOptionGroup;
    function AssociateOptionGroupToProduct: iOptionGroup;
    function UpdateOptionGroupProductAssociation: iOptionGroup;
    function DisassociateOptionGroupFromProduct: iOptionGroup;
    function UpdateOptionGroupsStatus: iOptionGroup;
    function Parameters: iParameters<iOptionGroup>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TOptionGroup.AssociateOptionGroupToProduct: iOptionGroup;
begin
  Result := Self;
end;

function TOptionGroup.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TOptionGroup.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TOptionGroup.CreateOptionGroup: iOptionGroup;
begin
  Result := Self;
end;

function TOptionGroup.DeleteOptionGroup: iOptionGroup;
begin
  Result := Self;
end;

destructor TOptionGroup.Destroy;
begin

  inherited;
end;

function TOptionGroup.DisassociateOptionGroupFromProduct: iOptionGroup;
begin
  Result := Self;
end;

function TOptionGroup.ListOptinoGroups: iOptionGroup;
begin
  Result := Self;
end;

class function TOptionGroup.New(Catalog: iCatalog): iOptionGroup;
begin
  Result := Self.Create(Catalog);
end;

function TOptionGroup.Parameters: iParameters<iOptionGroup>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iOptionGroup>.New(Self);
  Result := FParameters;
end;

function TOptionGroup.UpdateOptionGroupProductAssociation: iOptionGroup;
begin
  Result := Self;
end;

function TOptionGroup.UpdateOptionGroups: iOptionGroup;
begin
  Result := Self;
end;

function TOptionGroup.UpdateOptionGroupsStatus: iOptionGroup;
begin
  Result := Self;
end;

end.
