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
            VStack(spacing: 0){
                        ZStack(alignment:.top){
                            
                            Group{
                                Image(tapData.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .overlay(Color.green.opacity(0.2))
                                    .frame(height: size.height / 2)
                                    .matchedGeometryEffect(id: tapData.id + "IMAGE", in: animation)
                                    .offset(y:-130)
                                Text(tapData.name)
                                    .font(.custom("Avenir-Heavy", size: 30,relativeTo: .title))
                                    //.minimumScaleFactor(0.2)
                                    .padding(.top, 95.0)
                                    .foregroundColor(Color("white"))
                                    .multilineTextAlignment(.center)
                                    .shadow(radius: 5)
                                    .matchedGeometryEffect(id: tapData.id + "TITLE", in: animation)
                                
                            }
                           
                            HStack{
                                Button(action:
                                        {
                                            withAnimation(.spring()){showDetailContent = false}
                                            withAnimation(.spring().delay(0.01)){
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
                            .opacity(showDetailContent ? 1 :0)
                            .frame(maxWidth:.infinity,maxHeight:100,alignment: .topLeading)
                        }
                        Divider()
                        VStack(alignment:.center){
                            Text(tapData.description)
                                .font(.custom("Avenir-Medium", size: 17))
                                .padding(.leading,10)
                                .padding(.top,10)
                                .matchedGeometryEffect(id: tapData.id+"DESCRIPTION", in: animation)
                            Divider().overlay(Color(.gray))
                            HStack(alignment:.top){
                                
                                VStack(alignment:.leading){
                                   
                                    Text("\(tapData.duration) min")
                                        .padding(.all,6).background(Color("accentColor1")).clipShape(Capsule())
                                        .font(.custom("Avenir-Heavy", size: 18))
                                        .foregroundColor(Color.white)
                                        .offset(y:-9)
                                        .matchedGeometryEffect(id: tapData.id + "DURATION", in: animation)
                                    
                                }
                                .padding(.leading,10)
                                Button(action:{}){
                                    Image(systemName: "play.fill")
                                        .font(.system(size:20))
                                        .padding(.horizontal,40)
                                        .padding(.vertical,5)
                                        .onTapGesture(perform: {
                                            withAnimation(.spring()){
                                               // appModel.currentActiveItem = tapData
                                               // appModel.showDetailView = true
                                        }
                                        })
                                }
                                    .foregroundColor(.white)
                                    .background(Color("accentColor1"))
                                    .cornerRadius(40)
                                    .padding(.trailing,10)
                                    .padding(.leading,20)
                            }
                            .padding(.top,10)
                            Divider()
                            Text("Fear can often cause a “deer in the headlights” type feeling that can cause you to shut down and lose the ability to think. It may even trigger you back to a time when you felt like you did fail. This tapping devotional is a great way to find acceptance and love when you rely on the God of Love to lift you into acceptance and peace. Use this time to let those parts of you know you are accepted and safe while releasing this fear.")
                                .font(.custom("Avenir-", size: 20,relativeTo: .title))
                                .padding(.horizontal,20)
                                .foregroundColor(Color("black"))
                        }
                        .frame(width: size.width-20, height: 500, alignment: .topLeading)
                        .background{
                            Color("white")
                                .mask(
                                      RoundedRectangle(cornerRadius: 30,style:.continuous)
                                          //.matchedGeometryEffect(id: "mask", in: animation)
                                  )
                                .matchedGeometryEffect(id: tapData.id+"background", in: animation)
                        }
                        .offset(y:-240)
                }
                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
                .background{
                    LinearGradient(gradient: Gradient(colors: [Color("GradBlue1"), Color("GradBlue2")]), startPoint: .top, endPoint: .bottom)
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
