unit sdk.ifoof.delphi.core.configuration.interfaces;

interface

uses
  sdk.ifoof.delphi.model.interfaces;

type
  iConfiguration = interface
    function ClientId(Value: String): iConfiguration; overload;
    function ClientId: String; overload;
    function ClientSecret(Value: String): iConfiguration; overload;
    function ClientSecret: String; overload;
  end;

implementation

end.
