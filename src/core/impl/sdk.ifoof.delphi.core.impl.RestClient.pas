unit sdk.ifoof.delphi.core.impl.RestClient;

interface

uses
  sdk.ifoof.delphi.core.interfaces,
  Data.DB;

type
  TRestClient = class(TInterfacedObject, iHttpClient)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iHttpClient;
    function BaseURL(aUrl: String): iHttpClient;
    function Token(Value: String): iHttpClient;
    function Get(Url: String): iHttpClient;
    function GetAll(Url: String): iHttpClient;
    function Post(Url: String): iHttpClient;
    function Put(Url: String): iHttpClient;
    function Delete(Url: String): iHttpClient;
    function Params(aKey: String; aValue: String): iHttpClient;
    function Body(Value: String): iHttpClient;
    function DataSet(Value: TDataSet): iHttpClient;
    function Authorization: iHttpClient;
    function Content(var Value: String): iHttpClient;
  end;

implementation

{ TRestClient }

function TRestClient.Authorization: iHttpClient;
begin
  Result := Self;
end;

function TRestClient.BaseURL(aUrl: String): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.Body(Value: String): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.Content(var Value: String): iHttpClient;
begin
  Result := Self;
end;

constructor TRestClient.Create;
begin

end;

function TRestClient.DataSet(Value: TDataSet): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.Delete(Url: String): iHttpClient;
begin
  Result := Self;
end;

destructor TRestClient.Destroy;
begin

  inherited;
end;

function TRestClient.Get(Url: String): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.GetAll(Url: String): iHttpClient;
begin
  Result := Self;
end;

class function TRestClient.New: iHttpClient;
begin
  Result := Self.Create;
end;

function TRestClient.Params(aKey, aValue: String): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.Post(Url: String): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.Put(Url: String): iHttpClient;
begin
  Result := Self;
end;

function TRestClient.Token(Value: String): iHttpClient;
begin
  Result := Self;
end;

end.
