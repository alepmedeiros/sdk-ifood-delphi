unit sdk.ifoof.delphi.model.entity.tracking;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TRespTracking = class
  private
    FConverter: TConverterJSONObject<TRespTracking>;
    FDeliveryEtaEnd: Double;
    FExpectedDelivery: TDateTime;
    FLatitude: Double;
    FLongitude: Double;
    FPickupEtaStart: Double;
    FTrackDate: Double;
  public
    property DeliveryEtaEnd: Double read FDeliveryEtaEnd write FDeliveryEtaEnd;
    property ExpectedDelivery: TDateTime read FExpectedDelivery write FExpectedDelivery;
    property Latitude: Double read FLatitude write FLatitude;
    property Longitude: Double read FLongitude write FLongitude;
    property PickupEtaStart: Double read FPickupEtaStart write FPickupEtaStart;
    property TrackDate: Double read FTrackDate write FTrackDate;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespTracking;
    function Converter: TConverterJSONObject<TRespTracking>;
  end;

implementation

{ TRespTracking }

function TRespTracking.Converter: TConverterJSONObject<TRespTracking>;
begin
  Result := FConverter;
end;

constructor TRespTracking.Create;
begin
  FConverter:= TConverterJSONObject<TRespTracking>.New(Self);
end;

destructor TRespTracking.Destroy;
begin

  inherited;
end;

class function TRespTracking.New: TRespTracking;
begin
  Result := Self.Create;
end;

end.
