unit sumOfSquare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function sumOfSquares(n : integer) : integer;
var i : integer;
begin
  	result := 0;
    for i := 1 to n do
    		result := result + (i * i);
end;

function squareOfSum(n : integer) : integer;
var i : integer;
		sum : integer;
begin
		sum := 0;
    for i := 1 to n do
      	sum := sum + i;
    result := sum * sum;
end;

procedure TForm1.Button1Click(Sender: TObject);
var n: integer;
    result : integer;
begin
		n := strToInt(Edit1.Text);
    result := squareOfSum(n) - sumOfSquares(n);
    showMessage('The difference is: ' + intToStr(squareOfSum(n)) + ' - ' + intToStr(sumOfSquares(n)) + '=' + intToStr(result));
end;

end.
