unit sdk.ifoof.delphi.core.resources.impl.interruption;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.model.entity.interruption,
  sdk.ifoof.delphi.core.http.interfaces;

type
  TInterruption = class(TInterfacedObject, iInterruption)
  private
    FMerchant: iMerchant;
    FParameters: iParameters<iInterruption>;
    FJSON: String;
    FHTTP: iHTTPClient;

    const
      MERCHANTINT = '/merchants/%s/interruptions';
      MERCHANTINTDELETE = '/merchants/%s/interruptions/%s';
  public
    constructor Create(Merchant: iMerchant);
    destructor Destroy; override;
    class function New(Merchant: iMerchant): iInterruption;
    function ListMerchantsInterruptions: TObjectList<TRespInterruption>;
    function CreateInterruption(Value: TRespInterruption) : TRespInterruption;
    function DeleteInterruption: iInterruption;
    function Parameters: iParameters<iInterruption>;
    function &End: iMerchant;
  end;

implementation

{ TMyClass }

function TInterruption.&End: iMerchant;
begin
  Result := FMerchant;
end;

constructor TInterruption.Create(Merchant: iMerchant);
begin
  FMerchant := Merchant;
end;

function TInterruption.CreateInterruption(Value: TRespInterruption) : TRespInterruption;
begin
  FHTTP.Token('')
    .Body(Value.ToJson.ToString)
    .Post(Format(MERCHANTINT, [Parameters.MerchantId])).Content(FJSON);

  Result := TRespInterruption.New.ToObject(FJSON);
end;

function TInterruption.DeleteInterruption: iInterruption;
begin
  Result := Self;
  FHTTP.Token('').Delete(Format(MERCHANTINTDELETE, [FParameters.MerchantId, FParameters.InterruptionId]));
end;

destructor TInterruption.Destroy;
begin

  inherited;
end;

function TInterruption.ListMerchantsInterruptions: TObjectList<TRespInterruption>;
begin
  FHTTP.Token('').Get(Format(MERCHANTINT, [FParameters.MerchantId])).Content(FJSON);
  Result := TRespInterruption.New.ToList(FJSON);
end;

class function TInterruption.New(Merchant: iMerchant): iInterruption;
begin
  Result := Self.Create(Merchant);
end;

function TInterruption.Parameters: iParameters<iInterruption>;
begin
  if not Assigned(FParameters) then
    FParameters := TParameters<iInterruption>.New(Self);
  Result := FParameters;
end;

end.
