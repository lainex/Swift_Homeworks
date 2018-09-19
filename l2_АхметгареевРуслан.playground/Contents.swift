import UIKit

// 1 задание

func IsNumberEven(number: Int, isEven: String = "Число четное", isNotEven: String = "Число не четное") -> String {
    if (number % 2) == 0{
        return isEven
    }else{
        return isNotEven
    }
}
print(IsNumberEven(number: 10)) //вводим число

// 2 задание (почти тоже самое что и 1)

func IsNumberDivide(number2: Int, isDivide: String = "Число делиться на 3 без остатка", isNotDivide: String = "Число не делиться на 3 без остатка") -> String {
    if (number2 % 3) == 0{
        return isDivide
    }else{
        return isNotDivide
    }
}
print(IsNumberDivide(number2: 9)) //вводим число

// 3 задание

var array: [Int] = Array(0...100) //простой вариант
//print(array)


var newArray: [Int] = Array()
var i: Int = 0
for _ in 0...100 {  // через цикл
    newArray.append(i)
    i += 1
}
print("Массив от 0 до 100",newArray)

// 4 задание

for (a,_) in newArray.enumerated().reversed() {
    if (IsNumberEven(number: a) == "Число четное") {
        newArray.remove(at: a)
    }else if (IsNumberDivide(number2: a) == "Число не делиться на 3 без остатка") {
        newArray.remove(at: a)
    }
}
print("Массив из нечетных и делящихся на 3 без остатка чисел",newArray)

// 5 задание есть вопросы к реализации

var fiboArray: [Int] = [0, 1] //числа фибоначчи начинаются с 0, 1

func Fibonachi (fiboArray: [Int], fibo: Int = fiboArray[fiboArray.endIndex - 2] &+ fiboArray[fiboArray.endIndex - 1] ) -> Int { //считает след. число
    return fibo
}

for _ in 0...100 {  // через цикл заполняем массив (пришлось использовать &+ что бы выполнить цикл)
    fiboArray.append(Fibonachi(fiboArray: [0, 1]))
}
print("Числа фибоначчи",fiboArray)

// 6 задание

func IsPrimeNumber (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func PrimeNumbersArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if IsPrimeNumber(num: i) {
            results.append(i)
        }
        i += 1
    }
    return results
}

print("Простые числа",PrimeNumbersArray())
