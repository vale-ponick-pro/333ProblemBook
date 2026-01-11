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

print("Задание по классам. Task 6. Сделай класс  Customer  для покупателя магазина:Свойства: name: String  (let, неизменяемое), loyaltyPoints: Int  (var, может меняться), email: String  (var, может обновляться). Что нужно реализовать: 1. Инициализатор (constructor), который принимает все три значения. 2.    Метод  addPoints(_ points: Int) , который увеличивает  loyaltyPoints. 3.    Метод  canMakePurchase()  → возвращает  true , если  loyaltyPoints >= 100. Напиши полный код класса + пример создания объекта и вызова методов.")

class Customer {
    let name: String
    var loyaltyPoints: Int
    var email: String
    
    init(name: String, loyaltyPoints: Int, email: String) {
        self.name = name
        self.loyaltyPoints = loyaltyPoints
        self.email = email
    }
        
    func addPoints(_ points: Int) {
        loyaltyPoints += points
    }
            
    func canMakePurchase() -> Bool {
        return loyaltyPoints >= 100
    }
}
    
let customer = Customer(name: "Bob", loyaltyPoints: 50, email:  "bob@email.com")
customer.addPoints(12)
print(customer.canMakePurchase()) // false

print("адание по классам. Task 7: Класс Book для библиотеки: Создай класс Book со следующими свойствами: title: String (константа), author: String (константа), pages: Int (константа), isBorrowed: Bool (переменная, изначально false). Что нужно реализовать: Инициализатор, принимающий title, author и pages. Метод borrow() → меняет isBorrowed на true. Метод returnBook() → меняет isBorrowed на false. Метод isAvailable() → возвращает true, если книга не занята (то есть isBorrowed == false). Напиши полный код класса + пример: Создать книгу, Взять её в аренду, Проверить доступность, Вернуть книгу, Снова проверить доступность")

class Book {
    let title: String
    let author: String
    let pages: Int
    var isBorrowed: Bool
    
    init(title: String, author: String, pages: Int, isBorrowed: Bool = false) {
        self.title = title
        self.author = author
        self.pages = pages
        self.isBorrowed = isBorrowed // используем переданное значение или false по умолчанию
    }
    
    func borrow() {
        isBorrowed = true
    }
    func returnBook() {
        isBorrowed = false
    }
    
    func isAvailable() -> Bool {
        return !isBorrowed
    }
}

let hobbit = Book(title: "Hobbit", author: "J.R.R.Tolkien", pages: 368) // isBorrowed = false auto!
print(hobbit.isAvailable()) // true
hobbit.borrow()
print(hobbit.isAvailable()) // false
hobbit.returnBook()
print(hobbit.isAvailable()) // true

print("Задание по опционалам (уровень middle junior). Task 8: Сделай функцию  processCustomerOrder(customerName: String?, orderAmount: Double?, discountCode: String?) -> String, которая: Логика функции: 1. Если  customerName  пустой ( nil ) → вернуть  'Отказ: имя клиента не указано'. 2. Если  orderAmount  пустой ( nil ) → вернуть  'Отказ: сумма заказа не указана'. 3. Если  discountCode  пустой ( nil ) → применить скидку 0%. 4.    Если все данные есть: Сумма со скидкой:  orderAmount * 0.9  (10% скидка при наличии промокода), Вернуть строку:'Заказ имя: сумма₽ → сумма со скидкой₽'. Требования: Использовать один  guard let  в начале для проверки  customerName  и  orderAmount, discountCode  обрабатывать через  if let, Обязательно использовать  ??  хотя бы один раз.")

func processCustomerOrder(customerName: String?, orderAmount: Double?, discountCode: String?) -> String {
    let discount = discountCode ?? "" // 1. Используем ?? для значения по умолчанию discount
    guard let name = customerName, !name.isEmpty else {   // 2. Guard для обязательных полей
        return "❌ Refusal: client name not specified"
    }
    guard let amount = orderAmount, amount > 0 else {
        return "❌ Refusal: invalid order amount"
    }
    if discount.isEmpty {  // 3. Проверяем discount (уже не опционал благодаря ??)
        return "⚠️ Order processed for \(name). Amount: \(amount) (No discount applied)"
    }   // все проверки пройдены! промокод есть -> применим скидку
    let discountedAmount = amount * 0.9
    return "✅ Заказ \(name): \(amount)₽ → \(discountedAmount)₽"
}

// примеры вызова
print(processCustomerOrder(customerName: "Gay Richi", orderAmount: 5550.99, discountCode: "Christmas10")) // ✅ Заказ Gay Richi: 5550.99₽ → 4995.891₽
print(processCustomerOrder(customerName: nil, orderAmount: 7650.55, discountCode: "Christmas10")) // ❌ Refusal: client name not specified
print(processCustomerOrder(customerName: "Rob Roy", orderAmount: nil, discountCode: "Christmas10")) // ❌ Refusal: invalid order amount
print(processCustomerOrder(customerName: "Tim Cook", orderAmount: 100.0, discountCode: nil)) // ⚠️ Order processed for Tim Cook. Amount: 100.0 (No discount applied)

print("Доп. задание на опционалы (повышенная сложность): Task 9. Сделай функцию  safeDivide(a: Double?, b: Double?) -> Double? , которая: Логика: 1.    Если любой из параметров  nil  → вернуть  nil. 2.    Если  b == 0  → вернуть  nil  (нельзя делить на ноль). 3.    Иначе вернуть результат  a / b. Требования: Один  guard let  для обоих параметров + ??  НЕ использовать, Вернуть  Double?  (результат тоже может быть опционалом).")

func safeDivide(a: Double?, b: Double?) -> Double? {
    guard let unwrappedA = a, let unwrappedB = b, unwrappedB != 0  else {
        return nil
    }
    return  unwrappedA / unwrappedB
}

if let result1 = safeDivide(a: 12.0, b: 3.0) {
    print(result1) // 4.0
} else {
    print("Cannot divide")
}

if let result2 = safeDivide(a: nil, b: 3.0) {
    print(result2)
} else {
    print("Cannot divide") // Cannot divide
}

if let result3 = safeDivide(a: 12.0, b: nil) {
    print(result3)
} else {
    print("Cannot divide") // Cannot divide
}

if let result4 = safeDivide(a: 12.0, b: 0.0) {
    print(result4)
} else {
    print("Cannot divide") // Cannot divide
}

if let result5 = safeDivide(a: nil, b: nil) {
    print(result5)
} else {
    print("Cannot divide") // Cannot divide
}

extension String {
    func shorted() -> String {
        if self.count <= 10 {
            return self // короткая строка - как есть
        } else {
            return String(self.prefix(7)) + "..."
        }
    }
}
print("Hobbitania".shorted()) // Hobbitania
print("Green Dragon".shorted()) // Green D...

print("Task 11. extension String.isEmail(): Проверить, что строка — это email. Должно быть @ И точка после @")
             
extension String {
    var isEmail: Bool {
        return self.contains("@") && self.contains(".") &&
               !self.contains("@.")
    }
}

print("Hobbitania".isEmail)              // false
print("GreenDragon@gmail.com".isEmail)   // true
print("test@.".isEmail)                  // false
print("bob@com".isEmail)                 // false

print("Task 12. extension Array где Element: Int.positiveOnly(): [1, -2, 3, 0, -5, 7] → [1, 3, 7]")

extension Array where Element == Int {
    var positiveOnly: [Int] {  // ← возвращаем новый массив
        return self.filter { $0 > 0 } // твоя логика тут
    }
}

let numbers = [1, -2, 3, 0, -5, 7]
print(numbers.positiveOnly)  // [1, 3, 7]

print("Task 13. extension Double.currencyRUB(): 1234.567 → \"₽1234.57\"")

extension Double {
    var currencyRUB: String {
        return "₽\(String(format: "%.2f", self))"
    }
}
print(1234.5678.currencyRUB) // ₽1234.57
print(5.0.currencyRUB) // ₽5.00
print(0.12345.currencyRUB) // ₽0.12

print("Task 14. Shopping Cart: All 3 extensions")

struct Product {
    let name: String
    let price: Double
    let tags: [Int]  // 1=есть, -1=нет ← Array для .positiveOnly!
}

let cart = [
    Product(name: "iPhone 17 air 256 gb", price: 89.555, tags: [1]),
    Product(name: "iPhone 17 max 256 gb", price: 112.999, tags: [-1]),
    Product(name: "iPhone 17 max pro 256 gb", price: 189.999, tags: [-1]),
    Product(name: "iPhone 17 max pro 512 gb", price: 212.555, tags: [1]),
    Product(name: "admin@shop.ru", price: 99.99, tags: [1, -1])
]

for product in cart {
    print("\(product.name):")
    print("  Email: \(product.name.isEmail ? "✅" : "❌")") // ← extension 1
    print("  Price: \(product.price.currencyRUB)") // ← extension 2
    print("  Status: \(product.tags.positiveOnly.isEmpty ? "❌ Нет" : "✅ Есть (\(product.tags.positiveOnly.count))")") // ← extension 3
    print("---")
}
/*
 Task 14. Shopping Cart: All 3 extensions
 iPhone 17 air 256 gb:
   Email: ❌
   Price: ₽89.56
   Status: ✅ Есть (1)
 ---
 iPhone 17 max 256 gb:
   Email: ❌
   Price: ₽113.00
   Status: ❌ Нет
 ---
 iPhone 17 max pro 256 gb:
   Email: ❌
   Price: ₽190.00
   Status: ❌ Нет
 ---
 iPhone 17 max pro 512 gb:
   Email: ❌
   Price: ₽212.56
   Status: ✅ Есть (1)
 ---
 admin@shop.ru:
   Email: ✅
   Price: ₽99.99
   Status: ✅ Есть (1)
 --- */

/*
 lesson with Arsenty 7.01.26 project ToDoList
 */
print("Задача 15. Чётные числа: Напиши функцию, которая: принимает число  n: Int, возвращает массив всех чётных чисел от 1 до  n  включительно.")
// var. 1
func calculateEvenNumbers(limit: Int) -> [Int] {
    var numbers: [Int] = []
    for number in 1...limit {
        if number % 2 == 0 {
            numbers.append(number)
        }
    }
    return numbers
}

print(calculateEvenNumbers(limit: 21)) // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

// var. 2
func calcEvenNums(upTo limit: Int) -> [Int] {
    return Array(1...limit).filter { $0 % 2 == 0 }
}

print(calcEvenNums(upTo: 27)) // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26]

// var. 3 верни сумму чётных чисел от 1 до  n  (через цикл и через  filter + reduce )
    
func calcEvenNumbers(upTo limit: Int) -> Int {
    return Array(1...limit)
        .filter { $0 % 2 == 0 }
        .reduce(0, +)
}

print(calcEvenNumbers(upTo: 7)) // 12

// var. 4 вернуть только нечётные числа

func calculateOddNums(upTo limit: Int) -> [Int] {
    return Array(1...limit)
        .filter { $0 % 2 != 0 }
}
print(calculateOddNums(upTo: 10)) // [1, 3, 5, 7, 9]

// var. 5 САМЫЙ ЭФФЕКТИВНЫЙ! сделать версию, где шаг сразу 2 (2, 4, 6…) без проверки  % 2 == 0 .

func calculateEvenNums(upTo limit: Int) -> [Int] {
    return Array(stride(from: 2, through: limit, by: 2))
}
print(calculateEvenNums(upTo: 9)) // [2, 4, 6, 8]

/* решение с stride — оптимальное по производительности и читаемости! 🎯
 Сложность: O(n/2) ≈ O(n), но с лучшей константой
 Количество итераций: n/2 (только по четным числам)
 Операции на итерацию: только инкремент на 2 */

// var. 6 универсальное решение: поиск четных/нечетных чисел/суммы в ОДНОЙ функции

enum NumbersOperation {
    case allEvenNumbers // вернуть массив четных
    case allOddNumbers // вернуть массив НЕчетных
    case sumEvenNumbers // вернуть сумму четных
    case sumOddNumbers // впнуть сумму НЕчетных
}
func processNumbers(upTo limit: Int, operation: NumbersOperation) -> Any {
    let evenSequence = stride(from: 2, through: limit, by: 2)
    let oddSequence = stride(from: 1, through: limit, by: 2)
    
    switch operation {
    case .allEvenNumbers:
        return Array(evenSequence)
    case .allOddNumbers:
        return Array(oddSequence)
    case .sumEvenNumbers:
        return evenSequence.reduce(0, +)
    case .sumOddNumbers:
        return oddSequence.reduce(0, +)
    }
}

let evens = processNumbers(upTo: 12, operation: .allEvenNumbers) as! [Int]
let odds = processNumbers(upTo: 12, operation: .allOddNumbers) as! [Int]
let sumEvens = processNumbers(upTo: 12, operation: .sumEvenNumbers) as! Int
let sumOdds = processNumbers(upTo: 12, operation: .sumOddNumbers) as! Int

/* Правило: если вызов читается как английское предложение — лейблы нужны. Если как математическая формула — можно без. */
print("🎯 Тренинг лейблов. Задача 16. Сумма цифр. Напиши функцию, которая принимает число и возвращает сумму его цифр.")
// вар. 1
func sumDigits(of number: Int) -> Int { // 'сумма цифр числа'
    let number = String(number)
    var sum = 0
    for char in number {
        if let char = char.wholeNumberValue {
            sum += char
        }
    }
    return sum
}
let sum = sumDigits(of: 12345) // 15
print(sum)

// вар. 2
func sumDigits(in number: Int) -> Int {
    return String(number).compactMap {$0.wholeNumberValue }.reduce(0,+)
}
let summa = sumDigits(in: 12345) // 15
print(summa) // 15
/* String(number)        // "12345"
 .compactMap { ... }   // [1,2,3,4,5]
 .reduce(0, +)         // 15 ✅ */

/* feat: implement even numbers processing
 
 var.1-6: от цикла до универсальной функции
 stride(from:through:by:) — O(n/2) эффективность
 лейблы upTo limit по Apple guidelines

 feat(numeric): add sumDigits with compactMap

 String → [Int?] → sum за 1 строку
 compactMap { $0.wholeNumberValue }
 пример: 12345 → 15 */

print("🎯 Задача 17: Покупки (Корзина). Функция принимает список цен товаров и скидку в %, возвращает итоговую сумму со скидкой.")
// var.1
func calcSumWithDiscunt(for prices: [Double], with discount: Double) -> Double {
    var sum = 0.0
    let multiplier = 1 - discount / 100  // ✅ Вынесли 1 раз!
    for price in prices {
        sum += price * multiplier
    }
    return sum
}
let sumWithDiscount = calcSumWithDiscunt(for: [12.25, 555.5, 777.777, 9999.99], with: 20)
print(sumWithDiscount) // 9076.4136 ✅

// var.2 functional
func calculateSumWithDiscunt(for prices: [Double], with discount: Double) -> Double {
    let sum = prices.reduce(0, +) // 0(n) считаем 1 раз
    return sum * (1 - discount/100) // просто умножаем
}
let summaWithDiscount = calculateSumWithDiscunt(for: [12.25, 555.5, 777.777, 9999.99], with: 20)
print(summaWithDiscount) // 9076.4136

/* feat: add shopping cart calculator
 var.1 optimized circle for-In (multiplier extracted)
 var.2 .reduce(0, +) + discount multiplier (1 - discount/100)
 why var.2 wins?
 - shorter(2 vs 6 lines)
 - higher-order function style
 - reads as math: 'summa * coefficient'
 - both 0(n) ✅, but var.2 - more expressive 🎯 */
 
class Animal {
    var name: String  // ← var свойство!
    
    init(name: String) {
        self.name = name
    }
}

let cat = Animal(name: "Барсик")  // let константа класса
cat.name = "Мурзик"               // ✅ ЭТО РАБОТАЕТ!

print(cat.name)  // Выведет: "Мурзик"

// Задание: перепиши это безопасно и красиво
func formatUserInfo(from data: [String: Any]) -> String {
    let name = data["name"] as! String
    let age = data["age"] as! Int
    let city = data["city"] as! String
    return "\(name), \(age), \(city)"
}
