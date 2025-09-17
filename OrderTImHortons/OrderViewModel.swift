//
//  OrderViewModel.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-17.
//

import Foundation
import Combine   // обязательно для ObservableObject и @Published

class OrderViewModel: ObservableObject {
    @Published var orders: [CoffeeOrder] = [] {
        didSet { saveOrders() }
    }
    
    private let ordersKey = "coffeeOrders"
    
    init() {
        loadOrders()
    }
    
    func addOrder(name: String, coffee: String) {
        let order = CoffeeOrder(id: UUID(), employeeName: name, coffeeType: coffee)
        orders.append(order)
    }
    
    private func saveOrders() {
        if let data = try? JSONEncoder().encode(orders) {
            UserDefaults.standard.set(data, forKey: ordersKey)
        }
    }
    
    private func loadOrders() {
        if let data = UserDefaults.standard.data(forKey: ordersKey),
           let savedOrders = try? JSONDecoder().decode([CoffeeOrder].self, from: data) {
            orders = savedOrders
        } else {
            orders = CoffeeOrder.sampleOrders
        }
    }
}


