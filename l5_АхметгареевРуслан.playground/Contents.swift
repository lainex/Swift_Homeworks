import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum EngineStatus {
  case start, stop
}

enum WindowStatus {
  case open, close
}

enum TrunckAction {
  case load, unload, noact
}

enum SportMode {
  case on, off
}

protocol Car { //добавил в протокол функции
  func WindowFunc()
  func EngineFunc()
}

extension Car { //реализация функций в расширении не работает не понимаю почему
  func WindowFunc() {
    if windowStatus == .open {
      windowStatus = .close
    }else{
      windowStatus = .open
    }
  }
  func EngineFunc() {
    if engineStatus == .start {
      engineStatus = .stop
    }else{
      engineStatus = .start
    }
  }
}

class TrunckCar: Car { //класс подписанный протоколом Car
  var brand: String
  var year: Int
  var engineStatus: EngineStatus
  var windowStatus: WindowStatus
  var trunckAction: TrunckAction
  var trunckVolume: UInt
  var trunckVolumeFilled: UInt
  init(brand: String, year: Int, engineStatus: EngineStatus, windowStatus: WindowStatus, trunckAction: TrunckAction, trunckVolume: UInt, trunckVolumeFilled: UInt) {
    self.brand = brand
    self.year = year
    self.engineStatus = engineStatus
    self.windowStatus = windowStatus
    self.trunckAction = trunckAction
    self.trunckVolume = trunckVolume
    self.trunckVolumeFilled = trunckVolumeFilled
  }
  func NewTrunckVolume(trunckAction: TrunckAction , newValue: UInt) { //функция для погрузки/разгрузки
    if (trunckAction == .load) && (newValue <= trunckVolume) && (newValue <= (trunckVolume - trunckVolumeFilled)) {
      trunckVolumeFilled = trunckVolumeFilled + newValue
    }else if(trunckAction == .unload) && (newValue <= trunckVolume) && (newValue <= trunckVolumeFilled){
      trunckVolumeFilled = trunckVolumeFilled - newValue
    }else if(trunckAction == .noact){
      trunckVolumeFilled
    }else{
      print("Ошибка, неверные значения")
    }
  }
}

class SuperCar: Car { //класс подписанный протоколом Car
  var brand: String
  var year: Int
  var engineStatus: EngineStatus
  var windowStatus: WindowStatus
  var horsePower: UInt
  var turbo: Bool
  var sportMode: SportMode
  init(brand: String, year: Int, engineStatus: EngineStatus, windowStatus: WindowStatus, horsePower: UInt, turbo: Bool, sportMode: SportMode) {
    self.brand = brand
    self.year = year
    self.engineStatus = engineStatus
    self.windowStatus = windowStatus
    self.horsePower = horsePower
    self.turbo = turbo
    self.sportMode = sportMode
  }
  func ChangeMode() {
    if sportMode == .on {
      sportMode = .off
    }else{
      sportMode = .on
    }
  }
}

var trunck1 = TrunckCar(brand: "Volvo", year: 2014, engineStatus: .start, windowStatus: .open, trunckAction: .noact, trunckVolume: 2000, trunckVolumeFilled: 100) // Объект класса Trunck
var car1 = SuperCar(brand: "Bugatti", year: 2017, engineStatus: .start, windowStatus: .close, horsePower: 1000, turbo: true, sportMode: .off) // Объект класса SuperCar

extension TrunckCar: CustomStringConvertible { //Расширение имплементирующее CustomStringConvertible
  var description: String {
    return "Машина \(trunck1.brand), год выпуска \(trunck1.year), двигатель \(trunck1.engineStatus), окна \(trunck1.windowStatus), занято \(trunck1.trunckVolumeFilled) из \(trunck1.trunckVolume)"
  }
}

extension SuperCar: CustomStringConvertible { //Расширение имплементирующее CustomStringConvertible
  var description: String {
    return "Машина \(car1.brand), год выпуска \(car1.year), двигатель \(car1.engineStatus), окна \(car1.windowStatus), мощность \(car1.horsePower), турбо \(car1.turbo), спортивный режим \(car1.sportMode)"
  }
}



//print(trunck1.windowStatus)
//trunck1.WindowFunc()
//print(trunck1.windowStatus)
