//
//  CalendarView.swift
//  Calendario
//
//  Created by Daniel Lopes da Silva on 06/08/24.
//

import SwiftUI

import SwiftUI

struct CalendarView: View {
    @State private var color: Color = .gray
    @State private var data = Date()
    let diasDaSemana = ["Dom","Seg", "Ter","Qua", "Qui","Sex", "Sáb"]
    let colunas = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var mostrarDatePicker = false
    @State private var diasNoMes: [Int] = []
    
    var body: some View {
        VStack {
            Text("Histórico")
                .font(.headline)
                .fontWeight(.bold)
            
            HStack {
            
                
                Text(parseMesEAnoString(from: data))
                    .font(.subheadline)
                    .padding(.leading, 10)
                    .onTapGesture {
                        mostrarDatePicker.toggle()
                    }
                Spacer()

                Button(action: {
                    mudarMes(decrementar: true)
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                }
                .padding(.leading, 10)
                
                Button(action: {
                    mudarMes(decrementar: false)
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 10)
            }
            .padding()
            
            if mostrarDatePicker {
                DatePicker(
                    "",
                    selection: $data,
                    displayedComponents: [.date]
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()
                .onChange(of: data) { _ in
                    calcularDiasDoMes()
                    mostrarDatePicker = false
                }
            }
            
            HStack {
                ForEach(diasDaSemana.indices, id: \.self) { index in
                    Text(diasDaSemana[index])
                        .fontWeight(.black)
                        .foregroundStyle(color)
                        .frame(maxWidth: .infinity, minHeight: 40)
                }
            }
            
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 10) {
                    ForEach(diasNoMes, id: \.self) { dia in
                        Text("\(dia)")
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        .padding()
        .onAppear(perform: calcularDiasDoMes)
    }

    func parseMesEAnoString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    func mudarMes(decrementar: Bool) {
        var dateComponent = DateComponents()
        dateComponent.month = decrementar ? -1 : 1
        data = Calendar.current.date(byAdding: dateComponent, to: data) ?? data
        calcularDiasDoMes()
    }
    
    func calcularDiasDoMes() {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: data)!
        diasNoMes = Array(range)
    }
}

#Preview {
    CalendarView()
}


#Preview {
    CalendarView()
}
