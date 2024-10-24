//  /*
//
//  Project: Product
//  File: ProductListView.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.10.2024
//
//  */

import SwiftUI

// Основное представление списка продуктов
struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel() // Инициализация ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                // Перебираем и отображаем продукты из ViewModel
                ForEach(viewModel.products) { product in
                    ProductRowView(product: product) // Используем отдельное представление для строки с продуктом
                }
                // Показываем индикатор загрузки, если данные загружаются
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            // Поддержка жеста Pull-to-Refresh для обновления списка
            .refreshable {
                await viewModel.refreshProducts()
            }
            .navigationTitle("Product Catalog") // Устанавливаем заголовок экрана
            .onAppear {
                // Загружаем данные при первом появлении представления
                Task {
                    await viewModel.loadProducts()
                }
            }
            // Отображение алерта при возникновении ошибки
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Alert(
                    // Сообщение об ошибке с возможностью повторить загрузку
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("Repeat"), action: {
                        Task {
                            await viewModel.loadProducts()
                        }
                    })
                )
            }
        }
    }
}

// MARK: - ProductRowView
// Представление одной строки с продуктом
struct ProductRowView: View {
    let product: Product // Продукт, который нужно отобразить
    
    var body: some View {
        HStack {
            // Загрузка и отображение миниатюры продукта
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64) // Уменьшаем размер изображения до 65x65
            } placeholder: {
                ProgressView() // Отображаем индикатор загрузки, пока изображение не загружено
                    .frame(width: 64, height: 64)
            }
            
            // Отображаем информацию о продукте
            VStack(alignment: .leading) {
                Text(product.title) // Название продукта
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Price: $\(product.price, specifier: "%.2f")") // Цена продукта
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Left: \(product.stock)") // Количество в наличии
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ProductListView()
}
