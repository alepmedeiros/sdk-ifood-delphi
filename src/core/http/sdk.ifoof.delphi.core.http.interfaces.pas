unit sdk.ifoof.delphi.core.http.interfaces;

interface

uses
  Data.DB,
  sdk.ifoof.delphi.model.enums;

type
  iHttpClient = interface
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

end.
