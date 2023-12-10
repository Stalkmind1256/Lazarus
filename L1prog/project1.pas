Program steck;

type
pitem = ^item;
item = record
data: integer;
prev: pitem
end;

var
top, p: pitem;
i,ke,k,d: integer;

procedure add(x:integer);
begin
  new(p);
  p^.data := x;
  p^.prev := top;
  top := p
end;

procedure delete; //Удаление из стека
begin
  if top<>nil then begin
  p:= top^.prev;
  dispose(top);
  top:= p
  end;
end;

procedure print;
begin
  writeln('Стек:');
  p := top;
  while p <> nil do begin
  write(p^.data, ' ');
  p:= p^.prev;
end;
writeln;
end;

begin
randomize;
top:= nil;
writeln('Введите начальное количество элементов в стеке');
readln(ke);
for i:= 1 to ke do
begin
k:=random(50);
add(k);
end;
d:=1;
while d<>0 do
begin
writeln('Выберите действие:');
writeln('1 – добавить элемент в стек');
writeln('2 – удалить N элементов стека');
writeln('3 – Вывести элементы на экран');
writeln('0 – выход');
readln(d);
case d of
1: begin writeln('Введите элемент');
readln(k);
add(k);
end;
2: begin writeln('Введите количество элементов для удаления');
readln(ke);
for i:=1 to ke do
delete;
end;
3: print
else if d<>0 then writeln('Ошибка ввода');
end;
end;
readln;
end.
