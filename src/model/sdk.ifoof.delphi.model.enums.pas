unit sdk.ifoof.delphi.model.enums;

interface

uses
  System.SysUtils,
  System.TypInfo;

type
  TProviders = (AUTHENTICATION, MERCHANT, ORDER, SHIPPING, CATALOG, FINANCIAL,
    REVIEW, GROCERIES);

  TTypeMerchant = (RESTAURANT, STORE, GROUP, UNAVAILABILITY);

  TStatusMerchant = (OK, WARNING, CLOSED, ERROR ,AVAILABLE, UNAVAILABLE, DISABLED);

  TOperationMerchant = (DELIVERY, INDOOR);

  TSaleChannelMerchant = (IFOODAPP);

  TOrderFullCode = (PLACED);

  TOrderTypeCode = (PLC, REC, CFM);

  TOrderTypeCodeHelper = record helper for TOrderTypeCode
    function ToString: String;
  end;

  TOrderFullCodeHelper = record helper for TOrderFullCode
    function ToString: String;
  end;

  TSaleChannelMerchantHelper = record helper for TSaleChannelMerchant
    function ToString: String;
  end;

  TOperationMerchantHelpe = record helper for TOperationMerchant
    function ToString: String;
  end;

  TStatusMerchantHelper = record helper for TStatusMerchant
    function ToString: String;
  end;

  TTypeMerchantHelper = record helper for TTypeMerchant
    function ToString: String;
  end;

  TProvidersHelper = record helper for TProviders
    function ToString: String;
  end;

CONST
  API = 'https://merchant-api.ifood.com.br/%s/v1.0/';

implementation

{ TProvidersHelper }

function TProvidersHelper.ToString: String;
begin
  case Self of
    AUTHENTICATION: Format(API,['suthentication']);
    MERCHANT: Format(API,['merchant']);
    ORDER: Format(API,['order']);
    SHIPPING: Format(API,['shipping']);
    CATALOG: Format(API,['catalog']);
    FINANCIAL: Format(API,['financial']);
    REVIEW: Format(API,['review']);
    GROCERIES: Format(API,['groceries']);
  end;
end;

{ TTypeMerchantHelper }

function TTypeMerchantHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTypeMerchant), Integer(Self));
end;

{ TCreatedAtMerchantHelper }

function TStatusMerchantHelper.ToString: String;
begin
  Result :=  GetEnumName(TypeInfo(TStatusMerchant), Integer(Self));
end;

{ TOperationMerchantHelpe }

function TOperationMerchantHelpe.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TOperationMerchant), Integer(Self));
end;

{ TSaleChannelMerchantHelper }

function TSaleChannelMerchantHelper.ToString: String;
begin
  Result := 'ifood-app';
end;

{ TOrderFullCodeHelper }

function TOrderFullCodeHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TOrderFullCode), Integer(Self));
end;

{ TOrderTypeCodeHelper }

function TOrderTypeCodeHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TOrderTypeCode), Integer(Self));
end;

end.
