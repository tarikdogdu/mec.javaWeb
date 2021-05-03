//
//  TryViewsView.swift
//  Practice
//
//  Created by Burhan Tarık Doğdu on 11.03.2021.
//

import SwiftUI

struct TryViewsView: View {
    
    
    
    var body: some View {
        
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Text("SwiftUI for iOS 14")
                    .bold()
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .shadow(radius: 4)
            
                Button("Hey", action:{
//                   action
                }
                )
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .accentColor(.blue)
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.05)
                .background(Color.white)
                .shadow(radius: 4)
                
                Button(action: {
                    //ACTİON
                }){
                    Text("Hey do.")
                        .foregroundColor(Color.blue)
                        .frame(width:UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                }
                .padding(.bottom, UIScreen.main.bounds.height*0.008)
                .frame(width:UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                .background(Color.white)
                .shadow(radius: 8)
        
                Spacer()
            }
            VStack{
                lazy var button: CustomButton = {
                    let button = CustomButton()
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.setTitleColor(.white, for: .normal)
                    button.setTitle("Sign Up", for: .normal)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                    return button
                }()
            }
            
        }.navigationBarHidden(true)
    }
}

struct TryViewsView_Previews: PreviewProvider {
    static var previews: some View {
        TryViewsView()
    }
}
