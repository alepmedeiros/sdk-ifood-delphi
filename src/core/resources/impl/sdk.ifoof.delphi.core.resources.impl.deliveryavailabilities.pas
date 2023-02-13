unit sdk.ifoof.delphi.core.resources.impl.deliveryavailabilities;

interface

uses
  System.SysUtils,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.model.entity.discovery,
  sdk.ifoof.delphi.core.http.interfaces;

type
  TDeliveryAvailabilities = class(TInterfacedObject, iDeliveryAvailabilities)
  private
    FShipping: iShipping;
    FParameters: iParameters<iDeliveryAvailabilities>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      DELIVERYAV = '/merchants/%s/deliveryAvailabilities';
  public
    constructor Create(Shipping: iShipping);
    destructor Destroy; override;
    class function New(Shipping: iShipping): iDeliveryAvailabilities;
    function DeliveryAvailabilities(var Value: TRespDiscovery): iDeliveryAvailabilities;
    function Parameters: iParameters<iDeliveryAvailabilities>;
    function &End: iShipping;
  end;

implementation

{ TMyClass }

function TDeliveryAvailabilities.&End: iShipping;
begin
  Result := FShipping;
end;

constructor TDeliveryAvailabilities.Create(Shipping: iShipping);
begin
  FShipping := Shipping;
end;

function TDeliveryAvailabilities.DeliveryAvailabilities(var Value: TRespDiscovery): iDeliveryAvailabilities;
begin
  Result := Self;
  FHTTP.Token('').Get(Format(DELIVERYAV, [FParameters.MerchantId])).Content(FJSON);
  Value := TRespDiscovery.New.Converter.ToObject(FJSON);
end;

destructor TDeliveryAvailabilities.Destroy;
begin

  inherited;
end;

class function TDeliveryAvailabilities.New(Shipping: iShipping): iDeliveryAvailabilities;
begin
  Result := Self.Create(Shipping);
end;

function TDeliveryAvailabilities.Parameters: iParameters<iDeliveryAvailabilities>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iDeliveryAvailabilities>.New(Self);
  Result := FParameters;
end;

end.
