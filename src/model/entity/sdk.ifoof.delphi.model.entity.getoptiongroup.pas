unit sdk.ifoof.delphi.model.entity.getoptiongroup;

interface

uses
  GBJSON.Attributes,
  sdk.ifoof.delphi.model.entity.getoptions;

type
  TGetOptionGroup = class
  private
    FId: String;
    FName: String;
    FExternalCode: String;
    FStatus: String;
    FIndex: Integer;
    FMin: Integer;
    FMax: Integer;
    FOptions: TGetOptions;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Status: String read FStatus write FStatus;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property Min: Integer read FMin write FMin;
    property Max: Integer read FMax write FMax;
    property Options: TGetOptions read FOptions write FOptions;

    class function New: TGetOptionGroup;
  end;

implementation

{ TGetOptionGroup }

class function TGetOptionGroup.New: TGetOptionGroup;
begin
  Result := Self.Create;
end;

end.
