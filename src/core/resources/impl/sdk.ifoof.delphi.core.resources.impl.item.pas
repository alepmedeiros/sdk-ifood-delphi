unit sdk.ifoof.delphi.core.resources.impl.item;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TItem = class(TInterfacedObject, iItem)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iItem>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iItem;
    function GetItem: iItem;
    function CreateItem: iItem;
    function EditItem: iItem;
    function DeleteItem: iItem;
    function EditTheStatusOfItem: iItem;
    function Parameters: iParameters<iItem>;
    function &End: iCatalog;
  end;

implementation

function TItem.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TItem.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TItem.CreateItem: iItem;
begin
  Result := Self;
end;

function TItem.DeleteItem: iItem;
begin
  Result := Self;
end;

destructor TItem.Destroy;
begin

  inherited;
end;

function TItem.EditItem: iItem;
begin
  Result := Self;
end;

function TItem.EditTheStatusOfItem: iItem;
begin
  Result := Self;
end;

function TItem.GetItem: iItem;
begin
  Result := Self;
end;

class function TItem.New(Catalog: iCatalog): iItem;
begin
  Result := Self.Create(Catalog);
end;

function TItem.Parameters: iParameters<iItem>;
begin
  if not Assigned(FParameters) then
    FParameters := TParameters<iItem>.New(Self);
  Result := FParameters;
end;

end.
