unit sdk.ifoof.delphi.model.entity.statusproduct;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TStatusProduct = class
  private
    FConverter: TConverterJSONObject<TStatusProduct>;
    FStatus: String;
  public
    property Status: String read FStatus write FStatus;

    constructor Create;
    destructor Destroy; override;
    class function New: TStatusProduct;
    function Converter: TConverterJSONObject<TStatusProduct>;
  end;

implementation

{ TClassPadrao }

function TStatusProduct.Converter: TConverterJSONObject<TStatusProduct>;
begin
  Result := FConverter;
end;

constructor TStatusProduct.Create;
begin
  FConverter:= TConverterJSONObject<TStatusProduct>.New(self);
end;

destructor TStatusProduct.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TStatusProduct.New: TStatusProduct;
begin
  Result := Self.Create;
end;

end.
