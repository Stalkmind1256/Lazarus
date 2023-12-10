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
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  s1:TStringList;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  s1:= TStringList.Create;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     s1.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if Edit1.Text = '' then exit;
s1.Add(Edit1.Text);
Edit1.Text:= '';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if s1.Count > 0 then
ShowMessage(s1[s1.Count - 1]);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  s1.SaveToFile('mytext.txt');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if FileExists('mytext.txt') then
     s1.LoadFromFile('mytext.txt')
end;

end.

