//
//  SaveData.swift
//  GameStream
//
//  Created by Dennis David Arango Mendieta on 15/04/22.
//

import Foundation

class SaveData {
    
    var correo: String = ""
    var contraseña: String = ""
    var nombre: String = ""
    
    func guardarDatos(correo:String, contraseña:String, nombre:String) -> Bool {
        
        print("Dentro de la funcion Guar datos obtuve: \(correo) + \(contraseña) + \(nombre)")
        
        UserDefaults.standard.set([correo, contraseña, nombre], forKey: "datosUsuario")
        
        return true
        
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en el metodo recuperar datos y recuperé: \(datosUsuario)")
        
        return datosUsuario
        
    }
    
    func validar(correo:String, contraseña:String ) -> Bool {
        
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("revisando si tengo datos en user defaults con el correo: \(correo) y la contraseña \(contraseña)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario" ) != nil{
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo guardado es \(correoGuardado) y la contrasena es \(contraseñaGuardada)")
            
            if(correo == correoGuardado && contraseña == contraseñaGuardada) {
                
                return true
                
            }else {
                return false
            }
            
        }else{
            print("No hay datos de user guardado")
            return false
        }
        
        
    }
    
    
}
