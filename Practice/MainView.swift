//
//  MainView.swift
//  Practice
//
//  Created by Burhan Tarık Doğdu on 6.03.2021.


import SwiftUI
import UIKit
import BLTNBoard
import CoreBluetooth
import MapKit

struct MainView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State var isVisible = false
    @State var PopAlert = false
    @State var requestedData = ""
    
    func AlertView(){
        let alert = UIAlertController(title: "Example Alert", message: "Are you sure?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Cancelled.")
        }))
    }
    
    func alertView (){
        let alert = UIAlertController(title: "Example", message: "This is message panel.", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Cancel", style: .default){ (_) in
            //                codes here for confirm
        }
        let cancel = UIAlertAction(title: "Confirm", style: .cancel){ (_) in
            //                codes here for cancel
        }
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            
        })
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("")
                    .foregroundColor(Color.white)
                    .padding(.bottom, UIScreen.main.bounds.height*0.02)
                
                Button("Request", action: {
                    requestedData = executeLogin()
                    print("Button Data")
                    print(requestedData)
                })
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.05)
                .background(Color.white)
                .shadow(radius: 4)
                
                Text("")
                    .foregroundColor(Color.white)
                    .padding(.bottom, UIScreen.main.bounds.height*0.02)
                
                Button("Pop-Up", action:{
                    withAnimation(.easeIn, {
                        alertView()
                        
                    })
                }
                )
                .accentColor(.blue)
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.05)
                .background(Color.white)
                .shadow(radius: 4)
                
                Text("")
                    .foregroundColor(Color.white)
                    .padding(.bottom, UIScreen.main.bounds.height*0.02)
                
                Button("Bluetooth", action:{
//                   bluetooth action
                }
                )
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
                .accentColor(.blue)
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.05)
                .background(Color.white)
                .shadow(radius: 4)
            
                Spacer()
            }
            .padding()
            .navigationTitle("Practice App")
            .navigationBarItems(trailing: NavigationLink("Views", destination: TryViewsView()))
            
            
            
        }.opacity(isVisible ? 1.0 : 0.0)
        .animation(.easeIn(duration: 1.5))
        .onAppear {isVisible=true}
    }
}
