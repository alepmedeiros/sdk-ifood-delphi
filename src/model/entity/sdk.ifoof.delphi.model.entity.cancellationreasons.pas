unit sdk.ifoof.delphi.model.entity.cancellationreasons;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TRespCancellationReasons = class
  private
    FConverter: TConverterJSONObject<TRespCancellationReasons>;
    FDEscription: String;
    FCancelCodeId: String;
  public
    property DEscription: String read FDEscription write FDEscription;
    property CancelCodeId: String read FCancelCodeId write FCancelCodeId;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespCancellationReasons;
    function Converter: TConverterJSONObject<TRespCancellationReasons>;
  end;

implementation

{ TRespCancellationReasons }

function TRespCancellationReasons.Converter: TConverterJSONObject<TRespCancellationReasons>;
begin
  Result := FConverter;
end;

constructor TRespCancellationReasons.Create;
begin
  FConverter:= TConverterJSONObject<TRespCancellationReasons>.New(Self);
end;

destructor TRespCancellationReasons.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TRespCancellationReasons.New: TRespCancellationReasons;
begin
  Result := Self.Create;
end;

end.
