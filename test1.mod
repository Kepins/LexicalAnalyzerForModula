(********************************************************)
(* Program pokazuje kody ASCII                          *)
(* Kompilacja:                                          *)
(*   m2c -all test.mod -o test                          *)
(* Uruchomienie:                                        *)
(*   ./test                                             *)
(********************************************************)
MODULE test;

FROM InOut IMPORT Write, WriteCard, WriteString, WriteLn;
CONST
  FromAscii = 32;
  ToAscii = 127;
VAR
  i : CARDINAL;
  fl : REAL;
  t : ARRAY[1 .. 10] OF CARDINAL;
  d : RECORD
       rok, miesiac : CARDINAL;
       dzien : CARDINAL;
  END;
BEGIN
  WriteString("Kody"); WriteString(" ASCII");
  WriteLn;
  FOR i := FromAscii TO ToAscii DO
    WriteCard(i, 3);
    Write(' ');
    Write(CHR(i));
    WriteLn
  END;
  fl := 1.1 + 1.0E-2 + 1.0E+2 + 1.0E1; (* liczby rzeczywiste *)
  IF (fl <= 11.11) AND (fl >= 1.111E1) THEN
    WriteString("Zgodnie z oczekiwaniami")
  ELSE
    WriteString("Olaboga!")
  END;
  WriteLn;
  i := 1;
  WHILE i < 5 DO
       WriteLn(i); i := i + 1
  END;
  REPEAT
       WriteLn(i); i := i - 1
  UNTIL i = 1;
  LOOP
       WriteLn("Spam")
  END;
  CASE CHR(FromAscii+16) OF
       '0': WriteLn("Aha!")
     | 'A','a': Writeln("Tak?")
  ELSE
       Writeln("O!")
  END;
  t[10] = 10;
  FOR i := 9 DOWNTO 1 DO t[i] := t[i+1] * i * i END;
  d.rok := 2018; d.dzien := 1;
  d.miesiac := d.dzien * 10
END test.
