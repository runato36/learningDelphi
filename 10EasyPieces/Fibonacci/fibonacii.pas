unit fibonacii;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject; var key : char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i: integer;
    number, returnValue: integer;
    first, second, sum: integer;
begin
    number := strToInt(Edit1.Text);
    
    if ((number = 1) OR (number = 2)) then
        begin
            returnValue := 1;
        end
    else
        begin
            first := 1;
            second := 1;
            for i := 3 to number do
                begin
                    second := first + second;
                    first := second - first;
                end;
            returnValue := second;
        end;
        
		showmessage('n th fibonacii number is :' + inttostr(returnValue));
end;

procedure TForm1.Edit1Change(Sender: TObject; var key: char);
begin
		if not (key in [#8, '0'..'9']) then
    	showMessage('Invalid Key');
      key := #0;
end;

end.
