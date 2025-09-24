import Foundation

struct OrdersHistoryStore {
    var orderDays: [OrderDay] = []

    init() {
        #if DEBUG
        createDevData()
        #endif
    }

    mutating func addOrder(_ order: CoffeeOrder) {
        let today = Date()
        if let index = orderDays.firstIndex(where: { today.isSameDay(as: $0.date) }) {
            orderDays[index].orders.append(order)
        } else {
            orderDays.insert(OrderDay(date: today, orders: [order]), at: 0)
        }
    }
}

//Auxiliary extension for comparing dates (excluding time)
extension Date {
    func isSameDay(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: otherDate)
    }
}
