unit greatestProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
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

function getGreatestProduct (str : string) : integer;
var i : integer;
		product : integer;
begin
  	result := 0;
    for i := 1 to length(str) - 4 do
		begin
      	product := StrToInt(str[i]) * strToInt(str[i + 1]) * strToInt(str[i + 2])*
        						StrToInt(str[i + 3]) * strToInt(str[i + 1]);
				if product > result then
    				result := product;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var str : string;
		greatestProduct : integer;
begin
		str := Edit1.Text;
    greatestProduct := GetGreatestProduct(str);

    showMessage('The greatest product is: ' + intToStr(greatestProduct));
end;

end.
