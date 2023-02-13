unit sdk.ifood.Delphi;

interface

uses
  sdk.ifood.Delphi.interfaces,
  sdk.ifoof.Delphi.core.configuration.interfaces,
  sdk.ifoof.Delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.configuration.impl.configuration,
  sdk.ifoof.delphi.core.resources.resources;

type
  TSDKIfoodDelphi = class(TInterfacedObject, iSDKIfoodDelphi)
  private
    FConfiguration: iConfiguration;
    FResources: iResources;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSDKIfoodDelphi;
    function configuration: iConfiguration;
    function resources: iResources;
  end;

implementation

{ TMyClass }

function TSDKIfoodDelphi.configuration: iConfiguration;
begin
  if not Assigned(FConfiguration) then
    FConfiguration := TConfiguration.New;
  Result := FConfiguration;
end;

constructor TSDKIfoodDelphi.Create;
begin

end;

destructor TSDKIfoodDelphi.Destroy;
begin

  inherited;
end;

class function TSDKIfoodDelphi.New: iSDKIfoodDelphi;
begin
  Result := Self.Create;
end;

function TSDKIfoodDelphi.resources: iResources;
begin
  if not Assigned(FResources) then
    FResources := TResources.New(FConfiguration);
  Result := FResources;
end;

end.
