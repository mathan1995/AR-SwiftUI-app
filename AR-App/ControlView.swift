//
//  ControlView.swift
//  AR-App
//
//  Created by Mathan Jeya on 12/06/2021.
//

import SwiftUI

struct ControlView:View {
    @Binding var isControlsVisible : Bool
    var body: some View{
        VStack{
            ControlVisibilityToggleButton(isControlsVisible : $isControlsVisible)
            Spacer()
           
            if isControlsVisible{
                ControlButtonBar()
            }
        }
    }
}

struct ControlVisibilityToggleButton:View {
    @Binding var isControlsVisible : Bool
    var body: some View{
        HStack
        {
           Spacer()
            ZStack{
                Color.black.opacity(0.25)
                Button(action:{
                    print("controll visibility Toggle presse")
                    self.isControlsVisible.toggle()
                }){
                    Image(systemName: self.isControlsVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size:25))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(8.0)
        }
        .padding(.top,45)
        .padding(.trailing,20)
    }
}

struct ControlButtonBar:View {
    var body: some View{
        HStack
        {
         
            // Button 1
            
            ControlButton(systemIconName: "clock.fill") {
                print("MostRecentlyPlacedbutton pressed")
            }
            
            Spacer()
            
            // Button 2
            
            ControlButton(systemIconName: "square.grid.2x2") {
                print("Button is pressed")
            }
            
           
            
            Spacer()
            
            
            // Button 3
            
            ControlButton(systemIconName: "slider.horizontal.3") {
                print("Setting Button is pressed")
            }
          
            
        }
        .frame(maxWidth:500)
        .padding(30)
        .background(Color.black)
        .opacity(0.25)
    }
}


struct ControlButton:View {
    let systemIconName : String
    let action : () -> Void
    var body: some View{
        Button(action: {
            self.action()
        }){
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50, alignment: .center)
    }
}
