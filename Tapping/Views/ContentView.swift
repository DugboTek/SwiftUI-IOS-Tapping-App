//
//  ContentView.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/7/22.
//

import SwiftUI
import CoreData

var darkmode = true;

struct MainView: View {
    @StateObject var appModel: TappingViewModel = .init()
    @Namespace var animation
    
  
    var body: some View {
        ZStack(alignment: .bottom){
            if let tapData = appModel.currentActiveItem,appModel.showDetailView{
                DetailView(tapData: tapData,animation: animation)
                    .environmentObject(appModel)
                    .transition(.offset(x:1,y:1))
            }
            else{
                HomePage(animation: animation)
                    .environmentObject(appModel)
            }
            NavigationBar()
        }
       
            
        }
        
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


