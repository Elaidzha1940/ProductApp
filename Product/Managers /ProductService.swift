//  /*
//
//  Project: Product
//  File: ProductService.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.10.2024
//
//  */ 

import Foundation

// Сервис для работы с сетью. Отвечает за загрузку данных о продуктах
class ProductService {
    private let baseURL = "https://dummyjson.com/products" // Базовый URL API
    
    // Асинхронная функция для загрузки продуктов с сервера
    // Возвращает список продуктов для указанной страницы
    func fetchProducts(page: Int) async throws -> [Product] {
        // Формируем URL для запроса с постраничной загрузкой (20 товаров на страницу)
        let url = URL(string: "\(baseURL)?limit=20&skip=\(page * 20)")!
        
        // Загружаем данные с сервера
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Декодируем данные из JSON в массив продуктов
        let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
        
        return productResponse.products
    }
}

// Вспомогательная структура для декодирования списка продуктов из JSON ответа
struct ProductResponse: Codable {
    let products: [Product]
}
