//
//  ContentView.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/7/22.
//

import SwiftUI
import CoreData

var darkmode = true;

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: .bottom){
            MainScroll()
            Home()
        }
    }
}

struct MainScroll: View{
    var body: some View{
        if darkmode {
            VStack{
                TextViewDark()
                SearchDark()
                FeaturedTappingRowDark()
                TappingTopicsDark()
            }
            .ignoresSafeArea()
            .background(Color("background"))
        }
        else{
            VStack{
                TextView()
                Search()
                FeaturedTappingRow()
                TappingTopics()
            }
            .ignoresSafeArea()
        }
        
    }
    
}

struct TextView: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Good Morning,")
                .font(.custom("Avenir-Heavy", size: 30))
                .padding(.top, 50)
          
            Text("Ready to start you day?")
                .font(.custom("Avenir-Medium", size: 18))
                .foregroundColor(Color(.systemGray))
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
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }.accentColor(.primary)
    }
}

struct FeaturedTappingRow: View{
    var body: some View{
        
        VStack {
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
        }
    }
}
struct TappingTopics:View{
    var body: some View{
        ScrollView( showsIndicators:false){
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
                .padding(.top,4)
                .padding(.horizontal,20)
                
        }
        .frame(width:130,height:200)
        .background(Image("ocean1").resizable().scaledToFill())
        .cornerRadius(30)
        .shadow(radius: 2)
        .padding(.top,10)
        .padding(.bottom,10)
        .padding(.horizontal, 10)

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


//dark mode views
struct TextViewDark: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Good Morning,")
                .font(.custom("Avenir-Heavy", size: 30))
                .padding(.top, 50)
                .foregroundColor(Color.white)
          
            Text("Ready to start you day?")
                .font(.custom("Avenir-Medium", size: 18))
                .foregroundColor(Color(.white))
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


struct SearchDark: View{
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
    

struct FeaturedTappingRowDark: View{
    var body: some View{
        
        VStack {
            Text("Featured Topics")
                .font(.custom("Avenir-Heavy", size: 23))
                .padding(.top,30)
                .padding(.horizontal,24)
                .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .center)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<5) { _ in
                        TopicCardDark()
                        
                    }
                }
            }
        }
    }
}
struct TappingTopicsDark:View{
    var body: some View{
        ScrollView( showsIndicators:false){
            TappingCardDark()
            TappingCardDark()
            TappingCardDark()
            TappingCardDark()

        }.padding(.top, 10)
      
    }
}
struct TopicCardDark: View {
    var body: some View{
        VStack{
            Text("Anxiety")
                .font(.custom("Avenir-Heavy", size: 20))
                .frame(height:120)
                .cornerRadius(24)
                .padding(.top,4)
                .padding(.horizontal,20)
                
        }
        .frame(width:130,height:100)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 2)
        .padding(.top,10)
        .padding(.bottom,10)
        .padding(.horizontal, 10)

    }
    
}

struct TappingCardDark: View {
    var body: some View{
        VStack{
            HStack(alignment: .center){
                Text("Anxiety")
                    .font(.custom("Avenir-Heavy", size: 30))
                    .cornerRadius(24)
                    .padding(.leading,20)
                    .padding(.bottom,50)
                    .padding(.top,20)
                    .foregroundColor(Color.black)
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
                .frame(maxWidth: .infinity,maxHeight:.infinity, alignment: .center)
                .background(Color.white)

                    
                
        }
        .frame(width:380,height:300)
        .background(Image("ocean1").resizable().scaledToFill())
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

struct navBar: View{
    @Binding var selectedTab: String
    
    @State var tabPoints : [CGFloat] = []
    var body: some View{
        HStack(spacing: 0){
            TabBarButton(image:"house",selectedTab: $selectedTab,tabPoints: $tabPoints)
            TabBarButton(image:"playpause",selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image:"heart",selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: getCurvePoints()))//192
        )
        .cornerRadius(30)
        
    }
    func getCurvePoints() ->CGFloat{
        if tabPoints.isEmpty{
            return 10
        }
        else{
            switch selectedTab {
            case "house":
                return tabPoints[0]
            case "playpause":
                return tabPoints[1]
            default:
                return tabPoints[2]
            }
        }
    }
}
struct TabBarButton: View{
   var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints : [CGFloat]
    var body:some View{
    
       GeometryReader{reader -> AnyView in
           let midX = reader.frame(in: .global).midX
           
           DispatchQueue.main.async {
               if tabPoints.count <= 3{
                   tabPoints.append(midX)
               }
           }
           return AnyView(
            Button(action: {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                    selectedTab = image
                }
            },label:{
             
                Image(systemName: "\(image)\(selectedTab == image ? ".fill": "")")
                    .font(.system(size:25,weight:.semibold))
                    .foregroundColor(Color("TabSelected"))
                    .offset(y: selectedTab == image ? -10: 0)
             })
             .frame(maxWidth: .infinity, maxHeight: .infinity)
           )
        }
       .frame(height:50)
  }
}

struct Home: View{
    @State var selectedTab = "house"
    var body: some View{
      
            navBar(selectedTab: $selectedTab)
            
    }
    }



