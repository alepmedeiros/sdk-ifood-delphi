unit sdk.ifood.Delphi.interfaces;

interface

uses
  sdk.ifoof.delphi.core.configuration.interfaces,
  sdk.ifoof.delphi.core.resources.interfaces;

type
  iSDKIfoodDelphi = interface
    function Configuration: iConfiguration;
    function Resources: iResources;
  end;

implementation

end.
