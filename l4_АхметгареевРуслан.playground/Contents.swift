import UIKit

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

class Car {
  var brand: String
  var year: Int
  var engineStatus: EngineStatus
  var windowStatus: WindowStatus
  init(brand: String, year: Int, engineStatus: EngineStatus, windowStatus: WindowStatus) {
    self.brand = brand
    self.year = year
    self.engineStatus = engineStatus
    self.windowStatus = windowStatus
  }
}

class TrunkCar: Car {
  var trunckAction: TrunckAction
  var trunckVolume: UInt
  var trunckVolumeFilled: UInt
  init(brand: String, year: Int, engineStatus: EngineStatus, windowStatus: WindowStatus, trunckAction: TrunckAction, trunckVolume: UInt, trunckVolumeFilled: UInt) {
    self.trunckAction = trunckAction
    self.trunckVolume = trunckVolume
    self.trunckVolumeFilled = trunckVolumeFilled
    super.init(brand: brand, year: year, engineStatus: engineStatus, windowStatus: windowStatus)
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

class SuperCar: Car {
  var horsePower: UInt
  var turbo: Bool
  var sportMode: SportMode
  init(brand: String, year: Int, engineStatus: EngineStatus, windowStatus: WindowStatus, horsePower: UInt, turbo: Bool, sportMode: SportMode) {
    self.horsePower = horsePower
    self.turbo = turbo
    self.sportMode = sportMode
    super.init(brand: brand, year: year, engineStatus: engineStatus, windowStatus: windowStatus)
  }
  func ChangeMode() {
    if sportMode == .on {
      sportMode = .off
    }else{
      sportMode = .on
    }
  }
}

var trunck1 = TrunkCar(brand: "Scania", year: 2010, engineStatus: .start, windowStatus: .open, trunckAction: .noact, trunckVolume: 15000, trunckVolumeFilled: 5000)
trunck1.NewTrunckVolume(trunckAction: .load, newValue: 6000)
print("Машина \(trunck1.brand), год выпуска \(trunck1.year), двигатель \(trunck1.engineStatus), окна \(trunck1.windowStatus), занято \(trunck1.trunckVolumeFilled) из \(trunck1.trunckVolume)")


var car1 = SuperCar(brand: "Bugatti", year: 2017, engineStatus: .start, windowStatus: .close, horsePower: 1000, turbo: true, sportMode: .off)
car1.ChangeMode()
print("Машина \(car1.brand), год выпуска \(car1.year), двигатель \(car1.engineStatus), окна \(car1.windowStatus), мощность \(car1.horsePower), турбо \(car1.turbo), спортивный режим \(car1.sportMode)")



