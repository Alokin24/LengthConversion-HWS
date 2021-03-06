//
//  ContentView.swift
//  LengthConversions
//
//  Created by Nikola Anastasovski on 6.3.21.
//

import SwiftUI

struct ContentView: View {
  
    let units = ["meter", "kilometer", "feet", "yards", "miles"]
    
    @State private var unitFromId = 0
    @State private var unitToId = 1
    @State private var lengthText = ""
    
    var unitFrom: String {
        units[unitFromId]
    }
    
    var unitTo: String {
        units[unitToId]
    }
    
    let amountInMeterOf: [String: Double] = [
        "meter": 1,
        "kilometer": 1000,
        "feet": 0.3048,
        "yards": 0.9144,
        "miles": 1609.34
    ]
    
    var result: Double {
        let length = Double(lengthText) ?? 0
        return length * amountInMeterOf[unitFrom]! / amountInMeterOf[unitTo]!
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", text: $lengthText)
                }
                
                Section(header: Text("From")) {
                    Picker("From", selection: $unitFromId) {
                        ForEach(0..<units.count) {
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")) {
                    Picker("To", selection: $unitToId) {
                        ForEach(0..<units.count) {
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text(String(format: "%.2f", result))
                }
            }
            .navigationTitle("Length Convertor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
