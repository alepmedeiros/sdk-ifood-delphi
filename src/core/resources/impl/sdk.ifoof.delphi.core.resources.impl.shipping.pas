unit sdk.ifoof.delphi.core.resources.impl.shipping;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.impl.deliveryavailabilities,
  sdk.ifoof.delphi.core.resources.impl.orders,
  sdk.ifoof.delphi.core.http.interfaces;

type
  TShipping = class(TInterfacedObject, iShipping)
  private
    FDeliveryAvailabilities: iDeliveryAvailabilities;
    FOrders: iOrders;
    FJSON: String;
    FHTTP: iHTTPClient;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iShipping;
    function deliveryavailabilities: iDeliveryAvailabilities;
    function Orders: iOrders;
    function &End: iShipping;
  end;

implementation

{ TMyClass }

function TShipping.&End: iShipping;
begin
  Result := Self;
end;

constructor TShipping.Create;
begin

end;

function TShipping.deliveryavailabilities: iDeliveryAvailabilities;
begin
  if not Assigned(FDeliveryAvailabilities) then
    FDeliveryAvailabilities := TDeliveryAvailabilities.New(Self);
  Result := FDeliveryAvailabilities;
end;

destructor TShipping.Destroy;
begin

  inherited;
end;

class function TShipping.New: iShipping;
begin
  Result := Self.Create;
end;

function TShipping.Orders: iOrders;
begin
  if not Assigned(FOrders) then
    FOrders := TOrders.New(Self);
  Result := FOrders;
end;

end.
