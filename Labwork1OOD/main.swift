import Foundation

protocol PrintableAllInfo {
    func getAllInfo() -> String
}

protocol PrintableDifferentInfo {
    func getFIO() -> String
    func getBirthday() -> String
}

class PrinterAllInfo: PrintableAllInfo {
    func getAllInfo() -> String {
        "Smirnov A.A. 24.04.2002"
    }
}

class PrinterDifferentInfo: PrintableDifferentInfo {
    func getFIO() -> String {
        "Smirnov Anton Andreevich"
    }
    func getBirthday() -> String {
        "24.04.2002"
    }
}

class PrinterService {
    func printInfo(printer: PrintableAllInfo) {
        print(printer.getAllInfo())
    }
}

class Adapter : PrintableAllInfo {
    private let adaptee: PrintableDifferentInfo
    
    init(printer: PrintableDifferentInfo) {
        adaptee = printer
    }
    
    func getAllInfo() -> String {
        "\(adaptee.getFIO()) \(adaptee.getBirthday())"
    }
}

let service = PrinterService()
let printerAll = PrinterAllInfo()
let printerDifferent = PrinterDifferentInfo()

service.printInfo(printer: printerAll)
service.printInfo(printer: Adapter(printer: printerDifferent))



