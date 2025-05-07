/
-- Bloque anonimo para recuperar el apellido, oficio y salario de empleados
DECLARE
    -- primero declaramos el tipo
    type type_empleado is record(v_apellido varchar2(50), v_oficio VARCHAr2(50), v_salario number);
    -- uso del tipo en una variable
    v_tipo_empleado type_empleado;
BEGIN
    -- guardamos los valores en la variable
    select apellido, oficio, salario into v_tipo_empleado from emp where emp_no = 7839;
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || v_tipo_empleado.v_apellido || ' Oficio: ' || v_tipo_empleado.v_oficio || ' Salario: ' || v_tipo_empleado.v_salario);
end;
/
