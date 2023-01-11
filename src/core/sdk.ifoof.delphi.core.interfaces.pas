unit sdk.ifoof.delphi.core.interfaces;

interface

uses
  Data.DB;

type
  iHttpClient = interface
    function BaseURL(aUrl : String) : iHttpClient;
    function Token(Value : String) : iHttpClient;
    function Get(Url: String) : iHttpClient;
    function GetAll(Url: String): iHttpClient;
    function Post(Url: String): iHttpClient;
    function Put(Url: String): iHttpClient;
    function Delete(Url: String): iHttpClient;
    function Params(aKey: String; aValue: String): iHttpClient;
    function Body(Value: String): iHttpClient;
    function DataSet(Value: TDataSet) : iHttpClient;
    function Authorization : iHttpClient;
    function Content(var Value: String): iHttpClient;
  end;

implementation

end.
