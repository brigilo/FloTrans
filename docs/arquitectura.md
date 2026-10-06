# Arquitectura del proyecto FloTrans

## 1. ¿Cómo está organizado el proyecto?

FloTrans está desarrollado como una aplicación web. La parte que ve el usuario está hecha con HTML, CSS y JavaScript, mientras que la información se procesa mediante archivos PHP y se guarda en una base de datos MySQL.

De forma sencilla, el funcionamiento es:

Usuario → Interfaz → PHP → Base de datos

Cuando el usuario realiza una acción en la página, por ejemplo registrar un conductor, la página envía la información al archivo PHP correspondiente. Este procesa la información y la guarda en la base de datos.

## 2. Parte visual del proyecto

Las páginas principales que tiene actualmente el proyecto son:

- `Login.html`: inicio de sesión y registro de usuarios.
- `Dashboard.html`: muestra un resumen de la información del sistema.
- `conductores.html`: permite gestionar los conductores.
- `vehiculos.html`: permite gestionar los vehículos.
- `Rutas.html`: permite gestionar las rutas.

Actualmente la interfaz desarrollada corresponde principalmente al rol Administrador. Los roles Operador y Conductor pueden registrarse, pero sus interfaces específicas todavía están pendientes.

## 3. Archivos PHP

Los archivos PHP se encuentran dentro de la carpeta `api/` y se encargan de recibir y procesar la información enviada desde las páginas.

- `Auth.php`: maneja el inicio de sesión.
- `Registro.php`: procesa el registro de usuarios.
- `conductores.php`: gestiona la información de los conductores.
- `vehiculos.php`: gestiona la información de los vehículos.
- `rutas.php`: gestiona la información de las rutas.
- `dashboard.php`: proporciona la información que se muestra en el dashboard.
- `alertas.php`: consulta información relacionada con las alertas.
- `contratos.php`: gestiona información relacionada con los contratos.
- `session_guard.js`: ayuda a controlar el acceso mediante la sesión.

## 4. Base de datos

La información del proyecto se guarda en una base de datos MySQL llamada `flotrans`.

Las tablas principales son:

- `usuarios`
- `conductores`
- `vehiculos`
- `rutas`
- `contratos`
- `auditoria`

Estas tablas permiten guardar la información necesaria para el funcionamiento del sistema.

## 5. ¿Cómo funciona una operación?

Por ejemplo, cuando el Administrador registra un conductor:

1. Ingresa al módulo de conductores.
2. Diligencia la información del conductor.
3. La página envía los datos al archivo PHP correspondiente.
4. El PHP procesa la información.
5. Los datos se guardan en MySQL.
6. El resultado se muestra nuevamente en la página.

## 6. Estructura del proyecto

```text
flotrans/
├── Dashboard.html
├── Login.html
├── Rutas.html
├── conductores.html
├── vehiculos.html
├── api/
│   ├── Auth.php
│   ├── Registro.php
│   ├── alertas.php
│   ├── conductores.php
│   ├── contratos.php
│   ├── dashboard.php
│   ├── rutas.php
│   ├── vehiculos.php
│   └── session_guard.js
└── .vscode/
    └── launch.json
