//
//  ContentView.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        TabView {
            WelcomeView()
            OrdersListView(viewModel: viewModel)  // список заказов
            AddOrderView(viewModel: viewModel)     // форма добавления заказа
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

// Превью
#Preview {
    ContentView()
}



