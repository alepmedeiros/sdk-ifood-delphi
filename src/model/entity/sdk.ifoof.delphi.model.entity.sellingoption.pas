unit sdk.ifoof.delphi.model.entity.sellingoption;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TSellingOption = class
  private
    FConverter: TConverterJSONObject<TSellingOption>;
    FMinimum: Double;
    FIncremental: Integer;
    FAvailableUnits: TList<String>;
    FAverageUnit: Integer;
  public
    property Minimum: Double read FMinimum write FMinimum;
    property Incremental: Integer read FIncremental write FIncremental;
    property AvailableUnits: TList<String> read FAvailableUnits write FAvailableUnits;
    property AverageUnit: Integer read FAverageUnit write FAverageUnit;

    constructor Create;
    destructor Destroy; override;
    class function New: TSellingOption;
    function Converter: TConverterJSONObject<TSellingOption>;
  end;

implementation

{ TClassPadrao }

function TSellingOption.Converter: TConverterJSONObject<TSellingOption>;
begin
  Result := FConverter;
end;

constructor TSellingOption.Create;
begin
  FConverter:= TConverterJSONObject<TSellingOption>.New(Self);
end;

destructor TSellingOption.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TSellingOption.New: TSellingOption;
begin
  Result := Self.Create;
end;

end.
