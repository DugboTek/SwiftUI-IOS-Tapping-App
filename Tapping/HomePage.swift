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
                    ForEach(0..<5) { _ in
                        TopicCard()
                        
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
                TappingCard()
                TappingCard()
                TappingCard()
                TappingCard()

            }
                .padding(.top, 10)
                .padding(.horizontal, 10)

            
        }
      
    }
    
}
    


struct TopicCard: View {
    var body: some View{
        VStack{
            Text("Anxiety")
                .font(.custom("Avenir-Heavy", size: 20))
                .frame(height:120)
                .cornerRadius(24)
                .padding(.top,4)
                
        }
        .frame(width:130,height:40)
        .background(Color("background"))
        .cornerRadius(30)
        .shadow(radius: 2)
        .padding(.bottom,10)

    }
    
}

struct TappingCard: View {
    var body: some View{
        VStack{
            HStack(alignment: .center){
                Text("Anxiety")
                    .font(.custom("Avenir-Heavy", size: 30))
                    .cornerRadius(24)
                    .padding(.leading,20)
                    .padding(.bottom,50)
                    .padding(.top,20)
                    .foregroundColor(Color("textMain"))
                VStack(alignment: .trailing){
                    Text("20 min")
                        .padding(.all,6).background(Color("accentColor1")).clipShape(Capsule())
                        .font(.custom("Avenir-Heavy", size: 18))
                        .foregroundColor(Color.white)
                        .padding(.bottom,20)
                    tapNowButton()
                }
               

            }
            .padding(.top,20)

            Text("Through prayer and tapping this audio guides you through how to deal with anxiety")
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
                
                Text("Tap Now")
                    .font(.custom("Avenir-Heavy", size: 20))
                    .padding(.trailing,10)
                    .padding(.leading,10)
                   
                Image(systemName: "chevron.forward")
                    .padding(.trailing,10)
            }
            .foregroundColor(.white)
            .frame(width: 140, height: 35, alignment: .center)
            .background(Color("accentColor1"))
            .cornerRadius(40)
        }
    }
}
