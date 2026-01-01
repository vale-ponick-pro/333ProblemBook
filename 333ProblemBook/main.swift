//
//  main.swift
//  333ProblemBook
//
//  Created by Валерия Пономарева on 01.01.2026.
//

import Foundation

print("Task 1. Описание ноутбука: Объявите 5 констант и переменных разных типов, характеризующих ваш ноутбук. Для каждой let / var укажите тип данных, используя type annotation. Подумайте, какие характеристики д.б. let, а какие - var.")
print("Solution:")
let laptop: String = "Macbook Pro"
var memory: Int = 16
var macOS: String = "Tahoe 26.2"
var freeMemory: Double = 643.12
let CPU: String = "Intel Core i9"
let serialNumber: String = "C02D95THMD6N"
var accountApple: String = "Valeria Ponomareva"
var isUnderWarranty: Bool = false
let graphics: String = "Intel UHD Graphics 630 1536 MB"
let displayInches: Int = 16

print("Task 2. Кортеж + typealias: Сделай тип для заказа в магазине: номер (Int), имя клиента (String), сумма (Double), оплачен (Bool). А затем: объяви массив из трёх таких заказов, напиши функцию, которая вернёт только оплаченные заказы.")
typealias Order = (number: Int, name: String, summa: Double, isPaid: Bool)
let orders: [Order] = [
    (number: 1, name: "Bob", summa: 121.55, isPaid: true),
    (number: 2, name: "Ann", summa: 521.99, isPaid: false),
    (number: 3, name: "Joe", summa: 777.21, isPaid: true)
]
func paidOrders(from orders: [Order]) -> [Order] {
    return orders.filter { $0.isPaid }
}
print(paidOrders(from: orders)) // [(number: 1, name: "Bob", summa: 121.55, isPaid: true), (number: 3, name: "Joe", summa: 777.21, isPaid: true)]

print("Task 3. Функция со скидкой (урезанная версия: Требования: discount  — доля (0.2 = 20%), если  discount < 0  → вернуть исходную цену, если  discount > 1  → считать, что скидка 1.0 (100%), иначе применить скидку. Напиши только тело функции (можно вместе с объявлением).")
func applyDiscount(_ price: Double, discount: Double) -> Double {
    return 0
}
