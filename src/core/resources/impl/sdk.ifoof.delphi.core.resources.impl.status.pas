unit sdk.ifoof.delphi.core.resources.impl.status;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.status;

type
  TStatus = class(TInterfacedObject, iStatus)
  private
    FMerchant: iMerchant;
    FParameters: iParameters<iStatus>;
    FJSON: String;

    FHTTP: iHTTPClient;

    const
      TOKEN = '';
      MERCHANT = '/merchants/%s/status';
      MERCAHTOPERATION = '/merchants/%s/status/%s';
  public
    constructor Create(Merchant: iMerchant);
    destructor Destroy; override;
    class function New(Merchant: iMerchant): iStatus;
    function GetMerchantStatus: TObjectList<TRespStatus>;
    function GetMerchantStatusByOperation: TRespStatus;
    function parameters: iParameters<iStatus>;
    function &End: iMerchant;
  end;

implementation

{ TMyClass }

function TStatus.&End: iMerchant;
begin
  Result := FMerchant;
end;

constructor TStatus.Create(Merchant: iMerchant);
begin
  FMerchant := Merchant;
end;

destructor TStatus.Destroy;
begin

  inherited;
end;

function TStatus.GetMerchantStatus: TObjectList<TRespStatus>;
begin
  FHTTP.Token(TOKEN).GetAll(Format(MERCHANT, [FParameters.MerchantId])).Content(FJSON);
  Result := TRespStatus.New.ToList(FJSON);
end;

function TStatus.GetMerchantStatusByOperation: TRespStatus;
begin
  FHTTP.Token(TOKEN).Get(Format(MERCAHTOPERATION, [FParameters.MerchantId, FParameters.Operation]))
    .Content(FJSON);

  Result := TRespStatus.New.ToObject(FJSON);
end;

class function TStatus.New(Merchant: iMerchant): iStatus;
begin
  Result := Self.Create(Merchant);
end;

function TStatus.parameters: iParameters<iStatus>;
begin
  if not Assigned(FParameters) then
    FParameters := TParameters<iStatus>.New(Self);
  Result := FParameters;
end;

end.
