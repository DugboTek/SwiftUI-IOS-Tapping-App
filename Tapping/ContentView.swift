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
            HomePage()
            NavigationBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }.accentColor(.primary)
    }
}


