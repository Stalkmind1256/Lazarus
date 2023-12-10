uses crt;
Type
inter=integer;
Link=^turn;
turn=record
elem:inter;
Next: Link;
end;
Var left,right,a:Link;
znach:inter;
ch:char;

Procedure sozd(Var left,right:link);
begin
Left:=nil;
Right:=nil;
end;

procedure Add(var right:Link; znach1:inter);
var
c:Link;
begin
New(c);
c^.next:=right;
c^.elem:=znach1;
right:=c;

end;
Procedure FreeMemory(left1:Link);
var
c:Link;
begin
while left1<>nil do
begin
c:=left1;
left1:=left1^.next;
Dispose(c);
end;
end;

procedure Vivid(left1:Link);
begin
if left1=nil then
begin
writeln('Очередь пуста. ');
exit;
end;
while left1<>nil do
begin
Write(left1^.elem, ' ');
left1:=left1^.next
end;
end;

procedure del;
var c:link;
begin
c:=left^.Next;
left:=c;
end;

begin;
repeat
clrscr;
Writeln('Программа для работы с очередями. ');
Writeln('Выберите желаемое действие: ');
Writeln('1) Добавить элемент. ');
Writeln('2) Вывод очереди. ');
Writeln('3) Удаление элемента ');
Writeln('4) Выход. ');
writeln;
ch:=readkey;
case ch of

'1':begin
Writeln('Vvedite element kotori hotite dobavit');
readln(znach);
Add(left,znach);

end;

'2': begin
clrscr;
Vivid(left);
readkey;

end;

'3':begin
del;
writeln('Element udalen');
end;

end;

until ch='4';

freememory(a);
end.
