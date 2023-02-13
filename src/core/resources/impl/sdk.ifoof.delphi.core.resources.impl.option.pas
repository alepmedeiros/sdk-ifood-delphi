unit sdk.ifoof.delphi.core.resources.impl.option;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TOption = class(TInterfacedObject, iOption)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iOption>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iOption;
    function CreateOption: iOption;
    function UpdateOption: iOption;
    function DeleteOption: iOption;
    function Parameters: iParameters<iOption>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TOption.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TOption.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TOption.CreateOption: iOption;
begin
  Result := Self;
end;

function TOption.DeleteOption: iOption;
begin
  Result := Self;
end;

destructor TOption.Destroy;
begin

  inherited;
end;

class function TOption.New(Catalog: iCatalog): iOption;
begin
  Result := Self.Create(Catalog);
end;

function TOption.Parameters: iParameters<iOption>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iOption>.New(Self);
  Result := FParameters;
end;

function TOption.UpdateOption: iOption;
begin
  Result := Self;
end;

end.
