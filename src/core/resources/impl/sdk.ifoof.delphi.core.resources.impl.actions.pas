unit sdk.ifoof.delphi.core.resources.impl.actions;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.cancellationreasons,
  sdk.ifoof.delphi.model.entity.requestcancel;

type
  TActions = class(TInterfacedObject, iActions)
  private
    FOrder: iOrder;
    FParameters: iParameters<iActions>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      ORDERCONF = '/orders/%s/confirm';
      STARTOPERATION = '/orders/%s/startPreparation';
      READYTOPICKUP = '/orders/%s/readyToPickup';
      DISPATCH = '/orders/%s/dispatch';
      CACELLATIONREASONS = '/orders/%s/cancellationReasons';
      RESQUESTCANCEL = '/orders/%s/requestCancellation';
      ACCEPTCANCEL = '/orders/%s/acceptCancellation';
      DENYCANCELLATION = '/orders/%s/denyCancellation';
  public
    constructor Create(Order: iOrder);
    destructor Destroy; override;
    class function New(Order: iOrder): iActions;
    function ConfirmOrder: Boolean;
    function StartPreparation: Boolean;
    function ReadyToPichup: Boolean;
    function DispatchOrder: Boolean;
    function GetAvailableCacellationCodesForTheOrder: TObjectList<TRespCancellationReasons>;
    function RequestToCancel(Value: TRespRequestCancel): Boolean;
    function AcceptCancellationRequest: Boolean;
    function DenyCacellationRequest: Boolean;
    function Parameters: iParameters<iActions>;
    function &End: iOrder;
  end;

implementation

{ TMyClass }

function TActions.AcceptCancellationRequest: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(ACCEPTCANCEL, [Parameters.Id])).StatusCode = 202;
end;

function TActions.ConfirmOrder: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(ORDERCONF, [FParameters.Id])).StatusCode = 202;
end;

function TActions.&End: iOrder;
begin
  Result := FOrder;
end;

constructor TActions.Create(Order: iOrder);
begin
  FOrder:= Order;
end;

function TActions.DenyCacellationRequest: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(DENYCANCELLATION, [FParameters.Id])).StatusCode = 202;
end;

destructor TActions.Destroy;
begin

  inherited;
end;

function TActions.DispatchOrder: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(DISPATCH, [FParameters.Id])).StatusCode = 202;
end;

function TActions.GetAvailableCacellationCodesForTheOrder: TObjectList<TRespCancellationReasons>;
begin
  FHTTP.Token('').GetAll(Format(CACELLATIONREASONS, [FParameters.Id])).Content(FJSON);
  Result := TRespCancellationReasons.New.Converter.ToList(FJSON);
end;

class function TActions.New(Order: iOrder): iActions;
begin
  Result := Self.Create(Order);
end;

function TActions.Parameters: iParameters<iActions>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iActions>.New(Self);
  Result := FParameters;
end;

function TActions.ReadyToPichup: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(STARTOPERATION, [FParameters.Id])).StatusCode = 202;
end;

function TActions.RequestToCancel(Value: TRespRequestCancel): Boolean;
begin
  Result := not FHTTP.Token('')
    .Body(Value.Convereter.ToJSON.ToString)
    .Post(Format(RESQUESTCANCEL, [FParameters.Id])).StatusCode = 202;
end;

function TActions.StartPreparation: Boolean;
begin
  Result := not FHTTP.Token('').Post(Format(STARTOPERATION, [FParameters.Id])).StatusCode = 202;
end;

end.
