//extension Date {
//    func parseMesEAnoString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM yyyy"
//        return formatter.string(from: self)
//    }
//    
//    func mudarMes(decrementar: Bool) -> Date {
//        var dateComponent = DateComponents()
//        dateComponent.month = decrementar ? -1 : 1
//        return Calendar.current.date(byAdding: dateComponent, to: self) ?? self
//    }
//    
//    func calcularDiasDoMes() -> [Int] {
//        let calendar = Calendar.current
//        let range = calendar.range(of: .day, in: .month, for: self)!
//        return Array(range)
//    }
//}
