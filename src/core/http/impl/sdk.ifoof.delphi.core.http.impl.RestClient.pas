unit sdk.ifoof.delphi.core.http.impl.RestClient;

interface

uses
  Data.DB,
  RestRequest4D,
  sdk.ifoof.delphi.model.enums,
  sdk.ifoof.delphi.core.http.interfaces;

type
  TRestClient = class(TInterfacedObject, iHttpClient)
  private
    FReq: IRequest;
    FResp: iResponse;
  public
    constructor Create(Url: String);
    destructor Destroy; override;
    class function New(Url: String): iHttpClient;
    function Token(Value: String): iHttpClient;
    function Get(Url: String): iHttpClient;
    function GetAll(Url: String): iHttpClient;
    function Post(Url: String): iHttpClient;
    function Put(Url: String): iHttpClient;
    function Patch(Url: String): iHttpClient;
    function Delete(Url: String): iHttpClient;
    function Params(aKey: String; aValue: String): iHttpClient;
    function Body(Value: String): iHttpClient;
    function DataSet(Value: TDataSet): iHttpClient;
    function Authorization(Value: TGrandType): iHttpClient;
    function AddQuery(aKey: String; aValue: String): iHttpClient;
    function StatusCode: Integer;
    function Content(var Value: String): iHttpClient;
  end;

implementation

function TRestClient.AddQuery(aKey, aValue: String): iHttpClient;
begin
  Result := Self;
  FReq.AddUrlSegment(aKey, aValue);
end;

function TRestClient.Authorization(Value: TGrandType): iHttpClient;
begin
  Result := Self;

  FReq.Accept(APPLICATION_JSON.ToString).ContentType(APPLICATION_FROM.ToString)
    .AddParam('grant_type', Value.ToString);
end;

function TRestClient.Body(Value: String): iHttpClient;
begin
  Result := Self;
  FReq.AddBody(Value);
end;

function TRestClient.Content(var Value: String): iHttpClient;
begin
  Result := Self;
  Value := FResp.Content;
end;

constructor TRestClient.Create(Url: String);
begin
  FReq.BaseUrl(Url);
end;

function TRestClient.DataSet(Value: TDataSet): iHttpClient;
begin
  Result := Self;
  FReq.DataSetAdapter(Value);
end;

function TRestClient.Delete(Url: String): iHttpClient;
begin
  Result := Self;
  FReq.Resource(Url).Delete;
end;

destructor TRestClient.Destroy;
begin

  inherited;
end;

function TRestClient.Get(Url: String): iHttpClient;
begin
  Result := Self;
  FReq.Accept(APPLICATION_JSON.ToString).Resource(Url).Get;
end;

function TRestClient.GetAll(Url: String): iHttpClient;
begin
  Result := Self;
  FReq.Accept(APPLICATION_JSON.ToString).Resource(Url).Get;
end;

class function TRestClient.New(Url: String): iHttpClient;
begin
  Result := Self.Create(Url);
end;

function TRestClient.Params(aKey, aValue: String): iHttpClient;
begin
  Result := Self;
  FReq.AddParam(aKey, aValue);
end;

function TRestClient.Patch(Url: String): iHttpClient;
begin
  Result := Self;
  FReq.Resource(Url).Patch;
end;

function TRestClient.Post(Url: String): iHttpClient;
begin
  Result := Self;
  FReq.AddHeader(CONTENT_TYPE.ToString, APPLICATION_JSON.ToString)
    .Resource(Url).Post;
end;

function TRestClient.Put(Url: String): iHttpClient;
begin
  Result := Self;
  FReq.Resource(Url).Put;
end;

function TRestClient.StatusCode: Integer;
begin
  Result := FResp.StatusCode;
end;

function TRestClient.Token(Value: String): iHttpClient;
begin
  Result := Self;
  FReq.TokenBearer(Value);
end;

end.
