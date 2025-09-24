//
//  OrdersHistoryView.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-24.
//

import SwiftUI

struct OrdersHistoryView: View {
    @ObservedObject var viewModel: OrderViewModel

    var groupedOrders: [String: [CoffeeOrder]] {
        Dictionary(grouping: viewModel.orders) { order in
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: order.date)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(groupedOrders.keys.sorted(by: >), id: \.self) { dateKey in
                    Section(header: Text(dateKey).font(.headline)) {
                        ForEach(groupedOrders[dateKey] ?? []) { order in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(order.employeeName)
                                        .font(.body)
                                        .bold()
                                    Text(order.coffeeType)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: iconName(for: order.coffeeType))
                                    .foregroundColor(.brown)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .navigationTitle("History")
        }
    }

    func iconName(for coffee: String) -> String {
        switch coffee {
        case "Latte": return "cup.and.saucer.fill"
        case "Cappuccino": return "cup.and.saucer"
        case "Espresso": return "takeoutbag.and.cup.and.straw.fill"
        case "Americano": return "mug.fill"
        case "Mocha": return "cup.and.saucer.fill"
        default: return "cup.and.saucer"
        }
    }
}
