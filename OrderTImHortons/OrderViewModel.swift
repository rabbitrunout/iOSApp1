import Foundation
import Combine
import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var orders: [CoffeeOrder] = [] {
        didSet { saveOrders() }
    }

    private let ordersKey = "savedOrders"

    init() {
        loadOrders()
    }

    func addOrder(_ order: CoffeeOrder) {
        orders.insert(order, at: 0)
    }

    func deleteOrder(at offsets: IndexSet) {
        orders.remove(atOffsets: offsets)
    }

    func deleteOrder(_ order: CoffeeOrder) {
        orders.removeAll { $0.id == order.id }
    }

    private func saveOrders() {
        if let encoded = try? JSONEncoder().encode(orders) {
            UserDefaults.standard.set(encoded, forKey: ordersKey)
        }
    }

    private func loadOrders() {
        if let data = UserDefaults.standard.data(forKey: ordersKey),
           let decoded = try? JSONDecoder().decode([CoffeeOrder].self, from: data) {
            self.orders = decoded
        } else {
            self.orders = CoffeeOrder.sampleOrders
        }
    }
}
