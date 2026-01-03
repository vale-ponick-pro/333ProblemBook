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

print("Task 3. Функция со скидкой: discount  — доля (0.2 = 20%), если  discount < 0  → вернуть исходную цену, если  discount > 1  → считать, что скидка 1.0 (100%), иначе применить скидку. Напиши только тело функции (можно вместе с объявлением).")
func applyDiscount(_ price: Double, discount: Double) -> Double {
    if discount < 0 {
        return price
    } else if discount > 1 {
        return price * (1 - 1.0)
    } else {
        return price * (1 - discount)
    }
}

print("Task 4: Возьми за основу свой  typealias Order  и перепиши на полноценную структуру: Затем: Создай массив  let orders: Order = ...  из четырёх заказов (два оплаченных, два нет). Напиши функцию, которая возвращает только неоплаченные заказы. Скинь свой код целиком (структуру + массив + функцию).")
struct OrderRecord {
    var number: Int
    var name: String
    var summa: Double
    var isPaid: Bool
}
let ordersList: [OrderRecord] = [
    OrderRecord(number: 1, name: "Tim Cook", summa: 555.25, isPaid: true),
    OrderRecord(number: 2, name: "Bob Dilan", summa: 777.99, isPaid: true),
    OrderRecord(number: 3, name: "Tom Soyer", summa: 1221.12, isPaid: false),
    OrderRecord(number: 4, name: "Frank Sinatra", summa: 3215.34, isPaid: false),
]
func notPaid(from ordersList: [OrderRecord]) -> [OrderRecord] {
    return ordersList.filter { !$0.isPaid }
}
let unpaidOrders = notPaid(from: ordersList )
print("Unpaid orders:")
for order in unpaidOrders {
    print("№\(order.number): \(order.name), summa: \(order.summa)")
}
/* Unpaid orders:
№3: Tom Soyer, summa: 1221.12
 №4: Frank Sinatra, summa: 3215.34 */

print("Task 5: Добавь в struct OrderRecord computed property isEmpty, которая возвращает true если summa == 0.0. Добавь в массив пятый заказ с summa: 0. Напиши функцию emptyOrders(from: OrderRecord) -> OrderRecord, которая возвращает только пустые заказы. Выведи результат красивым print.")

struct Bill {
    var number: Int
    var name: String
    var summa: Double
    var isPaid: Bool
    
    var isEmpty: Bool {
        return summa == 0.0
    }
    
    var isEmptyDescrription: String {
        return isEmpty ? "Empty bill" : "Bill is not empty"
    }
}
    let bills: [Bill] = [
        Bill(number: 1, name: "Tim Cook", summa: 555.25, isPaid: true),
        Bill(number: 2, name: "Bob Dilan", summa: 777.99, isPaid: true),
        Bill(number: 3, name: "Tom Soyer", summa: 1221.12, isPaid: false),
        Bill(number: 4, name: "Frank Sinatra", summa: 3215.34, isPaid: false),
        Bill(number: 5, name: "Mike Duglas", summa: 0.0, isPaid: false)
    ]
    func empty(from bills: [Bill]) -> [Bill] {
        return bills.filter { $0.isEmpty }
    }
    let emptyBills = empty(from: bills )
    print("Empty bills:")
    for bill in emptyBills {
        print("№\(bill.number): \(bill.name), summa: \(bill.summa)")
}
/* Empty bills:
 №5: Mike Duglas, summa: 0.0 */

print("Блок 4. Логика и if/switch. Task 5. Проверка статуса заказаю Сделай: 1. Перечисление (enum)  OrderStatus  с такими вариантами: new, inProgress, shipped, delivered, cancelled. 2. Функцию, которая: принимает параметр типа  OrderStatus, возвращает строку ( String ) — текстовое сообщение для пользователя. Требования к сообщениям: для new  вернуть строку: «Заказ принят», для  inProgress  — 'Заказ обрабатывается', для  shipped  — 'Заказ отправлен', для  delivered  — 'Заказ доставлен', для  cancelled  — 'Заказ отменён'. Функцию обязательно реализовать через  switch  по значению  OrderStatus.")

enum OrderStatus {
    case new
    case inProgress
    case shipped
    case delivered
    case cancelled
}
func checkStatus(for message: OrderStatus ) -> String {
        switch message {
        case .new:
            return "Order accepted"
        case .inProgress:
            return "Order is being processed"
        case .shipped:
            return "Order sent"
        case .delivered:
            return "Order delivered"
        case .cancelled:
            return "Order canceled"
    }
}
    
let status = OrderStatus.new
let message = checkStatus(for: status)
print(message) // Order accepted
