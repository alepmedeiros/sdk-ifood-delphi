unit sdk.ifoof.delphi.model.entity.itemprice;

interface

uses
  sdk.ifoof.delphi.model.entity.scaleprices;

type
  TItemPrice = class
  private
    FValue: Double;
    FOriginalValue: Double;
    FScalePrices: TScalePrices;
  public
    property Value: Double read FValue write FValue;
    property OriginalValue: Double read FOriginalValue write FOriginalValue;
    property ScalePrices: TScalePrices read FScalePrices write FScalePrices;

    class function New: TItemPrice;
  end;

implementation

{ TItemPrice }

class function TItemPrice.New: TItemPrice;
begin
  Result := Self.Create;
end;

end.
