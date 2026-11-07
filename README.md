# assembler-codes

Colección de programas en **Assembly x86 (16-bit)** desarrollados durante mi época de auxiliar de docencia, estudiante y en la actualidad (desde el 2013 a la fecha).

## Requisitos previos

Este repositorio contiene programas escritos en ensamblador x86 de 16 bits (entorno MS-DOS). Dado que los sistemas operativos modernos (como Windows de 64 bits y Linux) ya no soportan la ejecución nativa de este tipo de binarios, es necesario utilizar un emulador de DOS.

* **Emulador:** [DOSBox](https://dosbox.com) (disponible para Windows, Linux y macOS).
* **Herramientas de compilación:** `MASM.EXE` / `LINK.EXE` (Microsoft) o `TASM.EXE` / `TLINK.EXE` (Borland), los cuales ya vienen incluidos en este repositorio.

---

## Ejecución

El proceso consiste en montar la carpeta del proyecto dentro de DOSBox para que el emulador pueda leer tus archivos locales de forma segura.

### Linux (Ubuntu/Debian)

1. **Instala DOSBox** desde la terminal ejecutando:
   ```bash
   sudo apt install dosbox
   ```
2. **Inicia el emulador** escribiendo:
   ```bash
   dosbox
   ```
3. **Monta la carpeta** del proyecto dentro de la ventana de DOSBox (reemplaza `/ruta/a/tu/carpeta/asm` por la ruta real donde clonaste este repositorio):
   ```doscon
   mount c /ruta/a/tu/carpeta/asm
   c:
   ```

> **Notas importantes:**
> * En algunos sistemas distribuidos de Linux, la letra de la unidad de montaje puede variar (por ejemplo, usando `mount d ...` en su lugar).
> * El teclado en DOSBox se genera automáticamente con la distribución en inglés. Para cambiarlo al español, ejecuta el comando `keyb sp` dentro de la consola del emulador.

---

## Referencias Técnicas

* La necesidad de usar DOSBox para emular el entorno de 16 bits está documentada formalmente en las guías de configuración de MASM/TASM.  
  [[Referencia 1](https://www.php.cn/faq/2733153.html#1)] [[Referencia 2](https://raw.githubusercontent.com/dosasm/masm-tasm/v0.7.0/README.md#1)]
* Los comandos de montaje de unidades (`mount c ...`) corresponden al estándar para conectar carpetas locales de almacenamiento con DOSBox tanto en Linux como en Windows.
* El flujo de compilación estructurado con TASM y TLINK para la generación correcta de ejecutables se detalla en la documentación técnica oficial de Borland.
