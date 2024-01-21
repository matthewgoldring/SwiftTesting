//
//  WatchConnector.swift
//  SimpleWatchToPhone
//
//  Created by Matthew on 20/01/2024.
//

import Foundation
import WatchConnectivity

class WatchConnector: NSObject, WCSessionDelegate, ObservableObject{
    
    @Published var receivedMessage: String = ""
    
    var session: WCSession
    
    
    init (session: WCSession = .default){
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
   
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        DispatchQueue.main.async {
            self.receivedMessage = message["numberList"] as? String ?? ""
            UserDefaults.standard.set(self.receivedMessage, forKey:"numberList")
            
        }
        
        print(message["numberList"] ?? "")
        
        
    }
}
