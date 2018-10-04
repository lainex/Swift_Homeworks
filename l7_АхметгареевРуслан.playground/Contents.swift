import UIKit

//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum EmailOperationError: Error { //Ошибки при операции с письмами
  case mailTextOverflow
  case mailFileOverflow
  case noAddress
  case mailNotFound
}

enum EmailStatus { //Статус письма
  case send
  case deleted
  case inProcess
}

struct Mail { //Структура письма
  var address: String
  var text: String
  var file: String? // не знаю как работать с типом sFile, поэтому использовал String адрес файла
  var mailId: Int
}

class EmailOperation { //Функции и ограничения для писем
  let textLimit: Int = 256
  let fileLimit: Int = 500
  var mailIdDelete: Int?
  var mailStatus: EmailStatus
  
  func sendEmail(Mail: Mail)throws { //Отправка
    guard Mail.text.count < textLimit else {
      throw EmailOperationError.mailTextOverflow
    }
    guard Mail.address != "" else {
      throw EmailOperationError.noAddress
    }
    guard Mail.file?.count ?? 0 < fileLimit else {
      throw EmailOperationError.mailFileOverflow
    }
    mailStatus = .send
  }
  
  func deleteEmail(Mail: Mail)throws { //Удаление
    guard Mail.mailId == mailIdDelete else {
      throw EmailOperationError.mailNotFound
    }
    mailStatus = .deleted
  }
  
  func printEmailStatus(Mail: Mail) { //Вывод состояния
    print("Email Id = \(Mail.mailId), address: \(Mail.address), text: \(Mail.text), file: \(Mail.file ?? "0"), mail status: \(mailStatus)")
  }
  
  init(mailIdDelete: Int?, mailStatus: EmailStatus) {
    self.mailIdDelete = mailIdDelete
    self.mailStatus = mailStatus
  }
}

extension EmailOperationError: CustomStringConvertible { //Описания для ошибок
  var description: String {
    switch self {
    case .mailTextOverflow: return "Ошибка, максимальное количество символов превышено"
    case .mailFileOverflow: return "Ошибка, максимальный размер файла превышен"
    case .noAddress: return "Ошибка, не указан адрес для отправки"
    case .mailNotFound: return "Ошибка, письмо не удалено. Причина: письмо не найдено"
    }
  }
}


// Пробуем создать и отправить письмо
var nMail = Mail(address: "asd@ads.com", text: "asd", file: "asd", mailId: 0)
var doNmail = EmailOperation(mailIdDelete: nil, mailStatus: .inProcess)
do {
  try doNmail.sendEmail(Mail: nMail)
} catch let error as EmailOperationError {
  print(error.description)
}
doNmail.printEmailStatus(Mail: nMail) //Выводим статус


// Удаляем письмо с несуществующим Id = 1, ловим ошибку
doNmail = EmailOperation(mailIdDelete: 1, mailStatus: doNmail.mailStatus)
do {
  try doNmail.deleteEmail(Mail: nMail)
} catch let error as EmailOperationError {
  print(error.description)
}
doNmail.printEmailStatus(Mail: nMail) //Выводим статус (не изменился)
