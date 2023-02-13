unit sdk.ifoof.delphi.core.resources.impl.merchant;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.merchant,
  sdk.ifoof.delphi.core.resources.impl.status,
  sdk.ifoof.delphi.core.resources.impl.interruption,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces;

type
  TMerchant = class(TInterfacedObject, iMerchant)
  private
    FStatus: iStatus;
    FInterruption: iInterruption;
    FParameters: iParameters<iMerchant>;

    FHTTP: iHttpClient;

    const
      MERCHANT = '/merchants';
      MERCHATID = '/merchants/%s';
      TOKEN = '';
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMerchant;

    function ListMerchants: TObjectList<TRespMerchant>;
    function GetMerchantDetails: TRespMerchant;
    function Status: iStatus;
    function Interruption: iInterruption;
    function Parameters: iParameters<iMerchant>;
    function &End: iMerchant;
  end;

implementation

{ TMyClass }

function TMerchant.&End: iMerchant;
begin
  Result := Self;
end;

constructor TMerchant.Create;
begin

end;

destructor TMerchant.Destroy;
begin

  inherited;
end;

function TMerchant.GetMerchantDetails: TRespMerchant;
var
  lJson: String;
begin
  FHTTP.Token(TOKEN).Get(Format(MERCHATID, [FParameters.Id])).Content(lJson);
  Result := TRespMerchant.New.ToObject(lJson);
end;

function TMerchant.Interruption: iInterruption;
begin
  if not Assigned(FInterruption) then
    Result := TInterruption.New(Self);
  Result := FInterruption;
end;

function TMerchant.ListMerchants: TObjectList<TRespMerchant>;
var
  lJSON: String;
begin
  FHTTP.Token(TOKEN)
    .AddQuery('page', FParameters.Page)
    .AddQuery('size', FParameters.Size)
    .GetAll(MERCHANT).Content(lJSON);

  Result := TRespMerchant.New.ToList(lJSON);
end;

class function TMerchant.New: iMerchant;
begin
  Result := Self.Create;
end;

function TMerchant.Parameters: iParameters<iMerchant>;
begin
  if not Assigned(FParameters) then
    FParameters := TParameters<iMerchant>.New(Self);
  Result := FParameters;
end;

function TMerchant.status: iStatus;
begin
  if not Assigned(FStatus) then
    FStatus := TStatus.New(Self);
  Result := FStatus
end;

end.
