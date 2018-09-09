program ProjectEuler;

{$mode tp} // Switch fpc to TurboPascal mode
{$H+}      // Use AnsiStrings

uses
 TextTestRunner,
 Tests,
 Solutions;

procedure printHeader;
begin
  WriteLn;
  WriteLn(' _______                                    _____    __               ');
  WriteLn('(   _   )                                  |  ___)   \ \              ');
  WriteLn(' | | | | ___   ___  _   __  _____   _____  | |_  _   _\ \   ___  ___  ');
  WriteLn(' | | | |/ _ \ / _ \| | /  \/ __) \ / (   ) |  _)| | | |> \ / __)/ _ \ ');
  WriteLn(' | | | | |_) | (_) ) || || > _) \ v / | |  | |__| |_| / ^ \> _)| |_) )');
  WriteLn(' |_| |_|  __/ \___/ \_   _/\___) > <   \_) |_____)___/_/ \_\___)  __/ ');
  WriteLn('       | |            | |       / ^ \                          | |    ');
  WriteLn('       |_|            |_|      /_/ \_\                         |_|    ');
  WriteLn;
end;

begin
  printHeader;

  Solutions.MultiplesOf3And5;
  Solutions.EvenFibonacciNumbers;
  Solutions.LargestPrimeFactor(600851475143);
  Solutions.LargestPalindromeProduct;

  Tests.RegisterTests;
  RunRegisteredTests;

  ReadLn;
end.

