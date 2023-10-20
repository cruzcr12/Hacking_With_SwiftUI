//
//  ContentView.swift
//  SwitUI-03-BetterRest
//
//  Created by Esteban Alonso Cruz Hidalgo on 9/10/23.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    // A computed property to display 7:00 am as default wake up time
    // This needs to be static as we are accessing this property from inside another one
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        
        NavigationView{
            Form {
                Section{
                    //Text("When do you want to wake up?")
                    //    .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                Section{
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12,
                            step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                Section {
                    Picker("Cups of coffee", selection: $coffeeAmount){
                        ForEach(1 ..< 21){
                            Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }

                    }
                    /*Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value:
                                $coffeeAmount, in: 1...20) */
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                Section {
                    ZStack{
                        Color.black
                            .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 150)
                        Text(calculateBedtime)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                } header: {
                    Text("Your ideal bedtime is")
                        .font(.headline)
                }
            }
            .navigationTitle("BetterRest")
            /*.toolbar{
                Button("Calculate", action: calculateBedtime)
            }*/
            /*.alert(alertTitle, isPresented: $showAlert){
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }*/
        }
    }
    
    var calculateBedtime: String{
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            // Get the hour and minutes from the wake up time selected by the user
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            // Get the hour and minutes in seconds
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // Feed the values to the CoreML module
            let prediction = try model.prediction(wake: Double(hour + minute),
                                estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            // Get the time the user needs to go to sleep by substracting the actualSleep from the wakeup value
            // The actualSleep is in seconds
            //let sleepTime = wakeUp - prediction.actualSleep
            let idealBedtime = wakeUp - prediction.actualSleep
            
            return idealBedtime.formatted(date: .omitted, time: .shortened)
            //alertTitle = "Your ideal bedtime is..."
            //alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
            return alertMessage
        }
        //showAlert = true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
