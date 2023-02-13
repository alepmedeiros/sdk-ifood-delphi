unit sdk.ifoof.delphi.model.entity.changelog;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TRespChangeLog = class
  private
    FConverter: TConverterJSONObject<TRespChangeLog>;
    FOwnerId: String;
    FCatalogId: String;
    FCategoryId: String;
    FCategoryStatus: String;
    FModifiedAt: TDateTime;
    FChangelogIngestedAt: TDateTime;
    FSystemId: String;
  public
    property OwnerId: String read FOwnerId write FOwnerId;
    property CatalogId: String read FCatalogId write FCatalogId;
    property CategoryId: String read FCategoryId write FCategoryId;
    property CategoryStatus: String read FCategoryStatus write FCategoryStatus;
    property ModifiedAt: TDateTime read FModifiedAt write FModifiedAt;
    property ChangelogIngestedAt: TDateTime read FChangelogIngestedAt write FChangelogIngestedAt;
    property SystemId: String read FSystemId write FSystemId;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespChangeLog;
    function Converter: TConverterJSONObject<TRespChangeLog>;
  end;

implementation

{ TRespChangeLog }

function TRespChangeLog.Converter: TConverterJSONObject<TRespChangeLog>;
begin
  Result := FConverter;
end;

constructor TRespChangeLog.Create;
begin
  FConverter := TConverterJSONObject<TRespChangeLog>.New(Self);
end;

destructor TRespChangeLog.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TRespChangeLog.New: TRespChangeLog;
begin
  Result := Self.Create;
end;

end.
