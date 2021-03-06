unit Solutions;

{$mode tp}
{$H+}

interface

uses
  Math, SysUtils;

function LargestPalindromeProduct: Int64;
function LargestPrimeFactor(number: Int64): Int64;
function EvenFibonacciNumbers: Int64;
function MultiplesOf3And5: Int64;

implementation

type
  Int64Vector = Array of Int64;
  BoolVector = Array of Boolean;

function isPalindrome(number: Int64): Boolean;

var
  stringRep: String;
  i: Int64;
begin
  i := 1;

  stringRep := IntToStr(number);
  isPalindrome := TRUE;
  While i <= ceil64(((Length(stringRep) - 1) div 2)) + Int64(1) do
  begin
    // Strings are 1-based indexed arrays
    If stringRep[i] <> stringRep[Length(stringRep) + Int64(1) - i] then
    begin
       isPalindrome := FALSE;
       Break;
    end;
    i := i + 1;
  end;
end;

{ @param limit is exclusive }
function SieveOfEratosthenes(limit: Int64): Int64Vector;

var
  primes: Int64Vector;
  lattice: BoolVector;
  i, j, primesSize: Int64;
begin
  If limit < 3 then
  begin
     WriteLn('Limit should be greater than 2');
  end
  else
  begin
    primesSize := 1;
    i := 2;
    SetLength(lattice, limit);
    SetLength(primes, primesSize);

    While i <= limit do
    begin
      If lattice[i] = FALSE then
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
      i := i + 1;
    end;
    SetLength(primes, primesSize - 1);

    SieveOfEratosthenes := primes;
  end;
end;

{[Largest palindrome product](https://projecteuler.net/problem=4)}
function LargestPalindromeProduct: Int64;

var
  largestPalindrome: Int64;
  i, j: Int64;
begin
  i := 100;
  largestPalindrome := 0;

  While i <= 999 do
  begin
    j := i;
    While j <= 999 do
    begin
      If isPalindrome(i * j) and (largestPalindrome < i * j) then
         largestPalindrome := i * j;
      j := j + 1;
    end;
    i := i + 1;
  end;

  WriteLn('Largest Palindrome Product - ', largestPalindrome);
  LargestPalindromeProduct := largestPalindrome;
end;

{(Largest prime factor)[https://projecteuler.net/problem=3]}
function LargestPrimeFactor(number: Int64): Int64;

var
  cap, primeFactorsSize, i: Int64;
  primesOfInterest, primeFactors: Int64Vector;
begin
  cap := ceil64(sqrt(number));
  primeFactorsSize := 0;
  i := 0;
  SetLength(primeFactors, primeFactorsSize);

  primesOfInterest := SieveOfEratosthenes(cap);

  While i <= Length(primesOfInterest) - Int64(1) do
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
    i := i + 1;
  end;

  WriteLn('Largest Prime Factor - ', primeFactors[primeFactorsSize - 1]);
  LargestPrimeFactor := primeFactors[primeFactorsSize - 1];
end;

{(Even Fibonacci numbers)[https://projecteuler.net/problem=2]}
function EvenFibonacciNumbers: Int64;

var
  fibPrev, fibCurr, sum: Int64;
  cap: Int64;
begin
  fibPrev := 1;
  fibCurr := 2;
  sum := 0;
  cap := 4000000;

  While fibCurr < cap do
  begin
    If (fibCurr mod 2 = 0) then sum := sum + fibCurr;

    fibCurr := fibCurr + fibPrev;
    fibPrev := fibCurr - fibPrev;
  end;

  WriteLn('Even Fibonacci Numbers - ', sum);
  EvenFibonacciNumbers := sum;
end;

{(Multiples of 3 and 5)[https://projecteuler.net/problem=1]}
function MultiplesOf3And5: Int64;

var
  i, sum: Int64;
begin
  sum := 0;
  i := 0;

  While i <= 999 do
  begin
    If (i mod 3 = 0) or (i mod 5 = 0) then sum := sum + i;
    i := i + 1;
  end;

  WriteLn('Multiples Of 3 And 5 - ', sum);
  MultiplesOf3And5 := sum;
end;

end.

