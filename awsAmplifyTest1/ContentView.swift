//
//  ContentView.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/27/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data:DataModels
    @State var images:[UIImage] = []
    @State var text:String = ""
    @State var received:String = ""
    @State var addPhotosPresent:Bool = false
    var body: some View {
        NavigationView{
        List{
            TextField("Write here", text: self.$text)
            Text(self.received)
            Button(action:upDownload){
                Text("Upload")
            }
            Button(action:download){
                Text("Download")
            }
            Button(action:{self.addPhotosPresent = true})
            {
                Text("Add photos")
            }
            if(images.count>0){
                NavigationLink(destination:
                                ImageView(image: $images[0]))
            {
                Text("view photo")
            }
            }

        }
        }
        .sheet(isPresented: self.$addPhotosPresent, content: {
            PhotosPicker(isPresented: self.$addPhotosPresent, Images: self.$images)
        })
        
    }
    
    func upload(){
        //upload
        self.data.amplifyManager.uploadData(data: self.text.data(using: .utf8)!)
    }
    
    func download(){
        //download
        self.data.amplifyManager.downloadData(completion: updateData)
    }
    
    func upDownload(){

        upload()
        download()
 
    }
    
    func updateData(data:Data){
    
            self.received = String(data: data, encoding: .utf8) ?? "Couldn't update"
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataModels())
    }
}
