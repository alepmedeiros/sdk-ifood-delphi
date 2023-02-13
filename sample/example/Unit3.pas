unit Unit3;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  sdk.ifood.Delphi.interfaces,
  sdk.ifood.Delphi;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Fifood: iSDKIfoodDelphi;
  public
    { Public declarations }
    end;

  var
    Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  lCode: String;
begin
  Fifood
    .Resources
      .Authentication
        .OAuth
          .RequestsUserCode(lCode);

  Edit1.Text := lCode;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Fifood := TSDKIfoodDelphi.New;
  Fifood
    .Configuration
      .ClientId('e9825cac-ca84-4af3-a58e-ab31fb1483db')
      .ClientSecret('937rhg5u81gz3jjk1gtignoa7ecihx64tlswyw146stzhawqemzfdfy1ktbgoicr6293r3d8d20hip5l291fkxrf1kev7dradcg');
end;

end.
