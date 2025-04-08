# PassGen
> **Generador de contraseñas aleatorias en Bash.**

| PassGen | PassGen -c |
| ------- | ---------- |
|![f](https://github.com/S0ulx3/PassGen/blob/main/PassGen.png)|![f](https://github.com/S0ulx3/PassGen/blob/main/PassGen-1.png)

## Descripción
> **PassGen es un generador de contraseñas aleatorias creado en Bash.**
> **Su objetivo es ofrecer una forma rápida y sencilla de generar contraseñas seguras, con funcionalidades como:**
> - Personalización de la longitud.
> - Inclusión de números, letras (mayúsculas y minúsculas) y símbolos especiales.
> - Opción para copiar automáticamente la contraseña al portapapeles.
> - Icluye un diseño interactivo con colores llamativos para mejorar la experiencia del usuario

## Requisitos
> ### **xclip**
> - El script verifica e instala automáticamente xclip, necesario para la función de copiar al portapapeles.

## Instalación
> Sigue estos pasos para instalar y ejecutar PassGen en tu máquina:
> - Clonar el repositorio:

> ```
> git clone https://github.com/S0ulx3/PassGen
> cd PassGen
> ```
> - Dar permisos de ejecución:
> ```
> chmod +x PassGen.sh
> ```
> - Ejecutar el script:
> ```
> ./PassGen.sh -h
> ```

## Uso
> PassGen se ejecuta desde la terminal y ofrece las siguientes opciones:
> - Menú interactivo: Genera una contraseña con opciones fáciles de seleccionar.
> - Parámetros personalizados: Usa el flag -c para generar una contraseña y copiarla automáticamente al portapapeles.

## Ejemplos:
> Generar una contraseña de 30 caracteres:
> ```
> ./PassGen.sh
> ```
>
> Generar una contraseña de 15 caracteres y copiarla al portapapeles:
>```
> ./PassGen.sh -c 15
> ```

### Contribuciones
> Si tienes ideas, encuentras errores, o deseas colaborar, ¡no dudes en abrir un issue o hacer un fork del repositorio! Tu ayuda será invaluable para mejorar PassGen.
