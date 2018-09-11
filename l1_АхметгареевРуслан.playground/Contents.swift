import UIKit

// 1 задание

var a: Double =  2 //коэффициент a (x^2), если нет, то вводим 0
var b: Double =  5 //коэффициент b (x), если нет, то вводим 0
var c: Double =  2 //коэффициент c (число), если нет, то вводим 0
var d: Double = 0 //дискриминант
var x1: Double = 0
var x2: Double = 0

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
        x1 = -b + sqrt(Double(d)) / 2 * a
        x2 = -b - sqrt(Double(d)) / 2 * a
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

var Vklad: Double = 100
var Procent: Double = 10
var Srok: Int = 5
var Sum: Double = Vklad
var i: Int = 0

while (i<Srok) {
    Sum = Sum + Sum/100*Procent
    i = i + 1
}

print(" Срок вклада:",Srok,"лет\n","Сумма:",Sum)
