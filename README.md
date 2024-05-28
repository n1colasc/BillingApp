# Billing App

## Descripción
Este software está diseñado para cumplir un sistema de facturación básico, hecho en .NET Framework 4.8, integrado con una base de datos relacional diseñada en MySQL.

---
## Ventajas

### Lenguaje
Al usar un framework para el lenguaje C#, la codificación de la solución ha permitido usar funciones que simplifican las reglas de desarrollo. Al seguir siendo una herramienta fuertemente tipada, 
podemos detectar facilmente problemas al compilar el programa. Adiciolamente, al contar con la biblioteca de librerias de Microsoft, la integración contra la base de datos ha sido ágil y eficaz.

### Base de datos
Como se indicaba en la descripción, al ser un sistema de facturación "básico" con poca probabilidad de ser escalado a algo más complejo, se ha seleccionado la base de datos relaciona MySQL en MariaDB
con el fin de evitar costos, ya que al ser una tecnología open source podemos usar de forma gratuita sin problemas y tener facilidad en la integración del mismo.

---
## Desventajas

### Lenguaje
En comparativa con .NET Core, el framework seleccionado se queda por detrás en velocidad. Adicionalmente, al seleccionar una versión que no recibe actualizaciones
desde el 18 de abril de 2019, podría presentar fallos de seguridad frente a .NET Core.

### Base de datos
Si por algún motivo el software diseñado supera cierto umbral de datos, la base de datos podría verse afectada en su escalabilidad y rendimiento. Adicional, si se quiere ciertas funciones avanzadas
(que puede brindar SQL server) o escalamiento horizontal (como falicita No-SQL) habría ciertas limitantes.

---
## Arquitectura

### Custom Onion Architecture
La arquitectura por capas personalizada, nos permite tener independencia entre la jerarquía y dependencia del proyecto.

![image](https://github.com/n1colasc/BillingApp/assets/38018367/006b9b91-8e02-485a-a56f-9d27d56e3e89)

### BillingApp
- Proyecto "padre" de la solución, es donde exponemos las API-REST, llaves de entorno ( Web.Config ) y guardamos la documentación nativa de .NET Framework

### BillingBusiness
- Proyecto que maneja la lógica principal del aplicativo. Es donde se manipulan los datos, se llaman utilidades, peticiones a la base de datos y, de ser
  necesario, peticiones a APIs externas.

### BillingDataAccess
- Comunicación directa contra la base de datos, almacenamiento de los CRUD referente a las tablas.

### BillingModel
- Proyecto que maneja todos los modelos y el tipado de los demás proyectos, incluyendo servicios, útiles, modelos de tablas, etc.

---
## Patrones

### Patrones creacionales

Se optó por usar una combinación de diferentes patrones, con el fin de garantizar la legibilidad y facilidad en la integración de la solución. 
De esta forma, entregando un proyecto escalable, organizado y documentado

1. Builder: Es un patrón de diseño creacional que nos permite construir objetos complejos paso a paso. El patrón nos permite producir distintos tipos y representaciones
   de un objeto empleando el mismo código de construcción.
2. Singleton: es un patrón de diseño creacional que nos permite asegurarnos de que una clase tenga una única instancia, a la vez que proporciona un punto de acceso global a dicha instancia.

### Patrones estructurales 
1. Adapter: es un patrón de diseño estructural que permite la colaboración entre objetos con interfaces incompatibles.
2. Proxy: es un patrón de diseño estructural que te permite proporcionar un sustituto o marcador de posición para otro objeto.
   Un proxy controla el acceso al objeto original, permitiéndote hacer algo antes o después de que la solicitud llegue al objeto original.

### Patrones de comportamiento
1. Chain of Responsability: es un patrón de diseño de comportamiento que te permite pasar solicitudes a lo largo de una cadena de manejadores.
   Al recibir una solicitud, cada manejador decide si la procesa o si la pasa al siguiente manejador de la cadena.
