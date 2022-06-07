//
//  ContentView.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/7/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    init(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for:.any, barMetrics:.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .systemGroupedBackground
    }
    
    var body: some View {
        MainScroll()
    }
}

struct MainScroll: View{
    var body: some View{
        ScrollView( showsIndicators: false){
            VStack(alignment:.leading){
                Text("Good Morning,")
                    .font(.custom("Avenir-Heavy", size: 30))
                Text("Jane")
                    .font(.custom("Avenir-Heavy", size: 30))
                Text("Ready to start you day?")
                    .font(.custom("Avenir-Medium", size: 18))
                    .foregroundColor(Color(.systemGray))
                HStack{
                    Spacer()
                }
            }.padding(24)
            
            Search()
            FeaturedTappingRow()
            TappingTopics()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button{
            
        } label: {
            Image(systemName: "list.bullet")
        }, trailing: Button{
            
        } label: {
            Image(systemName: "bell")
        })
        
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
        
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }.accentColor(.primary)
    }
}

struct FeaturedTappingRow: View{
    var body: some View{
        Text("Featured Topics")
            .font(.custom("Avenir-Medium", size: 23))
            .padding(.top,30)
            .padding(.horizontal,24)
            .frame(maxWidth: .infinity, alignment: .center)
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(0..<5) { _ in
                    TopicCard()
                }
            }
        }
        .padding(.bottom,20)

    }
}
struct TappingTopics:View{
    var body: some View{
        VStack{
            TappingCard()
            TappingCard()
            TappingCard()
            TappingCard()

        }.padding(.top, 10)
      
    }
}
struct TopicCard: View {
    var body: some View{
        VStack{
            Text("Anxiety")
                .font(.custom("Avenir-Medium", size: 15))
                .frame(height:120)
                .cornerRadius(24)
                .background(Color.white)
                .padding(.top,4)
                .padding(.horizontal,20)
                
        }
        .frame(width:130,height:100)
        .background(Color.white)
        .cornerRadius(30)
    }
    
}

struct TappingCard: View {
    var body: some View{
        VStack{
            HStack{
                Text("Anxiety")
                    .font(.custom("Avenir-Medium", size: 30))
                    .cornerRadius(24)
                    .padding(.horizontal,20)
                    .padding(.trailing,50)
                Text("20 min")
                    .padding(.all,6).background(Color.white).clipShape(Capsule())
                    .font(.custom("Avenir-Medium", size: 15))

            }
            .padding(.top,20)

            Text("Through prayer and tapping this audio guides you through how to deal with anxiety")
                //.padding(.all,1)
                .font(.custom("Avenir-Medium", size: 17))
                .frame(maxWidth: .infinity,maxHeight:.infinity, alignment: .center)
                .background(Color(UIColor.systemRed).opacity(0.3))

                    
                
        }
        .frame(width:330,height:200)
        .background(Color(UIColor.systemOrange).opacity(0.3))
        .cornerRadius(30)
        .padding(.top,20)
    }
    
}

