# pasteleriaBD
Diseño, Normalización e Implementación de Base de Datos en PostgreSQL.
# Sistema de Base de Datos - Pastelería "El Buen Sabor"

## Caso de Uso
Este proyecto implementa una base de datos relacional para gestionar las operaciones diarias de una pastelería. El sistema permite administrar el catálogo de **Productos** y sus **Categorías**, registrar a los **Clientes** frecuentes, y llevar un control detallado de los **Pedidos** y los artículos específicos que conforman cada venta (**Detalle_Pedidos**).

## Diagrama MER y Normalización
El modelo cumple con la Tercera Forma Normal (3FN), garantizando la integridad referencial y evitando la redundancia de datos. La relación de "Muchos a Muchos" entre Pedidos y Productos se resolvió exitosamente mediante la tabla intermedia `Detalle_Pedidos`.

*(Nota: El diagrama visual en formato imagen/PDF se encuentra adjunto en la entrega final de Moodle).*

## Instrucciones de Ejecución
Para implementar esta base de datos en un entorno local:
1. Abrir **pgAdmin 4** y conectar al servidor PostgreSQL.
2. Crear una nueva base de datos llamada `pasteleria_db`.
3. Abrir la herramienta *Query Tool*.
4. Ejecutar el archivo `script_pasteleria.sql` incluido en este repositorio. El script contiene:
   - Instrucciones DDL para la creación de las 5 tablas con sus PK y FK.
   - Instrucciones DML con 10 registros semilla por tabla.
