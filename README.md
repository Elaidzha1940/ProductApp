⌨️ Product Catalog App. 
===== 

###Ru:
- Таргет: iOS 16
  Приложение поддерживает только устройства с iOS 16 и выше, чтобы использовать новые возможности платформы.

- Технологии: Swift, SwiftUI
Приложение написано на Swift с использованием SwiftUI для построения пользовательского интерфейса.

- Архитектура: MVVM (Model-View-ViewModel)
Приложение структурировано по архитектуре MVVM.

     - Model: Описывает данные о продуктах, такие как название, цена, количество и изображение.
     - ViewModel: Управляет состоянием и бизнес-логикой, включая загрузку данных с API и обработку ошибок.
     - View: Отображает список товаров, предоставляет интерфейс для взаимодействия с пользователем.
  
- Асинхронная обработка: Concurrency, MainActor
Для обработки сетевых запросов и работы с асинхронными задачами используется механизм Concurrency (`async/await`). Аннотация `@MainActor` гарантирует, что все операции, связанные с пользовательским интерфейсом, выполняются на главном потоке.

- Функционал:
 1. Загрузка товаров с API: Приложение загружает список товаров постранично (по 20 товаров на страницу) с внешнего API (например, dummyjson.com/products).
 2. Отображение товаров: Список товаров отображает название, цену, количество и уменьшенное изображение (64x64 пикселя).
 3. Обработка ошибок: При возникновении ошибок загрузки, пользователю показывается сообщение с возможностью повторить загрузку.
 4. Pull-to-Refresh: Реализован жест `Pull-to-Refresh` для обновления списка товаров.
 5. Адаптивный интерфейс: Приложение поддерживает динамический размер текста (SizeCategory) и корректно отображает данные в светлой и темной темах.
   
- Интерфейс:
     - Простой и интуитивный список товаров с возможностью скроллинга.
     - Автоматическая адаптация интерфейса к изменениям темы и размера текста на устройстве пользователя.
  
- Асинхронная загрузка и многопоточность:
     - Используются встроенные механизмы Swift (`URLSession` и `async/await`) для загрузки данных и многопоточности, что обеспечивает плавную работу с сетью и корректное обновление пользовательского интерфейса.
  
- Обработка изображений:
     - Все изображения оптимизируются до 64x64 пикселей для экономии памяти и улучшения производительности.
  
- Обработка ошибок:
     - В случае неудачной загрузки данных отображается сообщение об ошибке и предоставляется возможность повторить запрос.
  
- Основные критерии реализации:
     - Правильная работа с сетью и многопоточностью.
     - Корректное отображение данных и оптимизация изображений.
     - Обработка ошибок и взаимодействие с пользователем через жесты (`Pull-to-Refresh`).
     - Адаптивный интерфейс, поддерживающий темные/светлые темы и динамический размер текста.

-----

###En: 
- Target: iOS 16
The app supports devices running iOS 16 and above to leverage the latest platform capabilities.

- Technologies: Swift, SwiftUI
The app is developed using Swift and SwiftUI for building the user interface.

- Architecture: MVVM (Model-View-ViewModel)
The app follows the MVVM architecture.

     - Model: Defines product data, including name, price, quantity, and image.
     - ViewModel: Manages the state and business logic, including fetching data from the API and handling errors.
     - View: Displays the product list and provides an interface for user interaction.
       
- Asynchronous Processing: Concurrency, MainActor
The app uses Swift Concurrency (async/await) for handling network requests and asynchronous tasks. The @MainActor annotation ensures that all UI-related operations are performed on the main thread.

- Functionality:

1. Product Loading from API: The app loads products in a paginated fashion (20 products per page) from an external API (e.g., dummyjson.com/products).
2. Product Display: The product list shows the name, price, quantity, and a resized image (64x64 pixels).
3. Error Handling: If a loading error occurs, an error message is shown with the option to retry.
4. Pull-to-Refresh: The app supports a pull-to-refresh gesture for updating the product list.
5. Adaptive Interface: The app adjusts to dynamic text sizes (SizeCategory) and adapts to both light and dark modes.
   
- User Interface:
     - A simple and intuitive scrollable product list.
     - Automatic adaptation to changes in system theme and text size preferences.

- Asynchronous Data Loading and Multithreading:
     - The app leverages built-in Swift mechanisms (URLSession and async/await) for fetching data and multithreading, ensuring smooth network operations and proper UI updates.
       
- Image Handling:
     - All images are optimized to 64x64 pixels for memory efficiency and improved performance.
       
- Error Handling:
     - In case of a failed data load, the app displays an error message and allows users to retry.
       
- Key Implementation Criteria:
     - Correct network handling with asynchronous processing and multithreading.
     - Proper data display and image optimization.
     - Error handling and interaction with users via pull-to-refresh.
     - Adaptive interface supporting both light/dark themes and dynamic text sizing (SizeCategory).
