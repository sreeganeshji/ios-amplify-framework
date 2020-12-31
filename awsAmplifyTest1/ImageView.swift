//
//  ImageView.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/29/20.
//

import SwiftUI

struct ImageView: View {
    @Binding var image:UIImage
    var body: some View {
        GeometryReader{
            reader in
        VStack{
           
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
        .frame(width:reader.size.width)
                
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: .constant(.init()))
    }
}
