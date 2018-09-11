import UIKit

// 1 задание

var a: Int =  3 //коэффициент a (x^2), если нет, то вводим 0
var b: Int =  0 //коэффициент b (x), если нет, то вводим 0
var c: Int =  2 //коэффициент c (число), если нет, то вводим 0
var d: Int = 0 //дискриминант
var x1: Int = 0
var x2: Int = 0

if(a == 0){
    print("Уравнение не имеет корней")
}else{
    d = (b * b) - (4 * a * c)
    print("Дискриминант =",d)

    if(d < 0){
        print("Уравнение не имеет корней")
    }else if(d == 0){
        x1 = -b / 2 * a
        print("x = ",x1)
    }else{
        x1 = -b + Int(sqrt(Double(d))) / 2 * a
        x2 = -b - Int(sqrt(Double(d))) / 2 * a
        print(" x1 =",x1,"\n","x2 =",x2)
    }
}
// 2 задание

var katet1: Double = 4
var katet2: Double = 3
var gipotenyza: Double = 0
var P: Double = 0
var S: Double = 0

gipotenyza = sqrt(katet1 * katet1 + katet2 * katet2)
P = katet1 + katet2 + gipotenyza
S = 0.5 * katet1 * katet2
print("Гипотенуза = ",gipotenyza)
print("Периметр = ",P)
print("Площадь = ",S)

// 3 задание

var Vklad: Int = 5000
var Procent: Int = 10
var Srok: Int = 5
var Sum: Int = 0
var i: Int = 0

while (i<Srok) {
    Sum = Vklad + Vklad*Procent
    i = i + 1
}
print(" Срок вклада:",Srok,"\n","Сумма:",Sum)
