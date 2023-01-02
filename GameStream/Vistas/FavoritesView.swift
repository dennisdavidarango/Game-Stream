//
//  FavoritesView.swift
//  GameStream
//
//  Created by Dennis David Arango Mendieta on 15/04/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    
    var body: some View {
        
        ZStack{
            
            
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 9.0)
                
                ScrollView{
                    
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self) {
                        juego in
                        
                        VStack(spacing: 0){
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame( height: 300)
                            
                            Text("\(juego.title)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame( maxWidth: .infinity,alignment: .leading)
                                .background(Color("Blue-Gray"))
                        }
                        
                        
                        
                        
                        
                    }
                    
                }.padding(.bottom, 8)
                
                
            }.padding(.horizontal, 6)
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
