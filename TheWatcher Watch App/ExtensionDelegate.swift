//
//  ExtensionDelegate.swift
//  WatchApp Watch App
//
//  Created by Matthew on 20/01/2024.
//

import Foundation
import WatchConnectivity

class ExtensionDelegate: NSObject, ObservableObject, WCSessionDelegate {
    //@Published var numbers: [Int] = []
    
    var session: WCSession
    
    init (session: WCSession = .default){
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }

//    func applicationDidFinishLaunching() {
//            if WCSession.isSupported() {
//                let session = WCSession.default
//                session.delegate = self
//                session.activate()
//            }
//        }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Handle activation completion
    }

    
    func sendNumbersToiOs(myNumbers: Array<Int>){
        if session.isReachable {
            print("Session IS reachable.")
            let data = "Numbers: \(myNumbers.map { String($0) }.joined(separator: ", "))"
            let message:[String: Any] = [
                "numberList":data
            ]
            session.sendMessage(message, replyHandler: nil)
            }
        else{
            print("Session not reachable")
            
        }
        
        }
        
    
    
    
//    func sendNumbersToPhone(myNumbers: Array<Int>) {
//        do {
//            print("Session IS reachable. numbers to phone.")
//            let data = "Numbers: \(myNumbers.map { String($0) }.joined(separator: ", "))"
//            let mymessage:[String: Any] = [
//                "allmyNumbers":data
//            ]
//            let session = WCSession.default
//            try session.updateApplicationContext(mymessage)
//        } catch {
//            print("Error Sending")
//        }
//    }
}
