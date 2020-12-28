//
//  AmplifyFileManager.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/27/20.
//

import Foundation
import Combine
import Amplify

class AmplifyStorage{
    var resultSink : AnyCancellable?
    var progressSink : AnyCancellable?
    
    func uploadData(data:Data) {
        //uploading data with an existing key will overwrite the previous data.
        print("Uploading ", String(data: data, encoding: .utf8))
        
        let storageOperation = Amplify.Storage.uploadData(key: "data stuff", data: data)
        
        progressSink = storageOperation.progressPublisher.sink(receiveValue: { (progress:Progress) in
            print("progress is \(progress)")
        })
        
        resultSink = storageOperation.resultPublisher.sink(receiveCompletion: { (receive :Subscribers.Completion<StorageError>) in
            if case let .failure(StorageError) = receive{
                print("Failed \(StorageError.errorDescription), and \(StorageError.recoverySuggestion)")
            }
        }, receiveValue: { (data:String) in
            print("Data is : ",data)
        })
    }
    
    func downloadData(completion:@escaping (Data)->()) {
        let storageOperation = Amplify.Storage.downloadData(key: "data stuff")
        progressSink = storageOperation.progressPublisher.sink { (progress:Progress) in
            print("Progress is \(progress)")
        }
        resultSink = storageOperation.resultPublisher.sink {
            if case let .failure(StorageError) = $0{
                print("Failed: \(StorageError.debugDescription) and \(StorageError.recoverySuggestion)")
            }
        } receiveValue: {
            (data:Data) in
            print("Data is \(data)")
            completion(data)
        }

    }
}
