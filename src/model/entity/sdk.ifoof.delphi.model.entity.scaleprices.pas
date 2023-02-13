unit sdk.ifoof.delphi.model.entity.scaleprices;

interface

type
  TScalePrices = class
  private
    FMinQuantity: Integer;
    FPrice: Integer;
  public
    property MinQuantity: Integer read FMinQuantity write FMinQuantity;
    property Price: Integer read FPrice write FPrice;

    class function New: TScalePrices;
  end;

implementation

{ TScalePrices }

class function TScalePrices.New: TScalePrices;
begin
  Result := Self.Create;
end;

end.
