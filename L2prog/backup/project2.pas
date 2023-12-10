program Queue;

const
  MAX_SIZE = 10;


 type Queur = record
    data: array[1..MAX_SIZE] of Integer;
    front: Integer;
    rear: Integer;
  end;

procedure InitQueue(var q: Queur);
begin
  q.front := 0;
  q.rear := 0;
end;

function IsEmpty(q: Queur): Boolean;
begin
  IsEmpty := (q.front = q.rear);
end;

function IsFull(q: Queur): Boolean;
begin
  IsFull := ((q.rear + 1) mod MAX_SIZE = q.front);
end;

procedure Enqueue(var q: Queur; x: Integer);
begin
  if IsFull(q) then
    writeln('Очередь полна')
  else begin
    q.rear := (q.rear + 1) mod MAX_SIZE;
    q.data[q.rear] := x;
  end;
end;

function Dequeue(var q: Queur): Integer;
begin
  if IsEmpty(q) then begin
    writeln('Очередь пуста');
    Dequeue := -1;
  end
  else begin
    q.front := (q.front + 1) mod MAX_SIZE;
    Dequeue := q.data[q.front];
  end;
end;

procedure PrintQueue(q: Queur);
var
  i: Integer;
begin
  for i := (q.front + 1) mod MAX_SIZE to q.rear do
    write(q.data[i], ' ');
  writeln;
end;

var
  q: Queur;
  i: Integer;

begin
  InitQueue(q);

  for i := 1 to 5 do
    Enqueue(q, i);

  PrintQueue(q);

  for i := 1 to 3 do
    writeln(Dequeue(q));

  PrintQueue(q);
end.
