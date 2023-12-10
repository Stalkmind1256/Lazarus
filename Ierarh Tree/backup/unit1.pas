unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    bNewNode: TButton;
    bNewChildNode: TButton;
    bDelete: TButton;
    bEdit: TButton;
    bSort: TButton;
    bCollapse: TButton;
    bExpand: TButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    TreeView1: TTreeView;
    procedure bCollapseClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bExpandClick(Sender: TObject);
    procedure bNewChildNodeClick(Sender: TObject);
    procedure bNewNodeClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bNewNodeClick(Sender: TObject);
var
NodeCaption: string;
NewNode: TTreeNode;
begin
NodeCaption:= '';
if not InputQuery('Ввод заголовка', 'Введите заголовок раздела',
NodeCaption) then exit;
NewNode:= TreeView1.Items.Add(nil, NodeCaption);
NewNode.ImageIndex:=0;
end;

procedure TForm1.bSortClick(Sender: TObject);
begin
  TreeView1.AlphaSort;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  reeView1.SaveToFile('MyLibrary.dat');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
i: integer;
begin
   if FileExists('MyLibrary.dat') then
TreeView1.LoadFromFile('MyLibrary.dat');
for i:= 0 to TreeView1.Items.Count-1 do
if TreeView1.Items[i].Parent=nil then TreeView1.Items[i].ImageIndex:=0
else TreeView1.Items[i].ImageIndex:=1;
end;

procedure TForm1.bNewChildNodeClick(Sender: TObject);
var
NodeCaption: string;
NewNode: TTreeNode;
begin
   NodeCaption:= '';
if not InputQuery('Ввод заголовка', 'Введите заголовок подраздела',
NodeCaption) then exit;
NewNode:= TreeView1.Items.AddChild(TreeView1.Selected, NodeCaption);
if NewNode.Parent = nil then NewNode.ImageIndex:=0
else NewNode.ImageIndex:=1;
end;

procedure TForm1.bDeleteClick(Sender: TObject);
begin
     if TreeView1.Selected <> nil then
TreeView1.Items.Delete(TreeView1.Selected);
end;

procedure TForm1.bCollapseClick(Sender: TObject);
begin
  TreeView1.FullCollapse;
end;

procedure TForm1.bEditClick(Sender: TObject);
var
NodeCaption: string;
begin
   NodeCaption:= '';
if not InputQuery('Ввод заголовка', 'Введите новый заголовок',
NodeCaption) then exit;
TreeView1.Selected.Text:= NodeCaption;
end;

procedure TForm1.bExpandClick(Sender: TObject);
begin
  TreeView1.FullExpand;
end;

end.

