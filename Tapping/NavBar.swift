//
//  NavBar.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/10/22.
//

import SwiftUI


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
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width:10,height:10)
                .offset(x:getCurvePoints()-5)
            ,alignment: .bottomLeading
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

struct NavigationBar: View{
    @State var selectedTab = "house"
    var body: some View{
      
            navBar(selectedTab: $selectedTab)
            
    }
}

