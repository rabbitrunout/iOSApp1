import Foundation
import Combine  // <- обязательно для ObservableObject

class OrderViewModel: ObservableObject {
    @Published var orders: [CoffeeOrder] = CoffeeOrder.sampleOrders

    func addOrder(_ order: CoffeeOrder) {
        orders.append(order)
    }

    func deleteOrder(_ order: CoffeeOrder) {
        orders.removeAll { $0.id == order.id }
    }
}
