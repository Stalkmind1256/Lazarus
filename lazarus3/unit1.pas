unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
  Button1: TButton;
  procedure FormClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormClick(Sender: TObject);
var
  i: Integer;
  st: TStringList;
begin
  st:= TStringList.Create;
  try
     for i:= -3 to 3 do begin
        st.Append('10/'+IntToStr(i)+'='+FloatToStr(10/i));
     end;
     ShowMessage(st.Text);
  finally
    st.Free;
  end;

end;

end.

