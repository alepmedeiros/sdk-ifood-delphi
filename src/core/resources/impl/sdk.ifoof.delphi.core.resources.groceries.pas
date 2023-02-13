unit sdk.ifoof.delphi.core.resources.groceries;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.ordermodifier;

type
  TGroceries = class(TInterfacedObject, iGroceries)
  private
    FOrderModifier: iOrderModifier;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iGroceries;
    function ordermodifier: iOrderModifier;
    function &End: iGroceries;
  end;

implementation

{ TMyClass }

function TGroceries.&End: iGroceries;
begin
  Result := Self;
end;

constructor TGroceries.Create;
begin

end;

destructor TGroceries.Destroy;
begin

  inherited;
end;

class function TGroceries.New: iGroceries;
begin
  Result := Self.Create;
end;

function TGroceries.ordermodifier: iOrderModifier;
begin
  if not Assigned(FOrderModifier) then
    FOrderModifier := TOrderModifier.New(Self);
  Result := FOrderModifier;
end;

end.
