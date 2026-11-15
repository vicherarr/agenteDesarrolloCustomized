---
name: stack-advisor
description: "Asesor interactivo de tecnologías para aplicaciones móviles (iOS/Android/Multiplataforma) y sistemas backend. Guía la elección entre multiplataforma vs nativo 100%, presenta el ecosistema .NET MAUI y Blazor, y sugiere los Top 5 recomendados en cada área."
tags: [stack, mobile, backend, architecture, advisor, dotnet, maui, flutter, react-native, kotlin, swift]
---

# HABILIDAD: ASESOR INTERACTIVO DE STACK (MÓVIL & BACKEND)

Esta habilidad se activa al iniciar un proyecto nuevo o cuando el usuario solicita definir o cambiar las tecnologías a utilizar.

---

## 1. Protocolo de Ejecución Obligatorio

El agente **NUNCA debe asumir ni imponer una tecnología por su cuenta**. Debe presentar las opciones estructuradas al usuario, formular las preguntas clave y orientarlo con recomendaciones técnicas objetivas.

---

## 2. Diálogo Interactivo Paso a Paso

### Paso 1: Pregunta de Alcance de la Aplicación Móvil
El agente debe formular la siguiente consulta:

> *"¿Deseas enfocar la aplicación móvil mediante una solución **Multiplataforma** (un único código para Android e iOS) o prefieres un desarrollo **100% Nativo**?"*

#### Si el usuario elige Multiplataforma:
Presentar y comparar los dos grandes bloques tecnológicos:

1. **Líderes de Mercado General**:
   - **Flutter (Dart)**: Renderizado gráfico autónomo (Impeller/Skia), diseño idéntico en todas las pantallas, excelente rendimiento y comunidad enorme.
   - **React Native con Expo (TypeScript)**: Acceso directo a componentes nativos, ecosistema npm masivo y facilidad para compartir código con la web.
   - **Kotlin Multiplatform / KMP (Kotlin)**: Permite compartir la lógica de negocio y dominio en Kotlin nativo, con opción de UI compartida (Compose Multiplatform) o UI nativa por separado.

2. **Ecosistema .NET / C# (Microsoft)**:
   - **.NET MAUI (C# / XAML)**: El framework multiplataforma nativo oficial de Microsoft. Ideal para compilar en iOS, Android, Windows y macOS con una única base de código, usando C# moderno y el patrón MVVM.
   - **.NET MAUI Blazor Hybrid**: Permite ejecutar componentes web Blazor (Razor, HTML5, CSS3) dentro de un WebView nativo móvil, compartiendo lógica con aplicaciones web y manteniendo acceso 100% al hardware y APIs nativas.
   - **Uno Platform / Avalonia UI**: Frameworks avanzados en C# que ofrecen renderizado píxel a píxel multiplataforma con soporte para WinUI, Fluent Design e incluso compilación a WebAssembly y Linux.

#### Si el usuario elige 100% Nativo:
El agente debe consultar:

> *"¿Deseas desarrollar exclusivamente para **solo Android**, **solo iOS**, o **ambas plataformas por separado** con sus respectivos lenguajes nativos?"*

- **Solo Android**: **Kotlin** con **Jetpack Compose** (MVVM/MVI, Coroutines, Flow, Hilt/Koin, Room).
- **Solo iOS**: **Swift** con **SwiftUI** (MVVM, Concurrency async/await, Combine, SwiftData/CoreData).
- **Ambos por separado**: Proyectos nativos independientes para máximo rendimiento, acceso inmediato a nuevas APIs del sistema operativo y equipos especializados.

---

### Paso 2: Presentación del Top 5 Móvil y Top 5 Backend

El agente presentará los **5 más recomendados en cada área**, justificando la elección según el tipo de aplicación que el usuario desee construir:

#### Top 5 Móvil Global Recomendados:
1. **Flutter (Dart)**: Mejor balance de productividad, diseño UI uniforme y rendimiento en aplicaciones de consumo masivo y fintech.
2. **React Native con Expo (TypeScript)**: La mejor opción si el desarrollador o equipo ya domina JavaScript/TypeScript o busca el menor time-to-market con Expo Application Services (EAS).
3. **.NET MAUI / Blazor Hybrid (C#)**: La opción número 1 indiscutible si el equipo utiliza el stack de Microsoft o se conecta a un backend en .NET, por la capacidad de compartir el 100% de contratos DTOs y validaciones.
4. **Kotlin Multiplatform / KMP (Kotlin)**: Máxima pureza y fidelidad nativa compartiendo la lógica compleja (networking, base de datos local, reglas de negocio) y manteniendo rendimiento nativo puro.
5. **Nativo Puro (Kotlin Compose para Android / Swift SwiftUI para iOS)**: La elección adecuada cuando la app requiere procesamiento intensivo de hardware (cámara en tiempo real, Bluetooth BLE avanzado, realidad aumentada, audio de baja latencia).

#### Top 5 Backend Global Recomendados:
1. **ASP.NET Core Web API (C#)**: Servidor de alto rendimiento (Kestrel), inyección de dependencias nativa, tipado estricto, Entity Framework Core y **sinergia absoluta con .NET MAUI** (compartición directa de librerías de contratos en C#).
2. **Node.js / TypeScript con NestJS o Fastify**: Ideal para sinergia con React Native (TypeScript end-to-end), arquitectura modular empresarial y validación de esquemas con Zod.
3. **Python con FastAPI**: Desarrollo ultrarrápido de APIs REST asíncronas, tipado con Pydantic y documentación OpenAPI interactiva instantánea; excelente para proyectos con componentes de IA o analítica.
4. **Go (Golang con Gin o Fiber)**: Rendimiento sobresaliente, concurrencia nativa ligera (goroutines), mínimo consumo de memoria y binario único autocontenido; ideal para microservicios y alta carga.
5. **Supabase / PostgreSQL (BaaS Relacional)**: Acelerador supremo de lanzamiento con base de datos relacional PostgreSQL completa, autenticación integrada, Storage y políticas de seguridad por fila (RLS). *(Opción empresarial alternativa: Spring Boot con Java/Kotlin).*

---

### Paso 3: Registro de la Elección en el Brain
Una vez que el usuario confirma su elección:
1. Registrar la decisión en `02-DOCS/wiki/decisions.md` creando un nuevo ADR (ej. `ADR-001: Selección de Stack Tecnológico`).
2. Actualizar el estado en `02-DOCS/wiki/index.md`.
3. Activar las habilidades complementarias correspondientes (`skills/mobile-clean-arch/` y `skills/backend-clean-arch/`).
