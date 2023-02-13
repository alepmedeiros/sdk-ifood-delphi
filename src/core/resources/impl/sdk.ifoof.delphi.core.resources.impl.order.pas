unit sdk.ifoof.delphi.core.resources.impl.order;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.impl.delivery,
  sdk.ifoof.delphi.core.resources.impl.actions,
  sdk.ifoof.delphi.core.resources.impl.details,
  sdk.ifoof.delphi.core.resources.impl.events;

type
  TOrder = class(TInterfacedObject, iOrder)
  private
    FEvents: iEvents;
    FDetails: iDetails;
    FActions: iActions;
    FDelivery: iDelivery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iOrder;
    function Events: iEvents;
    function Details: iDetails;
    function Actions: iActions;
    function Delivery: iDelivery;
    function &End: iOrder;
  end;

implementation

{ TMyClass }

function TOrder.Actions: iActions;
begin
  if not Assigned(FActions) then
    FActions := TActions.New(Self);
  Result := FActions;
end;

function TOrder.&End: iOrder;
begin
  Result := Self;
end;

constructor TOrder.Create;
begin

end;

function TOrder.Delivery: iDelivery;
begin
  if not Assigned(FDelivery) then
    FDelivery := TDelivery.New(Self);
  Result := FDelivery;
end;

destructor TOrder.Destroy;
begin

  inherited;
end;

function TOrder.Details: iDetails;
begin
  if not Assigned(FDetails) then
    FDetails := TDetails.New(Self);
  Result := FDetails;
end;

function TOrder.Events: iEvents;
begin
  if not Assigned(FEvents) then
    FEvents := TEvents.New(Self);
  Result := FEvents;
end;

class function TOrder.New: iOrder;
begin
  Result := Self.Create;
end;

end.
