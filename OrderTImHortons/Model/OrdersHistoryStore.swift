
//  OrderHistory.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-17.
//

import Foundation

// Один день заказов
struct OrderDay: Identifiable {
    let id = UUID()
    let date: Date
    var orders: [CoffeeOrder] = []
}

// Хранилище истории заказов
struct OrderHistory {
    var orderDays: [OrderDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
    
    mutating func addOrder(_ order: CoffeeOrder) {
        let today = Date()
        
        if let firstDay = orderDays.first, today.isSameDay(as: firstDay.date) {
            print("Добавлен заказ: \(order.employeeName) — \(order.coffeeType)")
            orderDays[0].orders.append(order)
        } else {
            orderDays.insert(
                OrderDay(date: today, orders: [order]),
                at: 0
            )
        }
    }
}

extension OrderHistory {
    mutating func createDevData() {
        let sampleOrders = [
            CoffeeOrder(id: UUID(), employeeName: "Jain", coffeeType: "Latte"),
            CoffeeOrder(id: UUID(), employeeName: "Maria", coffeeType: "Cappuccino"),
            CoffeeOrder(id: UUID(), employeeName: "Alex", coffeeType: "Espresso")
        ]
        
        orderDays = [
            OrderDay(date: Date(), orders: sampleOrders)
        ]
    }
}

// 🔹 Хелпер для сравнения дат (как в твоём примере)
extension Date {
    func isSameDay(as other: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: other)
    }
}
