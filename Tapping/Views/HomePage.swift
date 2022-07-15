//
//  HomePage.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/10/22.
//

import Foundation
import SwiftUI
import CoreData



struct HomePage: View{
    @EnvironmentObject var appModel: TappingViewModel
    var animation: Namespace.ID
    
    var body: some View{
            VStack{
                TextView()
                Search()
                CategoryRowView()
                TappingListView()
            }
            .background(
            Image("ocean2")
                .resizable()
                .scaledToFill()
            )
            .ignoresSafeArea()

        
    }
    
    @ViewBuilder
    func tappingCardView(tapData:TapModel)->some View{
        ZStack{
                VStack{
                    ZStack(){
                        Group{
                            if appModel.currentActiveItem?.id == tapData.id && appModel.showDetailView{
                                Text(tapData.name)
                                    .font(.custom("Avenir-Heavy", size: 30,relativeTo: .title))
                                    .minimumScaleFactor(0.2)
                                    .padding(.leading, 20.0)
                                    .foregroundColor(Color("textMain"))
                                    //.opacity(0)
                                }
                            else{
                                Text(tapData.name)
                                    .font(.custom("Avenir-Heavy", size: 30,relativeTo: .title))
                                    .minimumScaleFactor(0.2)
                                    .padding(.leading, 20.0)
                                    .foregroundColor(Color("textMain"))
                                    .matchedGeometryEffect(id: tapData.id + "TITLE", in: animation)
                            }
                        }
                        
                        VStack(alignment: .trailing){
                            
                            Text("\(tapData.duration) min")
                                .matchedGeometryEffect(id: tapData.id+"DURATION", in: animation)
                                .padding(.all,6).background(Color("accentColor1")).clipShape(Capsule())
                                .font(.custom("Avenir-Heavy", size: 18))
                                .foregroundColor(Color.white)
                                .padding(.bottom,40)
                                .offset(x:120,y:-8)
                            Button(action:{}){
                                Image(systemName: "play.fill")
                                    .padding(10)
                                    .onTapGesture(perform: {
                                        withAnimation(.spring()){
                                            appModel.currentActiveItem = tapData
                                            appModel.showDetailView = true
                                    }
                                    })
                            }
                                .foregroundColor(.white)
                                .background(Color("accentColor1"))
                                .cornerRadius(40)
                                .offset(x:120,y:0)
                                
                             
                        }

                    }
                    .padding(.top,20)
                    
                    Text(tapData.description)
                        //.padding(.all,1)
                       // .matchedGeometryEffect(id: tapData.description, in: animation)
                        .font(.custom("Avenir-Medium", size: 17))
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity,maxHeight:.infinity, alignment: .center)
                        .background{
                            Color("white")
                                .matchedGeometryEffect(id: tapData.id+"background", in: animation)
                        }
                        .matchedGeometryEffect(id: tapData.id+"DESCRIPTION", in: animation)

                    
            }
            .frame(width:350,height:200)
          
            .background{
                Group{
                    if appModel.currentActiveItem?.id == tapData.id && appModel.showDetailView{
                        Image(tapData.image).resizable().scaledToFill()
                            
                            .overlay(Color.green.opacity(0.2))
                            .opacity(0)
                    }
                    else{
                        Image(tapData.image).resizable().scaledToFill()
                          /*  .mask(
                                RoundedRectangle(cornerRadius: 30,style:.continuous)
                                    .matchedGeometryEffect(id: "mask", in: animation)
                                    
                            )*/
                            .overlay(Color.green.opacity(0.2))
                            .matchedGeometryEffect(id: tapData.id + "IMAGE", in: animation)
                    }
                    
                }
               
            }
            .cornerRadius(30)
            .padding(.top,20)
            //.matchedGeometryEffect(id: "background", in: animation)
        }
    }
    
    @ViewBuilder
    func TextView()->some View{
            VStack(alignment: .leading){
                Text("Good Morning,")
                    .font(.custom("Avenir-Heavy", size: 30))
                    .padding(.top, 50)
                    .foregroundColor(Color("textMain"))
              
                Text("Ready to start you day?")
                    .font(.custom("Avenir-Medium", size: 18))
                    .foregroundColor(Color("textMain"))
            }
            .padding(.leading,30)
            .padding(.bottom,20)
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      alignment: .topLeading
                    )
            
        
    }
    
    @ViewBuilder
    func Search()->some View{
            HStack(){
                Text("Search for Tapping exercises")
                    .foregroundColor(.gray)
                    .font(.custom("Avenir-Medium", size: 18))
                    .padding(.leading,20)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .padding(.trailing,20)
                  
            }  .frame(height:54)
                .background(Color.white)
                .cornerRadius(14)
                .padding(.horizontal,30)
                .shadow(radius: 5)

    }
    
    @ViewBuilder
    func CategoryRowView()->some View{
            VStack(alignment:.leading) {
                Text("Featured Topics")
                    .font(.custom("Avenir-Heavy", size: 25))
                    .multilineTextAlignment(.leading)
                    .padding(.top,26.0)
                    .padding(.leading,25)
                    .foregroundColor(Color("textMain"))
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(topicsList) { TopicModel in
                            CatagoryCard(name:TopicModel.name)
                            
                        }
                    }
                }
            }
    }
    
    @ViewBuilder
    func CatagoryCard(name:String)->some View{
            VStack{
                Text(name)
                    .font(.custom("Avenir-Heavy", size: 20))
                    .frame(height:120)
                    .cornerRadius(24)
                    .padding(.horizontal,11.0)
                    
                    
            }
            .frame(height:40)
            .background(Color("background"))
            .cornerRadius(30)
            .shadow(radius: 2)
            .padding(.bottom,10)

    }
    
    @ViewBuilder
    func TappingListView()->some View{
            ZStack{
                ScrollView( showsIndicators:false){
                    
                        ForEach(tapList) { tapModel in
                            tappingCardView(tapData: tapModel)
                        }
                }
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
        }
    }
    
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
            MainView()
    }
}


/*struct TextView: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Good Morning,")
                .font(.custom("Avenir-Heavy", size: 30))
                .padding(.top, 50)
                .foregroundColor(Color("textMain"))
          
            Text("Ready to start you day?")
                .font(.custom("Avenir-Medium", size: 18))
                .foregroundColor(Color("textMain"))
        }
        .padding(.leading,30)
        .padding(.bottom,20)
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  alignment: .topLeading
                )
        
    }
}*/

/*struct Search: View{
    var body: some View{
        HStack(){
            Text("Search for Tapping exercises")
                .foregroundColor(.gray)
                .font(.custom("Avenir-Medium", size: 18))
                .padding(.leading,20)
            Spacer()
            Image(systemName: "magnifyingglass")
                .padding(.trailing,20)
              
        }  .frame(height:54)
            .background(Color.white)
            .cornerRadius(14)
            .padding(.horizontal,30)
            .shadow(radius: 5)
            
        
    }
}*/
    
/*struct CategoryRowView: View{
    var body: some View{
        
        VStack(alignment:.leading) {
            Text("Featured Topics")
                .font(.custom("Avenir-Heavy", size: 25))
                .multilineTextAlignment(.leading)
                .padding(.top,26.0)
                .padding(.leading,25)
                .foregroundColor(Color("textMain"))
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(topicsList) { TopicModel in
                        CatagoryCard(name:TopicModel.name)
                        
                    }
                }
            }
        }
       

    }
}*/

/*struct CatagoryCard: View {
    @State var name: String
    var body: some View{
        VStack{
          
            Text(name)
                .font(.custom("Avenir-Heavy", size: 20))
                .frame(height:120)
                .cornerRadius(24)
                .padding(.horizontal,11.0)
                
                
        }
        .frame(height:40)
        .background(Color("background"))
        .cornerRadius(30)
        .shadow(radius: 2)
        .padding(.bottom,10)

    }
    
}*/

/*struct TappingListView:View{
    @Namespace var animation
    @State var show = false
    @State var selectedTap: TapModel!
    
    var body: some View{
        ZStack{
            ScrollView( showsIndicators:false){
                
                    ForEach(tapList) { tapModel in
                        tappingCardView(tapData: tapModel)
                    }
            }
                .padding(.top, 10)
                .padding(.horizontal, 10)
  
        }
      
    }
    
}*/


/*struct TappingCard: View {
   
    var tapData: TapModel
    @State var show = false

    var animation : Namespace.ID
    
    var body: some View{
        ZStack{
                VStack{
                    ZStack(){
                        Text(tapData.name)
                            .matchedGeometryEffect(id: tapData.name, in: animation)
                            .font(.custom("Avenir-Heavy", size: 30,relativeTo: .title))
                            .minimumScaleFactor(0.2)
                            .padding(.leading, 20.0)
                            .foregroundColor(Color("textMain"))
                        VStack(alignment: .trailing){
                            
                            Text("\(tapData.duration) min")
                                .matchedGeometryEffect(id: tapData.duration, in: animation)

                                .padding(.all,6).background(Color("accentColor1")).clipShape(Capsule())
                                .font(.custom("Avenir-Heavy", size: 18))
                                .foregroundColor(Color.white)
                                .padding(.bottom,40)
                                .offset(x:120,y:-8)
                            Button(action:{}){
                                Image(systemName: "play.fill")
                                    .padding(10)
                                    .onTapGesture{
                                        withAnimation(.easeIn){
                                            show.toggle()
                                            print(show ? "True":"false")
                                        }
                                        
                                    }
                            }
                                .foregroundColor(.white)
                                .background(Color("accentColor1"))
                                .cornerRadius(40)
                                .offset(x:120,y:0)
                                
                             
                        }

                    }
                    .padding(.top,20)

                    Text(tapData.description)
                        //.padding(.all,1)
                        .matchedGeometryEffect(id: tapData.description, in: animation)
                        .font(.custom("Avenir-Medium", size: 17))
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity,maxHeight:.infinity, alignment: .center)
                        .background(Color.white)

                    
            }
            .frame(width:350,height:200)
          
           .background(Image(tapData.image).resizable().scaledToFill()            .overlay(Color.green.opacity(0.2)))
            .cornerRadius(30)
            .padding(.top,20)
        }
        }
    }*/

/*struct tapNowButton: View{
    @State var pressed = true
     
    var body: some View{
        Button(action: {
            print("Delete tapped!")
        }) {
            HStack {
               
                   
                Image(systemName: "play.fill")
                    .padding(10)
            }
            .foregroundColor(.white)
            .background(Color("accentColor1"))
            .cornerRadius(40)
            .offset(x:50,y:0)

        }
    }
}*/
