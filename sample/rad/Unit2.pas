unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.DateUtils,
  System.Variants,
  System.Generics.Collections,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  model.enums,
  model.token,
  model.loja,
  RESTRequest4D,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  model.interrupcao;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Button4: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    FToken: TToken;
    FLoja: TLoja;
    FLojas: TObjectList<TLoja>;
    FInterrupcoes: TObjectList<TInterrupcao>;
    procedure CriarListaView(Colunas: Array of String; Linhas: Array of String);
  public
    class function New(AWOner: TComponent): TForm2;
    function Validation(Value: TToken): TForm2;
  end;

implementation

uses
  model.status;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  lLoja: TLoja;
  lItem: TListItem;
begin
  Memo1.Lines.Add(TRequest.New.BaseURL(TEndPoint.MERCHANT.ToString)
    .Resource('/merchants').ContentType('application/json')
    .TokenBearer(FToken.AccessToken).Get.Content);

  FLojas := TLoja.New.ToList(Memo1.Text);

  if ListView1.Columns.Count > 0 then
  begin
    ListView1.Columns.Clear;
    ListView1.Items.Clear;
  end;

  ListView1.Columns.Add.Caption := 'id';
  ListView1.Columns.Add.Caption := 'name';
  ListView1.Columns.Add.Caption := 'corporateName';

  for lLoja in FLojas do
  begin
    lItem := ListView1.Items.Add;
    lItem.Caption := lLoja.id;
    lItem.SubItems.Add(lLoja.name);
    lItem.SubItems.Add(lLoja.corporateName);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  lItem: TListItem;
  lLoja: TLoja;
begin
  Memo1.Clear;
  Memo1.Lines.Add(TRequest.New.BaseURL(TEndPoint.MERCHANT.ToString)
    .Resource('/merchants/{merchantId}').AddUrlSegment('merchantId',
    FLojas[0].Id).TokenBearer(FToken.AccessToken).Get.Content);

  lLoja := TLoja.New.ToObject(Memo1.Text);

  if ListView1.Columns.Count > 0 then
  begin
    ListView1.Columns.Clear;
    ListView1.Items.Clear;
  end;

  ListView1.Columns.Add.Caption := 'id';
  ListView1.Columns.Add.Caption := 'name';
  ListView1.Columns.Add.Caption := 'status';

  lItem := ListView1.Items.Add;
  lItem.Caption := lLoja.Id;
  lItem.SubItems.Add(lLoja.name);
  lItem.SubItems.Add(lLoja.status);
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  lInterrupcao: TInterrupcao;
  litem: TListItem;
begin
  Memo1.Clear;
  Memo1.Lines.Add(TRequest.New.BaseURL(TEndPoint.MERCHANT.ToString)
    .Resource('/merchants/{merchantId}/interruptions')
    .AddUrlSegment('merchantId', FLojas[0].Id)
    .TokenBearer(FToken.AccessToken)
    .Get.Content);

  FInterrupcoes := TInterrupcao.New.ToList(Memo1.Text);

  if ListView1.Columns.Count > 0 then
  begin
    ListView1.Columns.Clear;
    ListView1.Items.Clear;
  end;

  ListView1.Columns.Add.Caption := 'id';
  ListView1.Columns.Add.Caption := 'description';
  ListView1.Columns.Add.Caption := 'start';
  ListView1.Columns.Add.Caption := 'end';

  for lInterrupcao in FInterrupcoes do
  begin
    litem := ListView1.Items.Add;
    litem.Caption := lInterrupcao.id;
    litem.SubItems.Add(lInterrupcao.description);
    litem.SubItems.Add(DateTimeToStr(lInterrupcao.start));
    litem.SubItems.Add(DateTimeToStr(lInterrupcao.&end));
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  lItem: TListItem;
  lStatus: TObjectList<TStatus>;
  lStat: TStatus;
begin
  Memo1.Clear;
  Memo1.Lines.Add(TRequest.New.BaseURL(TEndPoint.MERCHANT.ToString)
    .Resource('/merchants/{merchantId}/status').AddUrlSegment('merchantId',
    FLojas[0].Id).TokenBearer(FToken.AccessToken).Get.Content);

  lStatus := TStatus.New.ToList(Memo1.Text);

  if ListView1.Columns.Count > 0 then
  begin
    ListView1.Columns.Clear;
    ListView1.Items.Clear;
  end;

  ListView1.Columns.Add.Caption := 'operation';
  ListView1.Columns.Add.Caption := 'salesChannel';
  ListView1.Columns.Add.Caption := 'available';
  ListView1.Columns.Add.Caption := 'state';

  for lStat in lStatus do
  begin
    lItem := ListView1.Items.Add;
    lItem.Caption := lStat.operation;
    lItem.SubItems.Add(lStat.salesChannel);
    lItem.SubItems.Add(lStat.available.ToString);
    lItem.SubItems.Add(lStat.state);
  end;
end;

procedure TForm2.Button5Click(Sender: TObject);
var
  linterrupcao: TInterrupcao;
  lItem: TListItem;
begin
  linterrupcao:= TInterrupcao.New;
  try
    linterrupcao.description := 'Teste de interrupção da loja';
    linterrupcao.start := now;
    linterrupcao.&end := IncHour(Now, 1);

    Memo1.Lines.Add(
      TRequest.New
      .BaseURL(TEndPoint.MERCHANT.ToString)
      .Resource('/merchants/{merchantId}/interruptions')
      .AddUrlSegment('merchantId',
      FLojas[0].Id).TokenBearer(FToken.AccessToken)
      .ContentType('application/json')
      .AddBody(linterrupcao.ToJSON.ToString)
      .Post.Content);
  finally
     linterrupcao.DisposeOf;
  end;

  linterrupcao := TInterrupcao.New.ToObject(Memo1.Text);

  if ListView1.Columns.Count > 0 then
  begin
    ListView1.Columns.Clear;
    ListView1.Items.Clear;
  end;

  ListView1.Columns.Add.Caption := 'id';
  ListView1.Columns.Add.Caption := 'description';
  ListView1.Columns.Add.Caption := 'start';
  ListView1.Columns.Add.Caption := 'end';

  litem := ListView1.Items.Add;
  litem.Caption := lInterrupcao.id;
  litem.SubItems.Add(lInterrupcao.description);
  litem.SubItems.Add(DateTimeToStr(lInterrupcao.start));
  litem.SubItems.Add(DateTimeToStr(lInterrupcao.&end));
end;

procedure TForm2.Button6Click(Sender: TObject);
var
  lInterrupt: TInterrupcao;
  lResp: IResponse;
begin
  for lInterrupt in FInterrupcoes do
  begin
    lResp :=
    TRequest.New
        .BaseURL(TEndPoint.MERCHANT.ToString)
        .Resource('/merchants/{merchantId}/interruptions/{interruptionId}')
        .AddUrlSegment('merchantId',
        FLojas[0].Id).TokenBearer(FToken.AccessToken)
        .AddUrlSegment('interruptionId ', lInterrupt.id)
        .ContentType('application/json')
        .Delete;

    if lResp.StatusCode = 204 then
      ShowMessage('Interrupção '+ lInterrupt.id +' removida com sucesso!')
    else
      ShowMessage('Erro ao tentar remover a interrupção');
  end;
end;

procedure TForm2.CriarListaView(Colunas, Linhas: array of String);
var
  I: Integer;
begin
  if ListView1.Columns.Count > 0 then
  begin
    ListView1.Columns.Clear;
    ListView1.Items.Clear;
  end;

  for  I := Low(Colunas) to High(Colunas) do
    ListView1.Columns.Add.Caption := Colunas[I];

//  for I := Low(Linhas) to High(Linhas) do

end;

class function TForm2.New(AWOner: TComponent): TForm2;
begin
  Result := Self.Create(AWOner);
end;

function TForm2.Validation(Value: TToken): TForm2;
begin
  Result := Self;
  FToken := Value;
end;

end.
