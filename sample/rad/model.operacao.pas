unit model.operacao;

interface

uses
  System.Generics.Collections,
  model.canalvenda;

type
  TOperacao = class
  private
    Fname: String;
    FsalesChannel: TObjectList<TCanalVenda>;
  public
    property name: String read Fname write Fname;
    property salesChannel: TObjectList<TCanalVenda> read FsalesChannel write FsalesChannel;
    constructor Create;
    destructor Destroy; override;
    class function New: TOperacao;
  end;

implementation

constructor TOperacao.Create;
begin
  FsalesChannel:= TObjectList<TCanalVenda>.Create;
end;

destructor TOperacao.Destroy;
begin
  FsalesChannel.DisposeOf;
  inherited;
end;

class function TOperacao.New: TOperacao;
begin
  Result := Self.Create;
end;

end.
