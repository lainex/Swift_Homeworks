import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


class Person {
  var name: String
  var sex: String
  init(name: String, sex: String) {
    self.name = name
    self.sex = sex
  }
}

extension Person: CustomStringConvertible {
  var description : String {
    return "Name: \(name), sex: \(sex)"
  }
}

struct queue<T> {
  
  private var elements: [T] = []
  
  
  mutating func push(element: T) {      // добавляем элемент
    elements.append(element)
  }
  
  mutating func pop() -> T? {            // извлекаем элемент
    return elements.removeLast()
  }
  
  mutating func SexCount() -> Int {
    return elements.count
  }

  func myFilter(predicate:(T) -> Bool) -> [T] { //фильтруем элемент
    var result = [T]()
    for i in elements {
      if predicate(i) {
        result.append(i)
      }
    }
    return result
  }

//  subscript(index: Int) -> [T]? {         // не понял как выполнить 3 пункт
//    var indexMan: [String] = []
//    return indexMan = queue[index]
//  }
  
}

var queue1 = queue<Person>()

queue1.push(element: .init(name: "Sam", sex: "man"))
queue1.push(element: .init(name: "Ivan", sex: "man"))
queue1.push(element: .init(name: "Anya", sex: "woman"))
queue1.push(element: .init(name: "Nick", sex: "man"))


let allMan = queue1.myFilter(predicate: {$0.sex == "man"})
let allWoman = queue1.myFilter(predicate: {$0.sex == "woman"})
print(allMan)
print(allWoman)
