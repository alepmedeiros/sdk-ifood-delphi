unit sdk.ifoof.delphi.model.entity.unsellablelitemsList;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TUnsellableItems = class
  private
    FId: String;
    FProductId: String;
    FRestrictions: String;
  public
    property Id: String read FId write FId;
    property ProductId: String read FProductId write FProductId;
    property Restrictions: String read FRestrictions write FRestrictions;

    class function New: TUnsellableItems;
  end;

  TToppings = class
  private
    FId: String;
    FRestrictions: TList<String>;
  public
    property Id: String read FId write FId;
    property Restrictions: TList<String> read FRestrictions write FRestrictions;

    class function New: TToppings;
  end;

  TCrusts = class
  private
    FId: String;
    FRestrictions: TList<String>;
  public
    property Id: String read FId write FId;
    property Restrictions: TList<String> read FRestrictions write FRestrictions;

    class function New: TCrusts;
  end;

  TUnsellablePizzaItems = class
  private
    FToppings: TObjectList<TToppings>;
  public
    property Toppings: TObjectList<TToppings> read FToppings write FToppings;

    class function New: TUnsellablePizzaItems;
  end;

  TEdges = class
  private
    FId: String;
    FRestrictions: TList<String>;
  public
    property Id: String read FId write FId;
    property Restrictions: TList<String> read FRestrictions write FRestrictions;

    class function New: TEdges;
  end;

  TSizes = class
  private
    FId: String;
    FRestrictions: TList<String>;
  public
    property Id: String read FId write FId;
    property Restrictions: TList<String> read FRestrictions write FRestrictions;

    class function New: TSizes;
  end;

  TCategories = class
  private
    FId: String;
    FStatus: String;
    FTemplate: String;
    FRestrictions: String;
    FUnsellableItems: TObjectList<TUnsellableItems>;
    FCrusts: TObjectList<TCrusts>;
    FEdges: TObjectList<TEdges>;
  public
    property Id: String read FId write FId;
    property Status: String read FStatus write FStatus;
    property Template: String read FTemplate write FTemplate;
    property Restrictions: String read FRestrictions write FRestrictions;
    property UnsellableItems: TObjectList<TUnsellableItems> read FUnsellableItems write FUnsellableItems;
    property Crusts: TObjectList<TCrusts> read FCrusts write FCrusts;
    property Edges: TObjectList<TEdges> read FEdges write FEdges;

    class function New: TCategories;
  end;

  TRespUnsellablelitemsList = class
  private
    FConverter: TConverterJSONObject<TRespUnsellablelitemsList>;
    FCategories: TObjectList<TCategories>;
  public
    property Categories: TObjectList<TCategories> read FCategories write FCategories;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespUnsellablelitemsList;
    function Converter: TConverterJSONObject<TRespUnsellablelitemsList>;
  end;

implementation

{ TRespUnsellablelitemsList }

function TRespUnsellablelitemsList.Converter: TConverterJSONObject<TRespUnsellablelitemsList>;
begin
  Result := FConverter;
end;

constructor TRespUnsellablelitemsList.Create;
begin
  FConverter:= TConverterJSONObject<TRespUnsellablelitemsList>.New(self);
end;

destructor TRespUnsellablelitemsList.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TRespUnsellablelitemsList.New: TRespUnsellablelitemsList;
begin
  Result := Self.Create;
end;

{ TCategories }

class function TCategories.New: TCategories;
begin
  Result := Self.Create;
end;

{ TUnsellableItems }

class function TUnsellableItems.New: TUnsellableItems;
begin
  Result := Self.Create;
end;

{ TUnsellablePizzaItems }

class function TUnsellablePizzaItems.New: TUnsellablePizzaItems;
begin
  Result := Self.Create;
end;

{ TToppings }

class function TToppings.New: TToppings;
begin
  Result := Self.Create;
end;

{ TCrusts }

class function TCrusts.New: TCrusts;
begin
  Result := Self.Create;
end;

{ TEdges }

class function TEdges.New: TEdges;
begin
  Result := Self.Create;
end;

{ TSizes }

class function TSizes.New: TSizes;
begin
  Result := Self.Create;
end;

end.
