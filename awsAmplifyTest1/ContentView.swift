//
//  ContentView.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/27/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data:DataModels
    @State var text:String = ""
    var body: some View {
        VStack{
            TextField("Write here", text: self.$text)
            Text(self.text)
            Button(action:{self.data.amplifyManager.uploadData(data: self.text.data(using: .utf8)!)}){
                Text("Upload")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataModels())
    }
}
