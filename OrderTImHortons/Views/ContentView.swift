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
            WelcomeView(viewModel: viewModel)   // передаём viewModel
                .tabItem {
                    Label("Welcome", systemImage: "house")
                }

            OrdersListView(viewModel: viewModel)  // список заказов
                .tabItem {
                    Label("Orders", systemImage: "list.bullet")
                }

            AddOrderView(viewModel: viewModel)    // форма добавления
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                }

            OrdersHistoryView(viewModel: viewModel)  // история заказов
                .tabItem {
                    Label("History", systemImage: "clock")
                }
        }
    }
}

#Preview {
    ContentView()
}


