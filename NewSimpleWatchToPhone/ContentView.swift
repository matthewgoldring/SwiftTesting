//
//  ContentView.swift
//  SimpleWatchToPhone
//
//  Created by Matthew on 20/01/2024.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    
    @StateObject var myconnector = WatchConnector()
    @State var message = ""
    
    
        func getDataFromWatch(){
            if let storedDataFromWatch = UserDefaults.standard.string(forKey: "numberList"){
                self.message = storedDataFromWatch.description
            } else{
                self.message = "No data Recorded from watch"
                
            }
        }
    

    
    var body: some View {
        VStack {
            
            Image(systemName: "soccerball.inverse")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("My App to send from watch to phone. I can put names and colours here and then see the scores after.")
            
            Button(action: {
                self.getDataFromWatch()
                
            }, label: {
                Text("Get the message from watch")
            })
            
            
            if (self.message == "") {
                Text("No Data Sent Yet")
            }
            else {
                Text(self.message)
            }
            
            
        }
        .padding()
        
        
       
    }
}

#Preview {
    ContentView()
}
