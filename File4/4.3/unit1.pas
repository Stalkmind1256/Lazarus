unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, EditBtn;

type
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    DE: TDirectoryEdit;
    FNE: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
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
  fIn, fOut: File;
  NumRead, NumWritten: Word;
  Buf: array [1..2048] of byte;
  SourceFileName, DestFileName: String;
begin
  if FNE.Text = '' then
  begin
    ShowMessage('Внимание! Требуется указать или выбрать копируемый файл.');
    FNE.SetFocus;
    Exit;
  end;
  if DE.Text = '' then
  begin
    ShowMessage('Внимание! Требуется указать или выбрать папку для копии.');
    DE.SetFocus;
    Exit;
  end;

  SourceFileName := FNE.Text;
  DestFileName := DE.Directory + DirectorySeparator + ExtractFileName(FNE.Text);

  try
    AssignFile(fIn, SourceFileName);
    AssignFile(fOut, DestFileName);

    Reset(fIn, 1);
    Rewrite(fOut, 1);

    if IOResult <> 0 then
    begin
      ShowMessage('Ошибка открытия файлов!');
      Exit;
    end;

    Screen.Cursor := crHourGlass;

    repeat
      BlockRead(fIn, Buf, SizeOf(Buf), NumRead);
      BlockWrite(fOut, Buf, NumRead, NumWritten);
    until (NumRead = 0) or (NumWritten <> NumRead);
  finally
    CloseFile(fIn);
    CloseFile(fOut);
    Screen.Cursor := crDefault;
    ShowMessage('Копирование завершено!');
  end;
end;

end.
