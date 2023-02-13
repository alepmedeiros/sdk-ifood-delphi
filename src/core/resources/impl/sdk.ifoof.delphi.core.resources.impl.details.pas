unit sdk.ifoof.delphi.core.resources.impl.details;

interface

uses
  System.SysUtils,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.orderdetails;

type
  TDetails = class(TInterfacedObject, iDetails)
  private
    FOrder: iOrder;
    FParameters: iParameters<iDetails>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      ORDERS = '/orders/%s';
  public
    constructor Create(Order: iOrder);
    destructor Destroy; override;
    class function New(Order: iOrder): iDetails;
    function GetOrderDetails: TRespOrderDetails;
    function Parameters: iParameters<iDetails>;
    function &End: iOrder;
  end;

implementation

{ TMyClass }

function TDetails.&End: iOrder;
begin
  Result := FOrder;
end;

constructor TDetails.Create(Order: iOrder);
begin
  FOrder := Order;
end;

destructor TDetails.Destroy;
begin

  inherited;
end;

function TDetails.GetOrderDetails: TRespOrderDetails;
begin
  FHTTP.Token('').Get(Format(ORDERS,[FParameters.Id])).Content(FJSON);
  Result := TRespOrderDetails.New.Converter.ToObject(FJSON);
end;

class function TDetails.New(Order: iOrder): iDetails;
begin
  Result := Self.Create(Order);
end;

function TDetails.Parameters: iParameters<iDetails>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iDetails>.New(Self);
  Result := FParameters;
end;

end.
