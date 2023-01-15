unit bounchingBall;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Comctrls, ExtCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DropBtn: TButton;
    Shape1: TShape;
    ResetBtn: TButton;
    TimescaleBar: TTrackBar;
    Label2: TLabel;
    Label1: TLabel;
    CEBar: TTrackBar;
    procedure FormActivate(Sender: TObject);
    procedure DropBtnClick(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    inittop: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
   panel1.doublebuffered := true; 
   inittop := shape1.top;
end;

procedure TForm1.DropBtnClick(Sender: TObject);
var
  v: real;
  nextV: real; 
  c: real;    
  stopped: boolean; 
  lastTop: integer;
  
Begin
  resetbtnclick(sender);
  V := 0;
  stopped := false;
  tag := 0;
  lasttop := 0;
  with shape1 do
  repeat
    nextv := v + 1.0;
    If v >= 0 then
    Begin
      	if (top + round(nextv) >= panel1.height - height) then
        Begin
  	      LastTop := top;
        	top := panel1.height-height;
       		c := sqrt(CEBar.position / CEBar.max); 
        	nextv := - (nextv) * c; 
        	if nextv > -3 then 
          	stopped := true; 
      	end
      	else 
        	top := top + round(nextv);
    end
    else
    Begin
      If top + round(nextv) < 0 then 
      	top := 0
      else
      if lasttop > 0 then
      begin
        top := lasttop;
        lasttop := 0;
        nextv := nextv - 1;
      end
      else
      begin
         top := top + round(nextv);
      end;
    end;
    v := nextv;
    application.processmessages; 
    sleep(timescalebar.max - timescalebar.position);
    if self.tag > 0 then 
    	stopped:=true;
  until stopped;
end;

procedure TForm1.ResetBtnClick(Sender: TObject);
begin
  tag:=1;

  shape1.top:=inittop;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tag:=1;
end;

end.
