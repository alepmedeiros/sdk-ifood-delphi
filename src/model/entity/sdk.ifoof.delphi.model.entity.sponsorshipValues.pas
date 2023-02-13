unit sdk.ifoof.delphi.model.entity.sponsorshipValues;

interface

uses
  GBJSON.Attributes;

type
  TSponsorshipValues = class
  private
    FName: String;
    FValue: Integer;
    FDescriptrion: String;
  public
    property Name: String read FName write FName;
    property Value: Integer read FValue write FValue;
    property Descriptrion: String read FDescriptrion write FDescriptrion;

    class function New: TSponsorshipValues;
  end;

implementation

{ TSponsorshipValues }

class function TSponsorshipValues.New: TSponsorshipValues;
begin
  Result := Self.Create;
end;

end.
