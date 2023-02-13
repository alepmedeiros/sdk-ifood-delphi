unit sdk.ifoof.delphi.model.entity.benefits;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.sponsorshipValues,
  sdk.ifoof.delphi.model.entity.campaign;

type
  TBenefits = class
  private
    FTargetId: String;
    FSponsorshipValues: TObjectList<TSponsorshipValues>;
    FValue: Integer;
    FTarget: String;
    FCampaign: TCampaign;
  public
    property TargetId: String read FTargetId write FTargetId;
    property SponsorshipValues: TObjectList<TSponsorshipValues> read FSponsorshipValues write FSponsorshipValues;
    property Value: Integer read FValue write FValue;
    property Target: String read FTarget write FTarget;
    property Campaign: TCampaign read FCampaign write FCampaign;

    constructor Create;
    destructor Destroy; override;
    class function New: TBenefits;
  end;

implementation

{ TBenefits }

constructor TBenefits.Create;
begin
  FCampaign:= TCampaign.New;
  FSponsorshipValues:= TObjectList<TSponsorshipValues>.Create;
end;

destructor TBenefits.Destroy;
begin

  inherited;
end;

class function TBenefits.New: TBenefits;
begin
  Result := Self.Create;
end;

end.
