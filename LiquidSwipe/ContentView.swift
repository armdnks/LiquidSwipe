//
//  ContentView.swift
//  LiquidSwipe
//
//  Created by armdnks on 12/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var offset: CGSize = .zero
    
    @State var showPage: Bool = false
    
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack {
            
            Color.primary.opacity(0.9)
                .ignoresSafeArea()
            
            ShowPage()
            
            Color.green
                .clipShape(LiquidShape(offset: offset))
                
                .offset(x: 0, y: screenHeight)
                
                .overlay(
                    Image(systemName: "chevron.up")
                        .resizable()
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 30, height: 12)
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                        .offset(x: 33, y: -55)
                        .gesture(DragGesture()
                                    .onChanged{ value in
                                        
                                        offset = value.translation
                                    }
                                    .onEnded{ value in
                                        
                                        withAnimation(.spring()) {
                                            
                                            if offset.height < -screenHeight / 3 {
                                                
                                                offset.height = -screenHeight - screenHeight * 3
                                                showPage.toggle()
                                                
                                            } else {
                                                
                                                offset = .zero
                                            }
                                        }
                                    }
                        )
                        .opacity(offset == .zero ? 1 : 0)
                    
                    , alignment: .bottomLeading
                )
                .ignoresSafeArea()
            
            if showPage {
                
                ZStack {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Hello,")
                            .font(.system(size: 60, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("World!")
                            .font(.system(size: 55, weight: .heavy))
                            .foregroundColor(.white)
                            .offset(x: 15, y: -10)
                        
                        HStack(spacing: 5) {
                            
                            Image(systemName: "chevron.left")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Back")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 15)
                        .padding(.leading, 3)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                offset = .zero
                                showPage.toggle()
                            }
                        }
                    }
                    .offset(x: -10, y: 25)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
