# Marvel App

Marvel App es una aplicación desarrollada en SwiftUI que utiliza la API REST pública de Marvel para mostrar información detallada del universo Marvel. Con ella, 
puedes explorar una lista de personajes y descubrir las series en las que han participado.

<div style="display: flex; justify-content: center; align-items: center;">
<img src="https://i.postimg.cc/85T0MGRh/home.png" alt="home view" width="250">
<img src="https://i.postimg.cc/sXK0JLmb/loadingview.png" alt="loading view" width="250">
<img src="https://i.postimg.cc/q7sFNq3J/series.png" alt="series view" width="250">
<img src="https://i.postimg.cc/4yd221Fy/splashview.png" alt="splashview" width="250">
<img src="https://i.postimg.cc/1zhTRw47/searchbar.png" alt="search bar" width="250">
<img src="https://i.postimg.cc/FHJ8QDFJ/errorview.png" alt="Descripción de la imagen" width="250">
</div>

## Características

- **Grid:** Organiza vistas de manera ordenada en filas y columnas.
- **API REST:** La aplicación interactúa con una API REST para obtener información sobre los personajes y sus series.
- **Testing:** El proyecto incluye pruebas unitarias y de integración para asegurar la correcta funcionalidad de las principales características.
- **MVVM:** Se ha utilizado el patrón de diseño MVVM para organizar el código, separando la lógica de negocio (Model), la representación de la interfaz de usuario (View) y el manejo de los datos (ViewModel).
- **Combine:** Implementación de Combine para manejar la reactividad de los datos.
- **Async/Await:** Uso de async/await para realizar solicitudes a la API de manera eficiente.
- **Swift Packages:** Uso de ViewInspector para testear nuestras vistas y sub-vistas.
- **TipKit:** Implementación de TipKit para proporcionar consejos útiles al usuario de manera dinámica dentro de la aplicación.
- **RootView:** Uso de estados en la aplicación para el manejo de errores.

## Tecnologías

- SwiftUI
- Xcode
- Grid
- API REST
- Unit Testing
- MVVM
- Combine
- Async/Await
- Swift Packages
- TipKit

## Instalación

1. Clona este repositorio:
   ```bash
   https://github.com/Heandy27/MarvelApp.git
   ```
2. Abre el proyecto en Xcode.
3. Ejecuta el proyecto en un simulador o dispositivo físico.

## Uso

### Listado de personajes:
Al iniciar la aplicación, podrás ver una lista de personajes de Marvel.

### Información de personajes:
Selecciona un personaje para ver información sobre las series en las que ha participado.

## Configuración

- Si al iniciar la aplicación no aparece ningún héroe en el listado, asegúrate de configurar los parámetros `hash`, `ts` y `apikey` en el archivo **NetworkHeroes.swift**.
- Si al hacer tap en un héroe no aparece información sobre las series en las que participó, también debes configurar estos parámetros en el archivo **NetworkSeries.swift**.

**Nota:** Los valores de `hash`, `ts` y `apikey` se encuentran en el archivo **ConstantsApp.swift** del proyecto.

### Ejemplos:

**Configuración en CharactersNetwork.swift:**
```swift
let urlString = "\(ConstantsApp.CONS_API_URL)\(Endpoints.characters.rawValue)?apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)&ts=\(ConstantsApp.TS)"
```

**Configuración en SeriesNetwork.swift:**
```swift
let urlString = "\(ConstantsApp.CONS_API_URL)\(Endpoints.characters.rawValue)/\(id)/series?apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)&ts=\(ConstantsApp.TS)"
```

## Pruebas

Para ejecutar las pruebas del proyecto, sigue estos pasos:

1. Abre el proyecto en Xcode.
2. Presiona `Cmd + U` para ejecutar las pruebas.

<hr></hr>
Gracias por revisar mi app. Si quieres saber más sobre mí o mi trabajo, puedes encontrarme en estas redes social:<br></br>

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/heandy27/) 
[![GitHub](https://img.shields.io/badge/GitHub-%23121011.svg?logo=github&logoColor=white)](https://github.com/Heandy27)
