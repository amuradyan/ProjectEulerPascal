program ProjectEuler;

procedure EvenFibonacciNumbers;

var
  fibPrev: Integer;
  fibCurr: Integer;
  sum: Integer;
begin
  fibPrev := 1;
  fibCurr := 2;
  sum := 0;

  While fibCurr < 4000001 do
    begin
      If (fibCurr mod 2 = 0) then sum := sum + fibCurr;

      fibCurr := fibCurr + fibPrev;
      fibPrev := fibCurr - fibPrev;
    end;

  Write('Even Fibonacci Numbers - ');
  WriteLn(sum);
end;

procedure MultiplesOf3And5;

var
  i: Integer;
  sum: Integer;
begin
  sum := 0;

  For i := 0 to 999 do
  begin
    If (i mod 3 = 0) or (i mod 5 = 0) then sum := sum + i;
  end;

  Write('Sum Of Multiples Of 3 And 5 - ');
  WriteLn(sum);
end;

begin
  MultiplesOf3And5;
  EvenFibonacciNumbers;
  ReadLn;
end.

