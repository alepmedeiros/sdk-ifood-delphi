unit sdk.ifoof.delphi.model.entity.price;

interface

uses
  sdk.ifoof.delphi.model.entity.scaleprices;

type
  TPrice = class
  private
    FValue: Double;
    FOriginalValue: Double;
    FScalePrices: TScalePrices;
  public
    property Value: Double read FValue write FValue;
    property OriginalValue: Double read FOriginalValue write FOriginalValue;
    property ScalePrices: TScalePrices read FScalePrices write FScalePrices;

    class function New: TPrice;
  end;

implementation

{ TPrice }

class function TPrice.New: TPrice;
begin
  Result := Self.Create;
end;

end.
