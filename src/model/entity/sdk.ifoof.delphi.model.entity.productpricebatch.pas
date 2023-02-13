unit sdk.ifoof.delphi.model.entity.productpricebatch;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject,
  sdk.ifoof.delphi.model.entity.price;

type
  TProductPriceBatch = class
  private
    FConverter: TConverterJSONObject<TProductPriceBatch>;
    FProductId: String;
    FExternalCode: String;
    FPrice: TPrice;
    FResources: TList<String>;
  public
    property ProductId: String read FProductId write FProductId;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Price: TPrice read FPrice write FPrice;
    property Resources: TList<String> read FResources write FResources;

    constructor Create;
    destructor Destroy; override;
    class function New: TProductPriceBatch;
    function Converter: TConverterJSONObject<TProductPriceBatch>;
  end;

implementation

{ TClassPadrao }

function TProductPriceBatch.Converter: TConverterJSONObject<TProductPriceBatch>;
begin
  Result := FConverter;
end;

constructor TProductPriceBatch.Create;
begin
  FConverter:= TConverterJSONObject<TProductPriceBatch>.New(Self);
end;

destructor TProductPriceBatch.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TProductPriceBatch.New: TProductPriceBatch;
begin
  Result := Self.Create;
end;

end.
