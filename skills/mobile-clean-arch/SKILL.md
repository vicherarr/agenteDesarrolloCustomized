---
name: mobile-clean-arch
description: "Generador de código y mejores prácticas para aplicaciones móviles bajo Clean Architecture. Soporta Flutter, React Native/Expo, Kotlin Compose, Swift SwiftUI y ecosistema .NET (MAUI, Blazor Hybrid, Uno/Avalonia) con Offline-First y almacenamiento seguro."
tags: [mobile, clean-architecture, maui, blazor, flutter, react-native, kotlin, swift, offline-first]
---

# HABILIDAD: CLEAN ARCHITECTURE Y BUENAS PRÁCTICAS MÓVILES

Esta habilidad guía la estructura de directorios, capas de software y patrones de código para la aplicación móvil según el framework elegido por el usuario.

---

## 1. Patrones por Lenguaje y Framework

### A. Para .NET MAUI / Blazor Hybrid (C#)
- **MVVM con Toolkit Oficial**:
  ```csharp
  // ViewModel con CommunityToolkit.Mvvm
  public partial class LoginViewModel : ObservableObject
  {
      private readonly IAuthUseCase _authUseCase;

      [ObservableProperty]
      private string _email = string.Empty;

      [ObservableProperty]
      private string _password = string.Empty;

      [ObservableProperty]
      private bool _isBusy;

      public LoginViewModel(IAuthUseCase authUseCase)
      {
          _authUseCase = authUseCase;
      }

      [RelayCommand]
      private async Task LoginAsync()
      {
          if (IsBusy) return;
          try
          {
              IsBusy = true;
              var token = await _authUseCase.ExecuteAsync(Email, Password);
              await SecureStorage.Default.SetAsync("auth_token", token);
              await Shell.Current.GoToAsync("//home");
          }
          finally
          {
              IsBusy = false;
          }
      }
  }
  ```
- **Inyección de Dependencias en `MauiProgram.cs`**:
  ```csharp
  builder.Services.AddSingleton<IAuthRepository, AuthRepository>();
  builder.Services.AddTransient<IAuthUseCase, AuthUseCase>();
  builder.Services.AddTransient<LoginViewModel>();
  builder.Services.AddTransient<LoginPage>();
  ```

### B. Para Flutter (Dart)
- **Capa de Dominio**: Entidades puras y casos de uso con `Either<Failure, T>` (paquete `fpdart` o `dartz`).
- **Gestión de Estado**: `Bloc` o `Cubit` con eventos y estados inmutables (`freezed`).
- **Red y Caché**: `Dio` con interceptor para refresh de token y `Drift` / `Hive` para sincronización offline.

### C. Para React Native con Expo (TypeScript)
- **Módulos Verticales**: Agrupación por características (`features/auth`, `features/products`).
- **Estado**: `Zustand` para estado cliente, `TanStack Query` para caché y sincronización con servidor.
- **Seguridad**: `expo-secure-store` para almacenamiento cifrado de credenciales.

### D. Para Nativo Android (Kotlin + Jetpack Compose)
- **Patrón UDF (Unidirectional Data Flow)** con `StateFlow` y Sealed Interfaces para eventos de UI.
- Inyección de dependencias con **Hilt**.
- Base de datos local con **Room** y consultas reactivas vía `Flow<List<T>>`.

### E. Para Nativo iOS (Swift + SwiftUI)
- Protocolo `@Observable` con `async/await` estructurado y `Actors` para aislamiento de datos.
- Persistencia moderna con **SwiftData** y almacenamiento seguro en **Keychain**.

---

## 2. Reglas Obligatorias de Resiliencia Móvil (Offline-First)

1. **La UI nunca lee directamente de la red**: La UI siempre observa la base de datos local SQLite. La llamada de red actualiza la base de datos local y la UI reacciona en tiempo real.
2. **Cola de Acciones Offline (Outbox Pattern)**:
   - Toda mutación (crear, actualizar, borrar) efectuada sin red se guarda en la tabla `local_sync_queue`.
   - Cada acción genera un `idempotency_key: UUIDv4`.
   - Cuando se recupera la conectividad, el worker de sincronización vacía la cola enviando la cabecera `Idempotency-Key` al backend.
3. **Manejo de Errores Amigable**: La interfaz debe informar claramente si los datos mostrados provienen de caché local y cuándo fue la última sincronización exitosa.
