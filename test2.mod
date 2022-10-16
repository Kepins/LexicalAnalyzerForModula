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
  LOOP *) (* zamkniecie komentarza bez otwarcia *)
       WriteLn("Spam")
  END;
  CASE CHR(FromAscii+16) OF
       '0': WriteLn("Aha!")
     | 'A','a': Writeln("Tak?")
  ELSE (* Ten komentarz nie ma zamkniecia
       Writeln("O!")
  END
END test.
