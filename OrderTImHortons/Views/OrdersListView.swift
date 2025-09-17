//
//  OrdersListView.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-17.
//

import SwiftUI

struct OrdersListView: View {
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(viewModel.orders) { order in
                        OrderCardView(order: order)
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)
                            .padding(.horizontal)
                            .transition(.move(edge: .bottom).combined(with: .opacity)) // анимация появления
                            .animation(.spring(), value: viewModel.orders)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    delete(order)
                                } label: {
                                    Label("Удалить", systemImage: "trash.fill")
                                }
                            }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Team Coffee Orders")
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
    
    private func delete(_ order: CoffeeOrder) {
        withAnimation {
            viewModel.orders.removeAll { $0.id == order.id }
        }
    }
}

// Карточка заказа с уникальной иконкой
struct OrderCardView: View {
    var order: CoffeeOrder
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(order.employeeName)
                    .font(.title2)
                    .bold()
                
                Text(order.coffeeType)
                    .font(.headline)
                    .foregroundColor(.brown)
            }
            Spacer()
            Image(systemName: iconName(for: order.coffeeType))
                .font(.title2)
                .foregroundColor(color(for: order.coffeeType))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
        )
    }
    
    func iconName(for coffee: String) -> String {
        switch coffee {
        case "Latte": return "cup.and.saucer.fill"
        case "Cappuccino": return "cup.and.saucer"
        case "Espresso": return "cup.and.saucer.fill"   
        case "Americano": return "mug.fill"
        case "Mocha": return "takeoutbag.and.cup.and.straw.fill"
        default: return "cup.and.saucer.fill"
        }
    }
    
    func color(for coffee: String) -> Color {
        switch coffee {
        case "Latte": return .orange
        case "Cappuccino": return .brown
        case "Espresso": return .black
        case "Americano": return .gray
        case "Mocha": return .pink
        default: return .orange
        }
    }
}

// Превью
#Preview {
    OrdersListView(viewModel: OrderViewModel())
}

