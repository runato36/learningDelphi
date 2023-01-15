unit simpleCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Btn7: TButton;
    Btn6: TButton;
    Btn5: TButton;
    Btn4: TButton;
    Btn3: TButton;
    Btn2: TButton;
    Btn1: TButton;
    Btn0: TButton;
    Btn8: TButton;
    Btn9: TButton;
    BtnPlus: TButton;
    BtnMinus: TButton;
    BtnMult: TButton;
    BtnDiv: TButton;
    BtnEq: TButton;
    Result: TEdit;
    BtnClear: TButton;
    BtnDot: TButton;
    procedure Btn0Click(Sender: TObject);
    procedure BtnDotClick(Sender: TObject);
    procedure BtnPlusClick(Sender: TObject);
    procedure BtnMinusClick(Sender: TObject);
    procedure BtnMultClick(Sender: TObject);
    procedure BtnDivClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnEqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    r: double;
    w: string;
    dotentered: Boolean;
    startnew: Boolean;
    lastop, nextToLastOp: char;
    Procedure AddDigit(c: char);
    Procedure HandleOp(c: char);
    procedure Reset;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Procedure TForm1.Reset; // reset btm
  begin
    w := '';
    dotEntered := false;
    r := 0.0;
    result.text := '';
    startNew := false;
    lastOp:=' ';
  end;


Procedure TForm1.AddDigit(c : char); //Used pressed a digit
Begin
  If startNew = true then 
  	reset;

  result.text := result.text + c;
  w := w + c;
end;

Procedure TForm1.HandleOp(c : char); //User pressed an operator
var x : double;
Begin
  If startNew = true then 
	  reset;

  If length(w) > 0 then 
  Begin
    x := strtofloat(w);
    If lastop <> ' ' then 
    Begin
      case lastop of
        '+': r := r+x;
        '-': r := r-x;
        '*': r := r*x;
        '/': r := r/x;
      end;
    end
    else r := x; 

    w := '';
    dotEntered := false;
    nextToLastOp := lastop; 
    lastOp := c;

    If (c in ['*','/']) and (NextToLastOp in ['+','-']) then 
    	result.text := '(' + Result.text + ')';

    result.text := Result.text + c;
  end
  else 
  	beep; 
end;

procedure TForm1.Btn0Click(Sender: TObject);
begin
  If sender is TButton then 
  	If TButton(Sender).name[4] in ['0'..'9'] then
      AddDigit(TButton(sender).name[4])
    else 
    	beep;
end;

procedure TForm1.BtnDotClick(Sender: TObject);
begin
  If startnew then 
  	reset;
  If not dotEntered then  
  begin 
  	AddDigit('.'); 
    dotentered := true; 
  end
  else 
  	beep;
end;

procedure TForm1.BtnPlusClick(Sender: TObject);
begin 
	Handleop('+'); 
end;

procedure TForm1.BtnMinusClick(Sender: TObject);
begin  
	Handleop('-'); 
end;

procedure TForm1.BtnMultClick(Sender: TObject);
begin  
	Handleop('*'); 
end;

procedure TForm1.BtnDivClick(Sender: TObject);
begin  
	Handleop('/'); 
end;

procedure TForm1.BtnClearClick(Sender: TObject);
begin  
	reset;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin  reset;  end;

procedure TForm1.BtnEqClick(Sender: TObject);
begin
  Handleop('=');
  result.text := result.text + floattostr(r);
  startnew := true;   
end;

end.
