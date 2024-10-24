//  /*
//
//  Project: Product
//  File: ProductListViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.10.2024
//
//  */

import SwiftUI

// ViewModel управляет состоянием списка продуктов и логикой загрузки данных
@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []  // Список загруженных продуктов
    @Published var isLoading = false         // Флаг загрузки данных
    @Published var errorMessage: String?     // Сообщение об ошибке, если она произошла
    
    private var currentPage = 0                    // Текущая страница, которая загружается
    private var canLoadMorePages = true            // Флаг, разрешающий загрузку дополнительных страниц
    private let productService = ProductService()  // Экземпляр сервиса для работы с сетью
    
    // Асинхронная функция для загрузки продуктов с сервера
    func loadProducts() async {
        // Проверяем, что загрузка не происходит и доступны дополнительные страницы
        guard !isLoading, canLoadMorePages else { return }
        
        isLoading = true   // Устанавливаем флаг загрузки
        errorMessage = nil // Сбрасываем сообщение об ошибке
        
        do {
            // Загружаем новые продукты и добавляем их в список
            let newProducts = try await productService.fetchProducts(page: currentPage)
            products.append(contentsOf: newProducts)
            
            // Если новых продуктов не пришло, прекращаем дальнейшую загрузку
            if newProducts.isEmpty {
                canLoadMorePages = false
            } else {
                currentPage += 1 // Увеличиваем номер текущей страницы
            }
        } catch {
            // Обработка ошибки загрузки
            errorMessage = "Failed to load data. Please try again."
        }
        
        isLoading = false // Сбрасываем флаг загрузки
    }
    
    // Функция для обновления списка продуктов (Pull-to-Refresh)
    func refreshProducts() async {
        currentPage = 0                        // Сбрасываем текущую страницу
        canLoadMorePages = true                // Разрешаем загрузку страниц
        products = []                          // Очищаем список продуктов
        await loadProducts()                   // Загружаем продукты с первой страницы
    }
}
