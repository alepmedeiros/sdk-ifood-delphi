unit sdk.ifoof.delphi.core.resources.impl.orders;

interface

uses
  System.SysUtils,
  sdk.ifoof.delphi.model.entity.checkout,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.model.entity.responsecheckout,
  sdk.ifoof.delphi.core.http.interfaces;

type
  TOrders = class(TInterfacedObject, iOrders)
  private
    FShipping :iShipping;
    FParameters: iParameters<iOrders>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      ORDERS = '/merchants/%s/orders';
  public
    constructor Create(Shipping :iShipping);
    destructor Destroy; override;
    class function New(Shipping :iShipping): iOrders;
    function CreateOrder(Value: TRespCheckout; var Resp: TResponseCheckout): iOrders;
    function Parameters: iParameters<iOrders>;
    function &End: iShipping;
  end;

implementation

{ TMyClass }

function TOrders.&End: iShipping;
begin
  Result := FShipping;
end;

constructor TOrders.Create(Shipping :iShipping);
begin
  FShipping := Shipping;
end;

function TOrders.CreateOrder(Value: TRespCheckout; var Resp: TResponseCheckout): iOrders;
begin
  Result := Self;
  FHTTP.Token('')
    .Body(Value.Converter.ToJSON.ToString)
    .Post(Format(ORDERS, [FParameters.MerchantId])).Content(FJSON);
end;

destructor TOrders.Destroy;
begin

  inherited;
end;

class function TOrders.New(Shipping :iShipping): iOrders;
begin
  Result := Self.Create(Shipping);
end;

function TOrders.Parameters: iParameters<iOrders>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iOrders>.New(Self);
  Result := FParameters;
end;

end.
