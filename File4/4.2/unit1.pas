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
    ListBox1: TListBox;
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
  f: file of Integer;
  i: Integer;
begin
  AssignFile(f, 'mytypefile.dat');
  Rewrite(f);
  for i := 0 to 10 do
    Write(f, Random(1000));
  CloseFile(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  f: file of Integer;
  k: Integer;
begin
  if not FileExists('mytypefile.dat') then
    Exit;

  AssignFile(f, 'mytypefile.dat');
  Reset(f);

  while not Eof(f) do
  begin
    Read(f, k);
    ListBox1.Items.Add(IntToStr(k));
  end;

  CloseFile(f);
end;

end.

