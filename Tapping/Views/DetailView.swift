//
//  DetailView.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/28/22.
//

import Foundation
import SwiftUI
import CoreData


struct DetailView: View{
    var tapData : TapModel
    @EnvironmentObject var appModel: TappingViewModel
    var animation: Namespace.ID
    @State var showDetailContent: Bool = false

    var body: some View{
        GeometryReader{proxy in
            let size = proxy.size
            VStack{
                VStack{
                    VStack{
                        ZStack(alignment:.top){
                            
                            Group{
                                Image(tapData.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .overlay(Color.green.opacity(0.2))
                                    .frame(height: size.height / 2)
                                    .cornerRadius(30)
                                    .matchedGeometryEffect(id: tapData.id + "IMAGE", in: animation)
                                    .offset(y:-130)
                                Text(tapData.name)
                                    .font(.custom("Avenir-Heavy", size: 30,relativeTo: .title))
                                    .minimumScaleFactor(0.2)
                                    .padding(.top, 119.0)
                                    .foregroundColor(Color("white"))
                                    .multilineTextAlignment(.center)
                                    .shadow(radius: 5)
                                    .matchedGeometryEffect(id: tapData.id + "TITLE", in: animation)
                            }
                            Divider()
                            HStack{
                                Button(action:
                                        {
                                            withAnimation(.easeInOut){showDetailContent = false}
                                            withAnimation(.easeInOut.delay(0.05)){
                                                    appModel.showDetailView = false
                                            }
                                    
                                        }
                                )
                                {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                                Spacer()
                                
                                Button(action:{}){
                                    Image(systemName: "suit.heart.fill")
                                        .font(.title)
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                            }
                            .padding()
                            .frame(maxWidth:.infinity,maxHeight:100,alignment: .topLeading)
                            .opacity(showDetailContent ? 1 :0)
                            
                                
                        }
                        
                        
                    }
                }
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            .background{
                Color("white")
                    .ignoresSafeArea()
                    .opacity(showDetailContent ? 1 : 0)
            }
        }
        
        .onAppear{
            withAnimation(.easeInOut){
                showDetailContent = true
            }
        }
        
        
        /*
        */
        
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        MainView()
    }
}
