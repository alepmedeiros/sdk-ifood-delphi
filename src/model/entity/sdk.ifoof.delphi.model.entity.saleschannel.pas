unit sdk.ifoof.delphi.model.entity.saleschannel;

interface

type
  TSalesChannel = class
  private
    FName: String;
    FEnabled: String;
  public
    property Name: String read FName write FName;
    property Enabled: String read FEnabled write FEnabled;

    class function New: TSalesChannel;
  end;

implementation

{ TSalesChannel }

class function TSalesChannel.New: TSalesChannel;
begin
  Result := Self.Create;
end;

end.
