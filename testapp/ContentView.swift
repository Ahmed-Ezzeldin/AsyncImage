//
//  ContentView.swift
//  testapp
//
//  Created by Codemaker on 21/05/2022.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
        
    }
}


struct ContentView: View {
    
    //    let imageUrl: String = "https://cdn.mos.cms.futurecdn.net/yCPyoZDQBBcXikqxkeW2jJ-1200-80.jpg";
    let imageUrl: String = "https://www.esri.com/news/arcuser/0610/graphics/nospin_1-lg.jpg";
    var body: some View {
        //        ================================================================== AsyncImage Using
        //        AsyncImage(url: URL(string: imageUrl)) {
        //            image in image.imageModifier()
        //        } placeholder: {
        //            Image(systemName: "photo.circle.fill").iconModifier()
        //        }.padding(40 )
        //        ================================================================== AsyncImage Using Phase
        //        AsyncImage(url: URL(string: imageUrl)) { phase in
        //            if let image = phase.image{
        //                image.imageModifier()
        //            }else if phase.error != nil {
        //                Image(systemName: "ant.circle.fill").iconModifier()
        //            }else{
        //                Image(systemName: "photo.circle.fill").iconModifier()
        //            }
        //        }
        //        .padding()
        //        ================================================================== AsyncImage Using Animation
        AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation:  .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            switch phase {
            case .success(let image): image.imageModifier()
                //                    .transition(.move(edge: .bottom))
                //                    .transition(.slide)
                    .transition(.scale)
            case .failure(_): Image(systemName: "ant.circle.fill").iconModifier()
            case .empty: Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                //                Text("Hello")
                ProgressView()
            }
            
        }.padding(40)
        //        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
