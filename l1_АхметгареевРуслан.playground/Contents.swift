import UIKit

var a: Int =  3 //коэффициент a (x^2), если нет, то вводим 0
var b: Int =  6 //коэффициент b (x), если нет, то вводим 0
var c: Int =  2 //коэффициент c (число), если нет, то вводим 0
var d: Int = 0 //дискриминант
var x1: Int = 0
var x2: Int = 0

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
