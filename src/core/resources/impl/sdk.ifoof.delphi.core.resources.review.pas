unit sdk.ifoof.delphi.core.resources.review;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.summary,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TReview = class(TInterfacedObject, iReview)
  private
    FSummary: iSummary;
    FParameters: iParameters<iReview>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iReview;
    function ListReviews: iReview;
    function GetReview: iReview;
    function PostReviewReply: iReview;
    function Summary: iSummary;
    function Parameters: iParameters<iReview>;
    function &End: iReview;
  end;

implementation

{ TMyClass }

function TReview.&End: iReview;
begin
  Result := Self;
end;

constructor TReview.Create;
begin

end;

destructor TReview.Destroy;
begin

  inherited;
end;

function TReview.GetReview: iReview;
begin
  Result := Self;
end;

function TReview.ListReviews: iReview;
begin
  Result := Self;
end;

class function TReview.New: iReview;
begin
  Result := Self.Create;
end;

function TReview.Parameters: iParameters<iReview>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iReview>.New(Self);
  Result := FParameters;
end;

function TReview.PostReviewReply: iReview;
begin
  Result := Self;
end;

function TReview.Summary: iSummary;
begin
  if not Assigned(FSummary) then
    FSummary := TSummary.New(Self);
  Result := FSummary;
end;

end.
