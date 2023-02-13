unit sdk.ifoof.delphi.model.entity.campaign;

interface

type
  TCampaign = class
  private
    FId: String;
    FName: String;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;

    class function New: TCampaign;
  end;

implementation

{ TCampaign }

class function TCampaign.New: TCampaign;
begin
  Result := Self.Create;
end;

end.
