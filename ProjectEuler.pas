program ProjectEuler;

Uses math;

type
  IntVector = Array of Integer;
  BoolVector = Array of Boolean;

{ @param limit is exclusive }
function SieveOfEratosthenes(limit: Integer): IntVector;

var
  primes: IntVector;
  lattice: BoolVector;
  i, j, primesSize: Integer;
begin
  If limit < 3 then
  begin
     WriteLn('Limit should be greater than 2');
  end
  else
  begin
    primesSize := 1;
    SetLength(lattice, limit);
    SetLength(primes, primesSize);

    For i := 2 to limit do
    begin
      if lattice[i] = FALSE then
      begin
         j := 2;
         primes[primesSize - 1] := i;
         primesSize := primesSize + 1;
         SetLength(primes, primesSize);

         While j * i < limit do
         begin
           lattice[i * j] := TRUE;
           j := j + 1;
         end;
      end;
    end;
    SetLength(primes, primesSize - 1);

    SieveOfEratosthenes := primes;
  end;
end;

procedure LargestPrimeFactor(number: Int64);

var
  cap, primeFactorsSize, i: Integer;
  fraction: Int64;
  primesOfInterest, primeFactors: IntVector;
begin
  fraction := number;
  cap := ceil(sqrt(number));
  primeFactorsSize := 0;
  SetLength(primeFactors, primeFactorsSize);

  primesOfInterest := SieveOfEratosthenes(cap);

  For i := 0 to Length(primesOfInterest) - 1 do
  begin
    If (fraction mod primesOfInterest[i] = 0) then
    begin
       primeFactorsSize := primeFactorsSize + 1;
       SetLength(primeFactors, primeFactorsSize);
       primeFactors[primeFactorsSize - 1] := primesOfInterest[i];

       While (fraction mod primesOfInterest[i] = 0) do
       begin
         fraction := fraction div primesOfInterest[i];
       end;
    end;
  end;

  WriteLn('Largest Prime Factor - ', primeFactors[primeFactorsSize - 1]);
end;

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

  WriteLn('Even Fibonacci Numbers - ', sum);
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

  WriteLn('Sum Of Multiples Of 3 And 5 - ', sum);
end;

begin
  MultiplesOf3And5;
  EvenFibonacciNumbers;
  LargestPrimeFactor(600851475143);

  ReadLn;
end.

