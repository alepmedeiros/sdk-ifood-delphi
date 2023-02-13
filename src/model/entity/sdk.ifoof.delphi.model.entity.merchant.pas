unit sdk.ifoof.delphi.model.entity.merchant;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces,
  GBJSON.Attributes,
  sdk.ifoof.delphi.model.entity.address,
  sdk.ifoof.delphi.model.entity.saleschannel;

type
  TRespMerchant = class
  private
    FId: String;
    FName: String;
    FCorporateName: String;
    FDescription: String;
    FAverageTicket: Integer;
    FExclusive: Boolean;
    FType: String;
    FStatus: String;
    FCreateAt: TDatetime;
    FAddress: TAddress;
    FSalesChannel: TSalesChannel;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property CorporateName: String read FCorporateName write FCorporateName;
    property Description: String read FDescription write FDescription;
    property AverageTicket: Integer read FAverageTicket write FAverageTicket;
    property Exclusive: Boolean read FExclusive write FExclusive;
    [JSONProp('type')]
    property &Type: String read FType write FType;
    property Status: String read FStatus write FStatus;
    property CreateAt: TDatetime read FCreateAt write FCreateAt;
    property address: TAddress read FAddress write FAddress;
    property saleschannel: TSalesChannel read FSalesChannel write FSalesChannel;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespMerchant;
    function ToObject(Value: String): TRespMerchant;
    function ToJson: TJSONObject;
    function ToList(Value: String): TObjectList<TRespMerchant>;
  end;

implementation

{ TRespMerchant }

constructor TRespMerchant.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);

  FAddress := TAddress.Create;
  FSalesChannel := TSalesChannel.Create;
end;

destructor TRespMerchant.Destroy;
begin
  FAddress.DisposeOf;
  FSalesChannel.DisposeOf;
  inherited;
end;

class function TRespMerchant.New: TRespMerchant;
begin
  Result := Self.Create;
end;

function TRespMerchant.ToJson: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TRespMerchant>.ObjectToJsonObject(Self);
end;

function TRespMerchant.ToList(Value: String): TObjectList<TRespMerchant>;
begin
  Result := TGBJSONDefault.Serializer<TRespMerchant>.JsonStringToList(Value);
end;

function TRespMerchant.ToObject(Value: String): TRespMerchant;
begin
  Result := TGBJSONDefault.Serializer<TRespMerchant>.JsonStringToObject(Value);
end;

end.
