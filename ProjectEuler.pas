program ProjectEuler;

Uses math, sysutils;

type
  IntVector = Array of Integer;
  BoolVector = Array of Boolean;

function isPalindrome(number: Int64): Boolean;

var
  stringRep: String;
  i: Integer;
begin
  stringRep := IntToStr(number);
  isPalindrome := TRUE;

  For i := 1 to ceil(((Length(stringRep) - 1) div 2)) + 1 do
  begin
    // Strings are 1-based indexed arrays
    If stringRep[i] <> stringRep[Length(stringRep) + 1 - i] then
    begin
       isPalindrome := FALSE;
       Break;
    end;
  end;
end;

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

{[Largest palindrome product](https://projecteuler.net/problem=4)}
procedure LargestPalindromeProduct;

var
  largestPalindrome: Int64;
  i, j: Integer;
begin
  largestPalindrome := 0;

  For i := 100 to 999 do
      For j := i to 999 do
        If isPalindrome(i * j) then
        begin
           If largestPalindrome < i * j then largestPalindrome := i * j;
        end;

  WriteLn('Largest Palindrome Product - ', largestPalindrome);
end;

{(Largest prime factor)[https://projecteuler.net/problem=3]}
procedure LargestPrimeFactor(number: Int64);

var
  cap, primeFactorsSize, i: Integer;
  primesOfInterest, primeFactors: IntVector;
begin
  cap := ceil(sqrt(number));
  primeFactorsSize := 0;
  SetLength(primeFactors, primeFactorsSize);

  primesOfInterest := SieveOfEratosthenes(cap);

  For i := 0 to Length(primesOfInterest) - 1 do
  begin
    If (number mod primesOfInterest[i] = 0) then
    begin
       primeFactorsSize := primeFactorsSize + 1;
       SetLength(primeFactors, primeFactorsSize);
       primeFactors[primeFactorsSize - 1] := primesOfInterest[i];

       While (number mod primesOfInterest[i] = 0) do
       begin
         number := number div primesOfInterest[i];
       end;
    end;
  end;

  WriteLn('Largest Prime Factor - ', primeFactors[primeFactorsSize - 1]);
end;

{(Even Fibonacci numbers)[https://projecteuler.net/problem=2]}
procedure EvenFibonacciNumbers;

var
  fibPrev, fibCurr, sum: Integer;
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

{(Multiples of 3 and 5)[https://projecteuler.net/problem=1]}
procedure MultiplesOf3And5;

var
  i, sum: Integer;
begin
  sum := 0;

  For i := 0 to 999 do
  begin
    If (i mod 3 = 0) or (i mod 5 = 0) then sum := sum + i;
  end;

  WriteLn('Multiples Of 3 And 5 - ', sum);
end;

begin
  MultiplesOf3And5;
  EvenFibonacciNumbers;
  LargestPrimeFactor(600851475143);
  LargestPalindromeProduct;

  ReadLn;
end.

