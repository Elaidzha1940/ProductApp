//  /* 
//
//  Project: Product
//  File: ProductModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.10.2024
//
//  */

import Foundation

// Модель данных для продукта, который будет загружаться из API
struct Product: Identifiable, Codable {
    let id: Int           // Уникальный идентификатор товара
    let title: String     // Название товара
    let price: Double     // Цена товара
    let stock: Int        // Количество товара в наличии
    let thumbnail: String // URL миниатюры изображения товара
}
