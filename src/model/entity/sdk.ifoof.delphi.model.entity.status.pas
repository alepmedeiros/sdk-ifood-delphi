unit sdk.ifoof.delphi.model.entity.status;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces,
  GBJSON.Attributes, sdk.ifoof.delphi.model.enums;

type
  TReopenable = class
  private
    FIdentifier: String;
    FType: String;
    FReopenable: Boolean;
  public
    property Identifier: String read FIdentifier write FIdentifier;
    [JSONProp('type')]
    property &Type: String read FType write FType;
    property Reopenable: Boolean read FReopenable write FReopenable;

    class function New: TReopenable;
  end;

  TMessage = class
  private
    FTitle: String;
    FSubTitle: String;
    FDescription: String;
  public
    property Title: String read FTitle write FTitle;
    property SubTitle: String read FSubTitle write FSubTitle;
    property Description: String read FDescription write FDescription;

    class function New: TMessage;
  end;

  TValidation = class
  private
    FId: String;
    FCode: String;
    FState: String;
    FMessage: TMessage;
  public
    property Id: String read FId write FId;
    property Code: String read FCode write FCode;
    property State: String read FState write FState;
    [JSONProp('message')]
    property &Message: TMessage read FMessage write FMessage;

    constructor Create;
    destructor Destroy; override;
    class function New: TValidation;
  end;


  TRespStatus = class
  private
    FOperation: String;
    FSalesOperation: String;
    FAvailable: Boolean;
    FState: String;
    FReopenable: TReopenable;
    FValidation: TObjectList<TValidation>;
    FMessage: TMessage;
  public
    property Operation: String read FOperation write FOperation;
    property SalesOperation: String read FSalesOperation write FSalesOperation;
    property Available: Boolean read FAvailable write FAvailable;
    property State: String read FState write FState;
    property Reopenable: TReopenable read FReopenable write FReopenable;
    property Validation: TObjectList<TValidation> read FValidation write FValidation;
    [JSONProp('messagem')]
    property &Message: TMessage read FMessage write FMessage;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespStatus;
    function ToObject(Value: String): TRespStatus;
    function ToJson: TJSONObject;
    function ToList(Value: String): TObjectList<TRespStatus>;
  end;

implementation

{ TMerchantStatus }

constructor TRespStatus.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);

  FReopenable:= TReopenable.New;
  FMessage:= TMessage.New;
  FValidation := TObjectList<TValidation>.Create;
end;

destructor TRespStatus.Destroy;
begin
  FReopenable.DisposeOf;
  FMessage.DisposeOf;
  FValidation.DisposeOf;
  inherited;
end;

class function TRespStatus.New: TRespStatus;
begin
  Result := Self.Create;
end;

function TRespStatus.ToJson: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TRespStatus>.ObjectToJsonObject(Self);
end;

function TRespStatus.ToList(Value: String): TObjectList<TRespStatus>;
begin
  Result := TGBJSONDefault.Serializer<TRespStatus>.JsonStringToList(Value);
end;

function TRespStatus.ToObject(Value: String): TRespStatus;
begin
  Result := TGBJSONDefault.Serializer<TRespStatus>.JsonStringToObject(Value);
end;

{ TMerchantReopenable }

class function TReopenable.New: TReopenable;
begin
  Result := Self.Create;
end;

{ TValidation }

constructor TValidation.Create;
begin
  FMessage := TMessage.New;
end;

destructor TValidation.Destroy;
begin
  FMessage.DisposeOf;
  inherited;
end;

class function TValidation.New: TValidation;
begin
  Result := Self.Create;
end;

{ TMessage }

class function TMessage.New: TMessage;
begin
  Result := Self.Create;
end;

end.
