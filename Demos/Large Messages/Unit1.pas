unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DamUnit, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Dam1: TDam;
    _QuestionSaveFile: TDamMsg;
    _QuestionConfirmValues: TDamMsg;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    EdResult: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DamMessages;

procedure TForm1.Button1Click(Sender: TObject);
begin
  case QuestionSaveFile of
    1: EdResult.Text := 'YES';
    2: EdResult.Text := 'NO';
    3: EdResult.Text := 'MORE INFO';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var A: String;

  procedure AddLine(Cod: Integer; Value: Double);
  begin
    A := A + Format('<t:20><c><a>%s</a></c><t:120><r>$ %s</r><t:200>',
      [FormatFloat('0000', Cod), FormatFloat('#,##0.00', Value)])+'<BR>';
  end;

begin
  AddLine(1, 1000);
  AddLine(2, 2500);
  AddLine(3, 150500);

  if QuestionConfirmValues([A]) then
    EdResult.Text := 'TRUE'
  else
    EdResult.Text := 'FALSE';
end;

end.
