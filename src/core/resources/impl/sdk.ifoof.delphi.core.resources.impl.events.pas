unit sdk.ifoof.delphi.core.resources.impl.events;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces, sdk.ifoof.delphi.model.entity.event,
  sdk.ifoof.delphi.model.entity.ackevent;

type
  TEvents = class(TInterfacedObject, iEvents)
  private
    FOrder: iOrder;
    FParameters: iParameters<iEvents>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      EVENT = '/events:polling';
      ACKNOWLEDGMENT = '/events/acknowledgment';
  public
    constructor Create(Order: iOrder);
    destructor Destroy; override;
    class function New(Order: iOrder): iEvents;
    function GetNewEvents: TObjectList<TRespEvent>;
    function AcknowledgeEvents(Value: TRespAckEvent): iEvents;
    function parameters: iParameters<iEvents>;
    function &End: iOrder;
  end;

implementation

{ TMyClass }

function TEvents.AcknowledgeEvents(Value: TRespAckEvent): iEvents;
begin
  Result := Self;
  FHTTP.Token('').Body(Value.ToJson.ToString).Post(ACKNOWLEDGMENT);
end;

function TEvents.&End: iOrder;
begin
  Result := FOrder;
end;

constructor TEvents.Create(Order: iOrder);
begin
  FOrder := Order;
end;

destructor TEvents.Destroy;
begin

  inherited;
end;

function TEvents.GetNewEvents: TObjectList<TRespEvent>;
begin
  FHTTP.Token('')
    .Params('x-polling-merchants', FParameters.XPollingMerchants)
    .Params('types', FParameters.Types)
    .Params('groups',FParameters.Groups)
    .Get(EVENT).Content(FJSON);
  Result := TRespEvent.New.ToList(FJSON);
end;

class function TEvents.New(Order: iOrder): iEvents;
begin
  Result := Self.Create(Order);
end;

function TEvents.parameters: iParameters<iEvents>;
begin
  if not Assigned(FParameters) then
    FParameters := TParameters<iEvents>.New(Self);
  Result := FParameters;
end;

end.
