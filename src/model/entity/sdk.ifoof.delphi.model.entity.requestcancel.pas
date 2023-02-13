unit sdk.ifoof.delphi.model.entity.requestcancel;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TRespRequestCancel = class
  private
    FConverter: TConverterJSONObject<TRespRequestCancel>;
    FReason: String;
    FCancellationCode: String;
  public
    property Reason: String read FReason write FReason;
    property CancellationCode: String read FCancellationCode write FCancellationCode;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespRequestCancel;
    function Convereter: TConverterJSONObject<TRespRequestCancel>;
  end;

implementation

{ TRespRequestCancel }

function TRespRequestCancel.Convereter: TConverterJSONObject<TRespRequestCancel>;
begin
  Result := FConverter;
end;

constructor TRespRequestCancel.Create;
begin
  FConverter:= TConverterJSONObject<TRespRequestCancel>.New(Self);
end;

destructor TRespRequestCancel.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TRespRequestCancel.New: TRespRequestCancel;
begin
  Result := Self.Create;
end;

end.
