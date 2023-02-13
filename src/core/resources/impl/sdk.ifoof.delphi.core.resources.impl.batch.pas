unit sdk.ifoof.delphi.core.resources.impl.batch;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TBatch = class(TInterfacedObject, iBatch)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iBatch>;
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iBatch;
    function ListBatchOperationResults: iBatch;
    function Parameters: iParameters<iBatch>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TBatch.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TBatch.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

destructor TBatch.Destroy;
begin

  inherited;
end;

function TBatch.ListBatchOperationResults: iBatch;
begin
  Result := Self;
end;

class function TBatch.New(Catalog: iCatalog): iBatch;
begin
  Result := Self.Create(Catalog);
end;

function TBatch.Parameters: iParameters<iBatch>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iBatch>.New(Self);
  Result := FParameters;
end;

end.
