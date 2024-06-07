class Operator {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double{
        fatalError("오버라이드 전용 함수")
    }
}

class Addition: Operator {
    override
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class Subtraction: Operator {
    override
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class Multiplication: Operator {
    override
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class Division: Operator {
    override
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

class Modulo: Operator {
    override
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)
    }
}

class Calculator {
    // 인스턴스 변수 선언
    var viewValue: String = "" // 화면에 찍힌 숫자
    var temp1: String = "" // 연산자 앞에 놓일 숫자
    var temp2: String = "" // 연산자 뒤에 놓일 숫자
    var operatorChar: String = "" // 연산자
    var result: Double = 0 // 연산의 결과
    var currentOperator: Operator? = nil

    let operators: [String: Operator] = [
        "+": Addition(),
        "-": Subtraction(),
        "*": Multiplication(),
        "/": Division(),
        "%": Modulo()
    ]

    func typing(typingValue: String) -> String {
        if let op = operators[typingValue] {
            temp1 = viewValue
            operatorChar = typingValue
            currentOperator = op
            viewValue = ""
        } else if typingValue == "=" {
            temp2 = viewValue
            guard let firstNumber = Double(temp1), let secondNumber = Double(temp2), let currentOperator = currentOperator else {
                return viewValue
            }
            result = currentOperator.calculate(firstNumber, secondNumber)
            temp1 = "\(result)"
            viewValue = "\(result)"
        } else if let number = Int(typingValue), (0...9).contains(number) {
            viewValue += typingValue
        } else {
            print("error")
        }
        return viewValue
    }
}

let calculator = Calculator() // 인스턴스 생성하여 변수에 할당

// 초기화면
print("값을 입력하세요.")

// 입력부분
calculator.viewValue = calculator.typing(typingValue: "1")
print(calculator.viewValue)
calculator.viewValue = calculator.typing(typingValue: "5")
print(calculator.viewValue)
calculator.viewValue = calculator.typing(typingValue: "6")
print(calculator.viewValue)
calculator.viewValue = calculator.typing(typingValue: "+")
print(calculator.viewValue)
calculator.viewValue = calculator.typing(typingValue: "1")
print(calculator.viewValue)
calculator.viewValue = calculator.typing(typingValue: "=")
print(calculator.viewValue)

// 결과부분
print("결과: \(calculator.result)")



