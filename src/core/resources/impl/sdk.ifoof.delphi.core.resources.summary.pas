unit sdk.ifoof.delphi.core.resources.summary;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TSummary = class(TInterfacedObject, iSummary)
  private
    FReview: iReview;
    FParameters: iParameters<iSummary>;
  public
    constructor Create(Review: iReview);
    destructor Destroy; override;
    class function New(Review: iReview): iSummary;
    function GetSummary: iSummary;
    function Parameters: iParameters<iSummary>;
    function &End: iReview;
  end;

implementation

{ TMyClass }

function TSummary.&End: iReview;
begin
  Result := FReview;
end;

constructor TSummary.Create(Review: iReview);
begin
  FReview := Review;
end;

destructor TSummary.Destroy;
begin

  inherited;
end;

function TSummary.GetSummary: iSummary;
begin
  Result := Self;
end;

class function TSummary.New(Review: iReview): iSummary;
begin
  Result := Self.Create(Review);
end;

function TSummary.Parameters: iParameters<iSummary>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iSummary>.New(Self);
  Result := FParameters;
end;

end.
