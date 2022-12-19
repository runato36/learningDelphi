unit sumOfPrimes;

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

function isPrime(n : integer) : boolean;
var i : integer;
begin
		if n <= 1 then
    		result := false
    else if n <= 3 then
         result := true
    else if n mod 2 = 0 then
         result := false
    else
    		begin
          	result := true;
            for i := 3 to trunc(sqrt(n)) + 1 do
        				begin
              			if n mod i = 0 then
                    		begin
                          	result := false;
                            break
                        end;
		            end;
        end;
end;

function getPrimeSum(n : integer) : integer;
var i : integer;
begin
  	result := 0;
    for i := 2 to n-1 do
    		begin
          	if isPrime(i) then
            		result := result + i;
        end;      
end;

procedure TForm1.Button1Click(Sender: TObject);
var primeSum : integer;
		n : integer;
begin
		n := strToInt(Edit1.Text);
		primeSum := getPrimeSum(n);
		showMessage('The sum of all the primes below ' + intToStr(n) + ' is ' + intToStr(primeSum));    
end;

end.
                     