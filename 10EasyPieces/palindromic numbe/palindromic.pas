unit palindromic;
{
	A palindromic number reads the same both ways. 
	The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.  Find the largest palindrome made from the product of two n-digit numbers.

	Example:

	Input: n = 3;
	Output: 993 x 913 = 906609;

  Condittion:
  1 < n < 5
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  System.math;

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

function isPalindrome(n : integer) : boolean;
var
		str : string;
    i : integer;
begin
  	str := intToStr(n);
    result := true;
    for i := 1 to length(str) div 2 do
				begin
      			if not (str[i] = str[length(str) + 1 - i]) then
        				begin
                  	result := false;
                    break;
                end;
    		end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var n : integer;
		i, j, maxPalindrome, value1, value2 : long;
    maxNDigit, minNDigit : Extended;
begin
		maxPalindrome := 0;
		n := strToInt(Edit1.Text);
    minNDigit := power(10, n - 1);
    maxNDigit := power(10, n) - 1;
    for i := round(minNDigit) to round(maxNDigit) do
    begin
    		for j := i to round(maxNDigit) do
        		begin
              	if isPalindrome(i * j) AND (i * j > maxPalindrome) then
                		begin
                      	maxPalindrome := i * j;
                        value1 := i;
                        value2 := j;
                    end;
            end;
    end;

    ShowMessage('Output : ' + intToStr(value1) + ' x ' + intToStr(value2) + ' = ' + intToStr(maxPalindrome));
      
end;

end.
