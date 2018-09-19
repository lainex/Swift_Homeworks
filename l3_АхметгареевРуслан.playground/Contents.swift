import UIKit

enum EngineStatus {
  case on, off
}

enum WindowStatus {
  case open, close
}

enum TrunkAction {
  case load, unload, noact //load - загрузить, unload - разгрузить, noact - действий не требуется
}

struct Car {
  let brand: String
  let year: Int
  var trunckAction: TrunkAction
  var trunckVolume: UInt
  var engineStatus: EngineStatus
  var windowStatus: WindowStatus
  var trunckVolumeFilled: UInt
  mutating func NewTrunckVolume(trunckAction: TrunkAction , newValue: UInt) { //функция для погрузки/разгрузки
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

struct Truck {
  let brand: String
  let year: Int
  var trunckAction: TrunkAction
  var trunckVolume: UInt
  var engineStatus: EngineStatus
  var windowStatus: WindowStatus
  var trunckVolumeFilled: UInt
  mutating func NewTrunckVolume(trunckAction: TrunkAction , newValue: UInt) { //функция для погрузки/разгрузки
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


var car1 = Car(brand: "Audi", year: 2014, trunckAction: .noact, trunckVolume: 2000, engineStatus: .on, windowStatus: .close, trunckVolumeFilled: 200)
var car2 = Car(brand: "Toyota", year: 1997, trunckAction: .noact, trunckVolume: 1500, engineStatus: .off, windowStatus: .open, trunckVolumeFilled: 1500)
var truck1 =  Truck(brand: "KAMAZ", year: 2010, trunckAction: .noact, trunckVolume: 20000, engineStatus: .off, windowStatus: .close, trunckVolumeFilled: 0)

car1.engineStatus = .off
car1.NewTrunckVolume(trunckAction: .load, newValue: 1500)
car2.NewTrunckVolume(trunckAction: .unload, newValue: 100)
truck1.NewTrunckVolume(trunckAction: .load, newValue: 5000)
truck1.NewTrunckVolume(trunckAction: .unload, newValue: 2000)

print("Информация о первой машине: Марка \(car1.brand), год выпуска \(car1.year), статус двигателя \(car1.engineStatus), статус окон \(car1.windowStatus), занято обьема багажника \(car1.trunckVolumeFilled) из \(car1.trunckVolume)")

print("Информация о второй машине: Марка \(car2.brand), год выпуска \(car2.year), статус двигателя \(car2.engineStatus), статус окон \(car2.windowStatus), занято обьема багажника \(car2.trunckVolumeFilled) из \(car2.trunckVolume)")

print("Информация о первом грузовике: Марка \(truck1.brand), год выпуска \(truck1.year), статус двигателя \(truck1.engineStatus), статус окон \(truck1.windowStatus), занято обьема кузова \(truck1.trunckVolumeFilled) из \(truck1.trunckVolume)")

//Проверка функции погрузки/разгрузки

//car1.NewTrunckVolume(trunckAction: .unload, newValue: 1000)
//
//print("Информация о первой машине: Марка \(car1.brand), год выпуска \(car1.year), статус двигателя \(car1.engineStatus), статус окон \(car1.windowStatus), занято обьема багажника \(car1.trunckVolumeFilled) из \(car1.trunckVolume)")
