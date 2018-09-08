program ProjectEuler;

procedure SumOfMultiplesOf3And5;

var
  i: Integer;
  sum: Integer;
begin
  sum := 0;

  For i := 0 to 999 do
  begin
    If (i mod 3 = 0) or (i mod 5 = 0) then
    begin
       WriteLn(i);
       sum := sum + i;
    end;
  end;

  WriteLn(sum);
  ReadLn;
end;

begin
  SumOfMultiplesOf3And5();
end.

