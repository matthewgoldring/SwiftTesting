//
//  ContentView.swift
//  WatchApp Watch App
//
//  Created by Matthew on 20/01/2024.
//

import SwiftUI

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct ContentView: View {
    
    @State var number: String = ""
    @State private var numbers: [Int] = []
    @State var date = Date.now
    @StateObject var myconnector = ExtensionDelegate()
    @State private var watchActivated = false
    
    
    var body: some View {
        VStack {
            
            Text("Numbers: \(numbers.map { String($0) }.joined(separator: ", "))")
                            .padding()
            
            TextField("What is your number?", text:$number).font(.system(size: 14))
            
            Button(action: {
                if let thisNumber = Int(number) {
                    numbers.append(thisNumber)
                    number = ""
                } else { number = ""}
                
            }, label: {
                Text("Send")
            }).controlSize(.mini)
            
            Button(action: {
                numbers = []
                
            }, label: {
                Text("Reset")
            }).controlSize(.mini)
            
            Button(action: {
                //ExtensionDelegate().sendNumbersToPhone(myNumbers: numbers)
                myconnector.sendNumbersToiOs(myNumbers: numbers)
                
                
            }, label: {
                Text("Send to Phone")
            }).controlSize(.mini)
            
        }
        .padding()
        .ignoresSafeArea()
        
    }
    
    
    
    
}


#Preview {
    ContentView()
}
