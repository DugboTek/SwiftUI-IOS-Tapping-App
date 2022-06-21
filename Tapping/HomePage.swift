//
//  HomePage.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/10/22.
//

import Foundation
import SwiftUI
import CoreData


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomePage()
        }.accentColor(.primary)
    }
}

struct HomePage: View{
    @Namespace var namespace
    
    var body: some View{
            VStack{
                TextView()
                Search()
                FeaturedTappingRow()
                TappingTopics()
            }
            .background(
            Image("ocean2")
                .resizable()
                .scaledToFill()
            )
            .ignoresSafeArea()

        
    }
    
}

struct TextView: View{
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
}


struct Search: View{
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
}
    

struct FeaturedTappingRow: View{
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
                        TopicCard(name:TopicModel.name)
                        
                    }
                }
            }
        }
       

    }
}
struct TappingTopics:View{
    var body: some View{
        ZStack{
            ScrollView( showsIndicators:false){
                ScrollViewReader{ value in
                    ForEach(tapList) { TapModel in
                        TappingCard(name:TapModel.name,description: TapModel.description,duration: TapModel.duration)
                        
                    }
                }
             

            }
                .padding(.top, 10)
                .padding(.horizontal, 10)

            
        }
      
    }
    
}
    


struct TopicCard: View {
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
    
}

struct TappingCard: View {
    @State var name:String
    @State var description:String
    @State var duration: Int
    
    var body: some View{
        VStack{
            HStack(){
                Text(name)
                    .font(.custom("Avenir-Heavy", size: 30))
                    .cornerRadius(24)
                    .padding(.leading,20)
                    .padding(.bottom,50)
                    .padding(.top,20)
                    .foregroundColor(Color("textMain"))
                VStack(alignment: .trailing){
                    Text("\(duration) min")
                        .padding(.all,6).background(Color("accentColor1")).clipShape(Capsule())
                        .font(.custom("Avenir-Heavy", size: 18))
                        .foregroundColor(Color.white)
                        .padding(.bottom,20)
                        .offset(x:50,y:0)
                    tapNowButton()
                }
               

            }
            .padding(.top,20)

            Text(description)
                //.padding(.all,1)
                .font(.custom("Avenir-Medium", size: 17))
                .padding(.horizontal,10)
                .frame(maxWidth: .infinity,maxHeight:.infinity, alignment: .center)
                .background(Color.white)

                    
                
        }
        .frame(width:350,height:300)
        .background(Image("forest2").resizable().scaledToFill())
        .cornerRadius(30)
        .padding(.top,20)
    }
    
}

struct tapNowButton: View{
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
}
