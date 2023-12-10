unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
 var
   tf: TextFile;
   s: String;
begin
   if Edit1.Text = '' then exit;
   s:= Edit1.Text;
   AssignFile(tf, 'mytext.txt');
   try
     if not FileExists('mytext.txt') then Rewrite(tf)
     else Append(tf);
     Writeln(tf,s);
     Edit1.Text:= '';
   finally
     CloseFile(tf);
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  tf: TextFile;
  s: String;
begin
  if not FileExists('mytext.txt') then
  begin
    ShowMessage('File does not exist');
    Exit;
  end;

  Memo1.Clear;

  AssignFile(tf, 'mytext.txt');
  try
    Reset(tf);
    while not Eof(tf) do
    begin
      Readln(tf, s);
      Memo1.Lines.Add(s);
    end;
  finally
    CloseFile(tf);
  end;
end;

end.

