---
name: backend-clean-arch
description: "Generador de código y mejores prácticas para sistemas backend bajo Clean Architecture. Soporta ASP.NET Core (C#), Node.js (NestJS/Fastify), Python (FastAPI), Go y Supabase con validaciones fail-fast, errores RFC 7807 y OAuth2/JWT."
tags: [backend, clean-architecture, aspnet, dotnet, nestjs, fastapi, go, supabase, rfc7807, jwt]
---

# HABILIDAD: CLEAN ARCHITECTURE Y BUENAS PRÁCTICAS BACKEND

Esta habilidad establece las directrices para la construcción del backend, asegurando alta cohesión, bajo acoplamiento y máxima seguridad.

---

## 1. Patrones por Lenguaje y Framework

### A. Para ASP.NET Core Web API (C#) — *Sinergia Total con .NET MAUI*
- **Compartición de Código con la App Móvil**:
  Crear una biblioteca `Shared.Contracts` con referencias a .NET Standard o .NET 8/9:
  ```csharp
  // Shared.Contracts/DTOs/AuthDtos.cs
  namespace Shared.Contracts.DTOs;

  public record LoginRequest(string Email, string Password);
  public record AuthResponse(string AccessToken, string RefreshToken, long ExpiresIn);
  ```
- **Controladores / Minimal APIs Limpios**:
  ```csharp
  app.MapPost("/api/v1/auth/login", async (LoginRequest request, IAuthService authService) =>
  {
      var result = await authService.LoginAsync(request);
      return Results.Ok(result);
  })
  .WithName("Login")
  .WithOpenApi();
  ```
- **Persistencia**: Entity Framework Core con migraciones versionadas y transacciones atómicas.

### B. Para Node.js / TypeScript (NestJS o Fastify)
- **DTOs Fuertemente Tipados**: Validación con `class-validator` y `class-transformer` o esquemas `Zod`.
- **Estructura en Módulos**: Cada módulo encapsula su Controller, Service y Repositorio.
- **ORM**: Prisma o Drizzle ORM con tipos generados automáticamente.

### C. Para Python (FastAPI)
- **Modelos Pydantic v2**: Validación automática de tipos de entrada y salida con serialización rápida.
- **Routers Modulares**: `APIRouter` agrupados por versión (`/api/v1/...`).
- **ORM Asíncrono**: SQLAlchemy 2.0 con `async_session` y migraciones con Alembic.

### D. Para Go (Golang con Gin / Fiber)
- **Organización Estándar Go**:
  - `cmd/api/main.go`: Punto de entrada y cableado de dependencias.
  - `internal/core/domain/`: Entidades y tipos de error.
  - `internal/core/ports/`: Interfaces de servicios y repositorios.
  - `internal/adapters/handlers/`: Controladores HTTP.
  - `internal/adapters/repository/`: Consultas SQL / pgx.

---

## 2. Estándar de Manejo de Errores: RFC 7807 (Problem Details)

Todo error devuelto por la API debe tener el formato estandarizado:

```json
{
  "type": "https://api.miapp.com/errors/validation-failed",
  "title": "Error de validación",
  "status": 422,
  "detail": "Uno o más campos enviados no superan las reglas de validación.",
  "instance": "/api/v1/users",
  "errors": [
    {
      "field": "email",
      "message": "El formato del correo electrónico no es válido."
    }
  ]
}
```

---

## 3. Seguridad de Autenticación y Autorización
1. **Flujo de Tokens**:
   - `access_token`: JWT firmado con algoritmo seguro (RS256 o EdDSA/HS256 con clave de mínimo 256 bits), duración corta (15 minutos).
   - `refresh_token`: Cadena aleatoria criptográfica opaca (o JWT con ID de sesión), almacenada en base de datos con fecha de expiración y revocable al cerrar sesión.
2. **Protección contra ataques**:
   - Rate Limiting en endpoints de login y registro.
   - Hashing seguro de contraseñas con **Argon2id** o **BCrypt** (cost factor mínimo 12).
