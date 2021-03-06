//
//  awsAmplifyTest1App.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/27/20.
//

import SwiftUI
import Amplify
import AmplifyPlugins

@main
struct awsAmplifyTest1App: App {
    init() {
        print("Configuring Amplify framework")
        
        do{
            Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
        }
        catch{
            print("could'nt configure due to error: \(error)")
        }
        
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(DataModels())
        }
    }
}
