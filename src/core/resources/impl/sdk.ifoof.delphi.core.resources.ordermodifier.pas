unit sdk.ifoof.delphi.core.resources.ordermodifier;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TOrderModifier = class(TInterfacedObject, iOrderModifier)
  private
    FGroceries: iGroceries;
    FParameters: iParameters<iOrderModifier>;
  public
    constructor Create(Groceries: iGroceries);
    destructor Destroy; override;
    class function New(Groceries: iGroceries): iOrderModifier;
    function ReturnsIfPossibleModifyOrder: iOrderModifier;
    function ListsPatchRequestsOfOrder: iOrderModifier;
    function ListsReplacementsOfOrder: iOrderModifier;
    function CreatesNewPatchRequest: iOrderModifier;
    function Parameters: iParameters<iOrderModifier>;
    function &End: iGroceries;
  end;

implementation

{ TMyClass }

function TOrderModifier.&End: iGroceries;
begin
  Result := FGroceries;
end;

constructor TOrderModifier.Create(Groceries: iGroceries);
begin
  FGroceries := Groceries;
end;

function TOrderModifier.CreatesNewPatchRequest: iOrderModifier;
begin
  Result := Self;
end;

destructor TOrderModifier.Destroy;
begin

  inherited;
end;

function TOrderModifier.ListsPatchRequestsOfOrder: iOrderModifier;
begin
  Result := Self;
end;

function TOrderModifier.ListsReplacementsOfOrder: iOrderModifier;
begin
  Result := Self;
end;

class function TOrderModifier.New(Groceries: iGroceries): iOrderModifier;
begin
  Result := Self.Create(Groceries);
end;

function TOrderModifier.Parameters: iParameters<iOrderModifier>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iOrderModifier>.New(Self);
  Result := FParameters;
end;

function TOrderModifier.ReturnsIfPossibleModifyOrder: iOrderModifier;
begin
  Result := Self;
end;

end.
