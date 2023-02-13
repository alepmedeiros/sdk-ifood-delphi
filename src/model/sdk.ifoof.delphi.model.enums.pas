unit sdk.ifoof.delphi.model.enums;

interface

uses
  System.SysUtils,
  System.TypInfo;

type
  TProviders = (AUTHENTICATION, MERCHANT, ORDER, SHIPPING, CATALOG, FINANCIAL,
    REVIEW, GROCERIES);

  THeaderAPI = (CONTENT_TYPE, ACCEPT, APPLICATION_JSON, APPLICATION_FROM);

  TTypeMerchant = (RESTAURANT, STORE, GROUP, UNAVAILABILITY);

  TStatusMerchant = (OK, WARNING, CLOSED, ERROR, AVAILABLE, UNAVAILABLE,
    DISABLED);

  TOperationMerchant = (DELIVERY, INDOOR);

  TSaleChannelMerchant = (IFOODAPP);

  TOrderFullCode = (PLACED);

  TOrderTypeCode = (PLC, REC, CFM);

  TStatus = (AUTHORIZED, AUTHORIZED_CANCELLATION_PENDING,
    AUTHORIZED_CANCELLATION_SUCCESSFUL, AUTHORIZED_CANCELLATION_FAILED,
    CAPTURE_SUCCESSFUL, CAPTURE_FAILED, REFUND_PENDING, REFUND_SUCCESSFUL,
    REFUND_FAILED);

  TType = (CREDIT, DEBIT);

  TSort = (ASC, DESC);

  TSortBy = (CREATED_AT, ORDER_DATE);

  TGrandType = (client_credentials, authorization_code, refresh_token);

  TGrandTypeHelper = record helper for TGrandType
    function ToString: String;
  end;

  TSortByHelper = record helper for TSortBy
    function ToString: String;
  end;

  TSortHelper = record helper for TSort
    function ToString: String;
  end;

  TTypeHelper = record helper for TType
    function ToString: String;
  end;

  TStatusHelper = record helper for TStatus
    function ToString: String;
  end;

  THeaderAPIHelper = record helper for THeaderAPI
    function ToString: String;
  end;

TOrderTypeCodeHelper = record helper
for TOrderTypeCode
  function ToString: String;
end;

TOrderFullCodeHelper = record helper
for TOrderFullCode
  function ToString: String;
end;

TSaleChannelMerchantHelper = record helper
for TSaleChannelMerchant
  function ToString: String;
end;

TOperationMerchantHelpe = record helper
for TOperationMerchant
  function ToString: String;
end;

TStatusMerchantHelper = record helper
for TStatusMerchant
  function ToString: String;
end;

TTypeMerchantHelper = record helper
for TTypeMerchant
  function ToString: String;
end;

TProvidersHelper = record helper
for TProviders
  function ToString: String;
end;

CONST
  API = 'https://merchant-api.ifood.com.br/%s/v1.0/';

implementation

{ TProvidersHelper }

function TProvidersHelper.ToString: String;
begin
  case Self of
    AUTHENTICATION:
      Format(API, ['authentication']);
    MERCHANT:
      Format(API, ['merchant']);
    ORDER:
      Format(API, ['order']);
    SHIPPING:
      Format(API, ['shipping']);
    CATALOG:
      Format(API, ['catalog']);
    FINANCIAL:
      Format(API, ['financial']);
    REVIEW:
      Format(API, ['review']);
    GROCERIES:
      Format(API, ['groceries']);
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
  Result := GetEnumName(TypeInfo(TStatusMerchant), Integer(Self));
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

{ THeaderAPIHelper }

function THeaderAPIHelper.ToString: String;
begin
  case Self of
    CONTENT_TYPE:
      Result := 'Content-Type';
    ACCEPT:
      Result := 'accept';
    APPLICATION_JSON:
      Result := 'application/json';
    APPLICATION_FROM:
      Result := 'application/x-www-form-urlcoded';
  end;
end;

{ TStatusHelper }

function TStatusHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TStatus), Integer(Self));
end;

{ TTypeHelper }

function TTypeHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TType), Integer(Self));
end;

{ TSortHelper }

function TSortHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TSort), Integer(Self));
end;

{ TSortByHelper }

function TSortByHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TSortBy), Integer(Self));
end;

{ TGrandTypeHelper }

function TGrandTypeHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TGrandType), Integer(Self));
end;

end.
