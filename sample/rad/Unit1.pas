unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  RESTRequest4D,
  System.JSON,
  Vcl.ExtCtrls,
  ShellApi,
  model.enums,
  model.token, Unit2, model.codigousuario;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Timer1: TTimer;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    lblStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    FReq: iRequest;
    FResp: IResponse;
    FToken: TToken;
    FCodigousuario: TCodigoUsuario;

    function SecondToHora(Second: Cardinal): TDateTime;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lJSON: TJSONObject;
begin
  memo1.Clear;

  Memo1.lines.add(FReq.BaseURL(TEndPoint.AUTENTICATION.ToString)
    .Resource('/oauth/userCode')
    .ContentType('application/x-www-form-urlencoded').AddParam('clientId',
    'e9825cac-ca84-4af3-a58e-ab31fb1483db').Post.Content);

  FCodigousuario := TCodigoUsuario.New.ToObject(Memo1.Text);

  Edit2.Text := FCodigousuario.VerificationUrlComplete;
  Edit3.Text := FCodigousuario.userCode;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//    Memo1.Clear;
//    Memo1.Lines.Add(FReq.BaseURL(TEndPoint.AUTENTICATION.ToString)
//      .Resource('/oauth/token').ContentType('application/x-www-form-urlencoded')
//      .AddParam('grantType', 'authorization_code').AddParam('clientId',
//      'e9825cac-ca84-4af3-a58e-ab31fb1483db').AddParam('clientSecret',
//      '937rhg5u81gz3jjk1gtignoa7ecihx64tlswyw146stzhawqemzfdfy1ktbgoicr6293r3d8d20hip5l291fkxrf1kev7dradcg')
//      .AddParam('authorizationCode', Edit1.Text)
//      .AddParam('authorizationCodeVerifier', FCodigousuario.AuthorizationCodeVerifier).Post.Content);

  FToken := TToken.New.ToObject(Memo1.Text);
  ShowMessage('Token validado por ' +
  FormatDateTime('hh:mm:ss', SecondToHora(FToken.expiresIn)));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  lConsultaLoja: TForm2;
begin
  lConsultaLoja := TForm2.New(Self).Validation(FToken);
  lConsultaLoja.ShowModal;
  lConsultaLoja.DisposeOf;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Timer1.Enabled := true;
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
    Memo1.Clear;
    Memo1.Lines.Add(FReq.BaseURL(TEndPoint.AUTENTICATION.ToString)
      .Resource('/oauth/token')
      .ContentType('application/x-www-form-urlencoded')
      .AddParam('grantType', 'refresh_token').AddParam('clientId',
      'e9825cac-ca84-4af3-a58e-ab31fb1483db').AddParam('clientSecret',
      '937rhg5u81gz3jjk1gtignoa7ecihx64tlswyw146stzhawqemzfdfy1ktbgoicr6293r3d8d20hip5l291fkxrf1kev7dradcg')
      .AddParam('authorizationCode', Edit1.Text)
      .AddParam('authorizationCodeVerifier', FCodigousuario.AuthorizationCodeVerifier)
      .AddParam('refreshToken', FToken.refreshToken)
      .Post.Content);

    FToken.DisposeOf;
    FToken := TToken.New.ToObject(Memo1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FReq := TRequest.New;
end;

function TForm1.SecondToHora(Second: Cardinal): TDateTime;
begin
  Result := StrToTime(FormatFloat(',00', (Second div 3600)) + ':00:00');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  lJSON: String;
  lJSONObjt: TJSONObject;
begin
  try
    FReq
      .BaseURL(TEndPoint.ORDER.ToString)
      .Resource('/events:polling')
      .TokenBearer(FToken.accessToken)
      .Get;

    lblStatus.Caption := 'Aberta';
    lblStatus.Font.Color := clblue;
  except
    lblStatus.Caption := 'Fechada';
    lblStatus.Font.Color := clRed;
  end;
end;

end.
