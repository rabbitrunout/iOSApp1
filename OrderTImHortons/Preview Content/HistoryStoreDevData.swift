//
//  HistoryStoreDevData.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-24.
//

import Foundation

extension OrdersHistoryStore {
    mutating func createDevData() {
        orderDays = [
            OrderDay(
                date: Date().addingTimeInterval(-86400),
                orders: [
                    CoffeeOrder(employeeName: "Irina", coffeeType: "Latte"),
                    CoffeeOrder(employeeName: "Alex", coffeeType: "Cappuccino"),
                    CoffeeOrder(employeeName: "Maria", coffeeType: "Espresso")
                ]
            ),
            OrderDay(
                date: Date().addingTimeInterval(-86400 * 2),
                orders: [
                    CoffeeOrder(employeeName: "Olivia", coffeeType: "Mocha"),
                    CoffeeOrder(employeeName: "John", coffeeType: "Americano")
                ]
            )
        ]
    }
}

