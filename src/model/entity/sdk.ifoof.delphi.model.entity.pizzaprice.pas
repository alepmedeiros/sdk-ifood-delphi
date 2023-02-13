unit sdk.ifoof.delphi.model.entity.pizzaprice;

interface

type
  TPizzaPrice = class
  private
    FValue: Double;
    FOriginalValue: Double;
  public
    property Value: Double read FValue write FValue;
    property OriginalValue: Double read FOriginalValue write FOriginalValue;

    class function New: TPizzaPrice;
  end;

implementation

{ TPizzaPrice }

class function TPizzaPrice.New: TPizzaPrice;
begin
  Result := Self.Create;
end;

end.
