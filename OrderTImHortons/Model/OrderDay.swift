//
//  OrderDay.swift
//  OrderTImHortons
//
//  Created by Irina Saf on 2025-09-24.
//

import Foundation

struct OrderDay: Identifiable {
    let id = UUID()
    let date: Date
    var orders: [CoffeeOrder] = []
}
