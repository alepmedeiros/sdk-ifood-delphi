unit sdk.ifoof.delphi.model.entity.orderdetails;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject,
  sdk.ifoof.delphi.model.entity.benefits;

type
  TRespOrderDetails = class
  private
    FBenefits: TObjectList<TBenefits>;
    FOrderType: String;

    FConverter: TConverterJSONObject<TRespOrderDetails>;
  public
    property Benefits: TObjectList<TBenefits> read FBenefits write FBenefits;
    property OrderType: String read FOrderType write FOrderType;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespOrderDetails;
    function Converter: TConverterJSONObject<TRespOrderDetails>;
  end;

implementation

{ TRespOrderDetails }

function TRespOrderDetails.Converter: TConverterJSONObject<TRespOrderDetails>;
begin
  Result := FConverter;
end;

constructor TRespOrderDetails.Create;
begin
  FConverter:= TConverterJSONObject<TRespOrderDetails>.New(Self);
end;

destructor TRespOrderDetails.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TRespOrderDetails.New: TRespOrderDetails;
begin
  Result := Self.Create;
end;

end.
