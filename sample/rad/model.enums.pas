unit model.enums;

interface

type
  TBASEURL = (URL);

  TEndPoint = (AUTENTICATION, ORDER, MERCHANT);

  TEndPointHelper = record helper for TEndPoint
    function ToString: String;
  end;

  TBASEURLHelper = record helper for TBASEURL
    function ToString: String;
  end;

implementation

{ TBASEURLHelper }

function TBASEURLHelper.ToString: String;
begin
  Result := 'https://merchant-api.ifood.com.br';
end;

{ TEndPointHelper }

function TEndPointHelper.ToString: String;
var
  lUrl: TBASEURL;
begin
  case Self of
    AUTENTICATION: Result := lUrl.ToString+'/authentication/v1.0/';
    ORDER: Result := lUrl.ToString+'/order/v1.0';
    MERCHANT: Result := lUrl.ToString+'/merchant/v1.0'
  end;
end;

end.
