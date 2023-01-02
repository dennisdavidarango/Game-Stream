//
//  ContentView.swift
//  GameStream
//
//  Created by Dennis David Arango Mendieta on 12/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            
            ZStack {
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                VStack{
                    
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 200).padding(.bottom, 42 )
                    
                    InicioYRegistroView()
                    
                }
                
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}


struct  InicioYRegistroView : View {
    
    @State var tipoInicioSesion = true
    
    
    var body: some View{
        
        VStack{
            
            HStack {
                Spacer()
                Button("INICIA SESION") {
                    tipoInicioSesion = true
                    print("Pantalla Inicio Sesion")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button("REGISTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla registrate")
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()
                
                
            }
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            }else{
                RegistroView()
            }
        }
    }
}


struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contrasena = ""
    @State var isPantallaHomeActive = false
    
    var body: some View {
        
        
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                
                Text("Correo Electronico").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                        Text("Escribe tu Email").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo).foregroundColor(.white)
                    
                }
                
                Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                        Text("Escribe tu password").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contrasena).foregroundColor(.white)
                    
                }
                
                Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Olvidaste tu contraseña?").foregroundColor(Color("Dark-Cian")).font(.footnote).frame(width: 300, alignment: .trailing)
                
                Button(action: iniciarSesion) {
                    Text("INICIAR SESION").fontWeight(.bold).foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                }
                
                Text("Inicia Session con redes sociales").foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .font(.subheadline)
                    .frame( maxWidth: .infinity, alignment: .center)
                
                HStack{
                    
                    Button("Facebook") {
                        print("Facebook")
                    }.foregroundColor(.white)
                        .font(.caption)
                        .frame( maxWidth: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15)).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Dark-Cian")))
                    
                    Spacer(minLength: 30)
                    
                    Button("Twitter") {
                        print("Twitter")
                    }.foregroundColor(.white)
                        .font(.caption)
                        .frame( maxWidth: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15)).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Dark-Cian")))
                    
                }
                
            }.padding(.horizontal, 77.0)
            
            NavigationLink(destination: HomeView(),
                           isActive: $isPantallaHomeActive, label: {
                EmptyView()
            } )
             
        }
    }
    
    func iniciarSesion() {
        print("Estoy iniciando sesion")
        isPantallaHomeActive = true
    }
}

struct RegistroView: View {
    
    @State var correo = ""
    @State var contrasena =  ""
    @State var confirmarContrasena =  ""
    
    
    
    var body: some View {
        ScrollView {
            
            
            VStack(alignment: .center){
                
                Text("Elige una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla mas adelante")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .padding(.bottom)
                
                Button(action: tomarFoto) {
                    ZStack {
                        Image("perfilEjemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera").foregroundColor(.white)
                        
                    }
                }.padding(.bottom)
                
                
            }
            
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading){


                    Text("Correo Electronico*").foregroundColor(Color("Dark-Cian")).frame(width: 300, alignment: .leading)

                ZStack(alignment: .leading){

                    if correo.isEmpty {
                        Text("Escribe tu Email").font(.caption).foregroundColor(.gray)
                    }

                    TextField("", text: $correo).foregroundColor(.white)

                }

                Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)

                Text("Contraseña").foregroundColor(.white)

                ZStack(alignment: .leading){

                    if contrasena.isEmpty {
                        Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                    }

                    SecureField("", text: $contrasena).foregroundColor(.white)

                }
                    Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Confirmar Contraseña").foregroundColor(.white)

                ZStack(alignment: .leading){

                    if contrasena.isEmpty {
                        Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                    }

                    SecureField("", text: $confirmarContrasena).foregroundColor(.white)

                }

                Divider().frame( height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
            }
                

                Button(action: registrate) {
                    Text("REGISTRATE").fontWeight(.bold).foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                }

                Text("Inicia Session con redes sociales").foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .font(.subheadline)
                    .frame( maxWidth: .infinity, alignment: .center)

                HStack{

                    Button("Facebook") {
                        print("Facebook")
                    }.foregroundColor(.white)
                        .font(.caption)
                        .frame( maxWidth: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15)).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Dark-Cian")))

                    Spacer(minLength: 30)

                    Button("Twitter") {
                        print("Twitter")
                    }.foregroundColor(.white)
                        .font(.caption)
                        .frame( maxWidth: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15)).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Dark-Cian")))

                }

            }.padding(.horizontal, 77.0)
        }
    }
}

func registrate(){
    print("Registrate")
}

func tomarFoto(){
    print("Tomar foto")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla2").resizable()
        ContentView()
        
    }
}
