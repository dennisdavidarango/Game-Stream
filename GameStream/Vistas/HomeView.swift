//
//  Home.swift
//  GameStream
//
//  Created by Dennis David Arango Mendieta on 13/04/22.
//

import SwiftUI
import AVKit


struct HomeView: View {
    
    
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado){
            
            
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person").foregroundColor(.accentColor)
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .tabItem{
                    Image(systemName: "gamecontroller").foregroundColor(.accentColor)
                    Text("Juegos")
                }.tag(1)
            
            Home()
                .tabItem{
                    Image(systemName: "house").foregroundColor(.accentColor)
                    Text("Inicio")
                }.tag(2)
            
          FavoritesView()
                .tabItem{
                    Image(systemName: "heart").foregroundColor(.accentColor)
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)
        
    }
    
    init(){
        
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando las vistas de home")
        
    }
    
    
    
    
    
    
}

struct Home: View {
    
   
    
    var body: some View {
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            
            VStack {
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 200).padding(.horizontal, 11.0 )
                
              
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                    
                }
                
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    
//    func busqueda() {
//        print("El usuario esta buscando \(textoBusqueda)")
//    }
}

struct SubModuloHome : View {
    
    @State var isGameInfoEmpty = false
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var textoBusqueda = ""
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    var body: some View {
        
        
        
        VStack {
            
            HStack{
                Button(action: {
                    watchGame(name: textoBusqueda)
                    
                    
                    
                }, label: {
                    
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                }).alert(isPresented: $isGameInfoEmpty ){
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                }
                
                ZStack(alignment: .leading){
                    if textoBusqueda.isEmpty{
                        Text("Buscar un video").foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                }
            }.padding([.top, .leading, .bottom], 11)
                .background(Color("Blue-Gray"))
                .clipShape(Capsule())
            Text("LOS MAS POPULARES").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ZStack{
                
                Button(action: {
                    watchGame(name: "thewitcher")
                }, label: {
                    VStack(spacing: 0) {
                        
                        Image("thewitcher").resizable().scaledToFill()
                        
                        Text("The Witcher 3").frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray"))
                    }
                })
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42, height: 42, alignment: .center)
                
                
                
                
            }.frame(minWidth: 0,  maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
        }
        
        
        Text("CATEGORIAS SUGERIDAS PARA TI").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading).padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack{
                
                Button(action: {print("FPS")}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                        Image("shot").resizable().scaledToFill().frame(width: 42, height: 42)
                    }
                })
                
                Button(action: {}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                        Image("rpg-icon").resizable().scaledToFill().frame(width: 42, height: 42)
                    }
                })
                
                Button(action: {}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                        Image("OpenWorld").resizable().scaledToFill().frame(width: 42, height: 42)
                    }
                })
                
            }
            
            
        }
        
        Text("RECOMENDADOS PARA TI").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading).padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack{
                
                Button {
                    watchGame(name: "assassins_creed")
                } label: {
                    Image("assassins_creed").resizable().scaledToFill().frame(width: 240, height: 135)
                }
                Button {
                    watchGame(name: "dest")
                } label: {
                    Image("dest").resizable().scaledToFill().frame(width: 240, height: 135)
                }
                Button {
                   watchGame(name: "spiderman")
                } label: {
                    Image("spiderman").resizable().scaledToFill().frame(width: 240, height: 135)
                }


                
            }
            
            
        }
        
        
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
        
      
            isActive: $isGameViewActive,
            label: {EmptyView()})
        
    }
    
    func watchGame(name: String) {
        
        juegoEncontrado.search(gameName: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion =  juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
                
                
                
                
                
                
                
                
                
                
                
            }
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}
