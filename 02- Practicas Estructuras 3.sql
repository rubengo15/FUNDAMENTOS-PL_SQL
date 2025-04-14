/
declare
    v_dni_sinletra number;
    v_resultado number;

BEGIN
    v_dni_sinletra := &dni;
    v_resultado := ( (round(v_dni_sinletra / 23) * 23) - v_dni_sinletra);
    IF (v_resultado = 0) THEN
    DBMS_OUTPUT.PUT_LINE('T');
    elsif (v_resultado = 1) THEN
    DBMS_OUTPUT.PUT_LINE('R');
    elsif (v_resultado = 2) THEN
    DBMS_OUTPUT.PUT_LINE('W');
    elsif (v_resultado = 3) THEN
    DBMS_OUTPUT.PUT_LINE('A');
    elsif (v_resultado = 4) THEN
    DBMS_OUTPUT.PUT_LINE('G');
    elsif (v_resultado = 5) THEN
    DBMS_OUTPUT.PUT_LINE('M');
    elsif (v_resultado = 6) THEN
    DBMS_OUTPUT.PUT_LINE('Y');
    elsif (v_resultado = 7) THEN
    DBMS_OUTPUT.PUT_LINE('F');
    elsif (v_resultado = 8) THEN
    DBMS_OUTPUT.PUT_LINE('P');
    elsif (v_resultado = 9) THEN
    DBMS_OUTPUT.PUT_LINE('D');
    elsif (v_resultado = 10) THEN
    DBMS_OUTPUT.PUT_LINE('X');
    elsif (v_resultado = 11) THEN
    DBMS_OUTPUT.PUT_LINE('B');
    elsif (v_resultado = 12) THEN
    DBMS_OUTPUT.PUT_LINE('N');
    elsif (v_resultado = 13) THEN
    DBMS_OUTPUT.PUT_LINE('J');
    elsif (v_resultado = 14) THEN
    DBMS_OUTPUT.PUT_LINE('Z');
    elsif (v_resultado = 15) THEN
    DBMS_OUTPUT.PUT_LINE('S');
    elsif (v_resultado = 16) THEN
    DBMS_OUTPUT.PUT_LINE('Q');
    elsif (v_resultado = 17) THEN
    DBMS_OUTPUT.PUT_LINE('V');
    elsif (v_resultado = 18) THEN
    DBMS_OUTPUT.PUT_LINE('H');
    elsif (v_resultado = 19) THEN
    DBMS_OUTPUT.PUT_LINE('L');
    elsif (v_resultado = 20) THEN
    DBMS_OUTPUT.PUT_LINE('C');
    elsif (v_resultado = 21) THEN
    DBMS_OUTPUT.PUT_LINE('K');
    elsif (v_resultado = 22) THEN
    DBMS_OUTPUT.PUT_LINE('E');
    elsif (v_resultado = 23) THEN
    DBMS_OUTPUT.PUT_LINE('T');
    end if;
end;
/
undefine dni;