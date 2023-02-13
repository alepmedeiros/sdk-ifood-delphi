unit sdk.ifoof.delphi.core.resources.impl.delivery;

interface

uses
  System.SysUtils,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.tracking;

type
  TDelivery = class(TInterfacedObject, iDelivery)
  private
    FOrder: iOrder;
    FParameters: iParameters<iDelivery>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      TRACKING = '/orders/%s/tracking';
      REQUESTD = '/orders/%s/requestDriver';
  public
    constructor Create(Order: iOrder);
    destructor Destroy; override;
    class function New(Order: iOrder): iDelivery;
    function TrackTheOrder: TRespTracking;
    function RequestDriver: Boolean;
    function Parameters: iParameters<iDelivery>;
    function &End: iOrder;
  end;

implementation

{ TMyClass }

function TDelivery.&End: iOrder;
begin
  Result := FOrder;
end;

constructor TDelivery.Create(Order: iOrder);
begin
  FOrder := Order;
end;

destructor TDelivery.Destroy;
begin

  inherited;
end;

class function TDelivery.New(Order: iOrder): iDelivery;
begin
  Result := Self.Create(Order);
end;

function TDelivery.Parameters: iParameters<iDelivery>;
begin
  if not Assigned(FParameters) then
    FParameters := TParameters<iDelivery>.New(Self);
  Result := FParameters;
end;

function TDelivery.RequestDriver: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(REQUESTD, [FParameters.Id])).StatusCode = 202;
end;

function TDelivery.TrackTheOrder: TRespTracking;
begin
  FHTTP.Token('').Get(Format(TRACKING, [FParameters.Id])).Content(FJSON);
  Result := TRespTracking.New.Converter.ToObject(FJSON);
end;

end.
