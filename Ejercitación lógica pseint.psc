//3)Ejercitaci�n l�gica pseint
//Una empresa de reparto tiene x empleados y reparte en 5 zonas diferentes. ZONA ABCDE
//La empresa necesita un programa  que despligue un men�, que solamente salga al darle a la tercera opci�n.
//1) saber que empleado hizo m�s ventas y sobre que zona
//2) Ver las ventas de un representante ingresado por teclado
//3) salir


Proceso RegistroVentas // Proceso principal a donde llamaremos los sub Procesos
    Definir opcionMenu como Entero;
	
    Repetir
        Escribir  "Men�:";
        Escribir "1. Cargar datos de ventas";
        Escribir "2. Estad�sticas de ventas";
        Escribir "3. Salir";
        Escribir "Ingrese la opci�n deseada:";
        Leer opcionMenu;
		
        Segun opcionMenu Hacer
            1:
                cargaDeDatos();
            2:
                estadisticasDeVentas();
            3:
                Escribir  "Saliendo del programa...";
            De Otro Modo:
                Escribir "Opci�n no v�lida. Intente de nuevo.";
        FinSegun
    Hasta Que opcionMenu = 3
FinAlgoritmo

SubProceso cargaDeDatos
    Definir cantidadEmpleados, i, zona, ventas como Entero;
    Definir cantidadZonas como Entero;
    Definir zonasTrabajo Como Caracter;
	Definir ventasEmpleados Como Entero;
    Dimension ventasEmpleados[100, 5];
    Dimension zonasTrabajo[100, 5];
	
    Escribir  "Ingrese la cantidad de empleados:";
    Leer cantidadEmpleados;
	
    Para i <- 1 Hasta cantidadEmpleados Hacer
        Escribir "Empleado ", i;
        Escribir  "Ingrese la cantidad de zonas en que trabaj� el empleado ", i, ":";
        Leer cantidadZonas;
        Para zona <- 1 Hasta cantidadZonas Hacer
            Escribir "Las opciones de zona son A, B, C, D, E";
            Escribir  "Ingrese la zona en que trabaj� el empleado ", i, ":";
            Leer zonasTrabajo[i, zona];
            Escribir "Ingrese la cantidad de ventas que realiz� en la zona ", zonasTrabajo[i, zona], " el empleado ", i, ":";
            Leer ventasEmpleados[i, zona];
        FinPara
    FinPara
FinSubProceso

SubProceso estadisticasDeVentas
    Definir opcionMenuEstadisticas como Entero;
	
    Repetir
        Escribir "Men� de Estad�sticas:";
        Escribir "1. Ver estad�sticas generales";
        Escribir "2. Ver estad�sticas por empleado";
        Escribir "3. Volver al men� principal";
        Escribir "Ingrese la opci�n deseada:";
        Leer opcionMenuEstadisticas;
		
        Segun opcionMenuEstadisticas Hacer
            1: // Calcular la cantidad total de ventas por zona
				Definir totalVentasPorZona Como Entero;
				Dimension totalVentasPorZona[5];
				totalVentasPorZona <- totalVentasPorZona[i];
				Dimension ventasEmpleados[100,5];
				
				Para i <- 1 hasta cantidadEmpleados Hacer
					Para zona <- 1 hasta cantidadZonas Hacer
						totalVentasPorZona[zona] <- totalVentasPorZona[zona] + ventasEmpleados[i, zona];
					FinPara
				FinPara
				
				// Mostrar la cantidad de ventas por zona
				Escribir "Cantidad de ventas por zona:";
				Para zona <- 1 hasta cantidadZonas Hacer
					Escribir "Zona ", zona, ": ", totalVentasPorZona[zona], " ventas";
				FinPara
				
				// Encontrar al empleado que realiz� m�s ventas
				Definir maxVentas como Entero;
				Definir empleadoMaxVentas como Entero;
				maxVentas <- 0;
				
				Para empleado <- 1 hasta cantidadEmpleados Hacer
					Definir totalVentasEmpleado como Entero;
					totalVentasEmpleado <- 0;
					
					Para zona <- 1 hasta cantidadZonas Hacer
						totalVentasEmpleado <- totalVentasEmpleado + ventasEmpleados[empleado, zona];
					FinPara
					
					Si totalVentasEmpleado > maxVentas Entonces
						maxVentas <- totalVentasEmpleado;
						empleadoMaxVentas <- empleado;
					FinSi
				FinPara
				
				// Mostrar al empleado que realiz� m�s ventas
				Escribir "El empleado ", empleadoMaxVentas, " realiz� el mayor n�mero de ventas con un total de ", maxVentas, " ventas.";
            2:
            3: Escribir "Volviendo al Men� Principal";
            OtroCaso:
                Escribir "Opci�n no v�lida. Intente de nuevo.";   
        FinSegun
		
    Hasta Que opcionMenuEstadisticas = 3;  
FinSubProceso

