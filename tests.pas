unit Tests;

{$mode objfpc}
{$H+}

interface

uses
 TestFramework;

type
 TTestCaseLargestPalindromeProduct = class(TTestCase)
 published
   procedure TestResult;
 end;

type
 TTestCaseLargestPrimeFactor = class(TTestCase)
 published
   procedure TestResult;
 end;

type
 TTestCaseEvenFibonacciNumbers = class(TTestCase)
 published
   procedure TestResult;
 end;

type
 TTestCaseMultiplesOf3And5 = class(TTestCase)
 published
   procedure TestResult;
 end;


procedure RegisterTests;


implementation

uses
  SysUtils, Solutions;


procedure RegisterTests;
begin
  TestFramework.RegisterTest(TTestCaseEvenFibonacciNumbers.Suite);
  TestFramework.RegisterTest(TTestCaseLargestPalindromeProduct.Suite);
  TestFramework.RegisterTest(TTestCaseLargestPrimeFactor.Suite);
  TestFramework.RegisterTest(TTestCaseMultiplesOf3And5.Suite);
end;

procedure TTestCaseEvenFibonacciNumbers.TestResult;
begin
  Check(Solutions.EvenFibonacciNumbers = 4613732, 'Correct!');
end;

procedure TTestCaseLargestPalindromeProduct.TestResult;
begin
  Check(Solutions.LargestPalindromeProduct = 906609, 'Correct!');
end;

procedure TTestCaseLargestPrimeFactor.TestResult;
begin
  Check(Solutions.LargestPrimeFactor(600851475143) = 6857, 'Correct!');
end;

procedure TTestCaseMultiplesOf3And5.TestResult;
begin
  Check(Solutions.MultiplesOf3And5 = 233168, 'Correct!');
end;

end.
