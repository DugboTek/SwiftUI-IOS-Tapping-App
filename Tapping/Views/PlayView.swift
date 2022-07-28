//
//  PlayView.swift
//  Tapping
//
//  Created by Sola Dugbo on 7/21/22.
//

import SwiftUI

struct PlayView: View {
    let image: String = "forest1"
    let text: String = "Dealing with Anxieity"
    let duration: Int = 12
    @State private var value: Double = 0.0
    //var tapData : TapModel
    //@EnvironmentObject var appModel: TappingViewModel
    //var animation: Namespace.ID
    //@State var showDetailContent: Bool = false
    
    var body: some View {
        ZStack(alignment:.topLeading){
            Image(image).resizable().ignoresSafeArea().scaledToFill()
            Rectangle()
                    .background(.thinMaterial)
                    .opacity(0.25)
                    .ignoresSafeArea()

            VStack(spacing:32){
                HStack{
                    Button
                    {
                        
                    } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        //.opacity(showDetailContent ? 1 :0)
                    
                    
                    }
                    Spacer()
 
                }
                .offset(x:60)
                Text(text)
                    .foregroundColor(.black)
                    .font(.custom("Avenir-Heavy", size: 30))
                Spacer()
                
                VStack(){
                    Slider(value: $value,in:0...60)
                        .accentColor(.white)
                    
                    HStack{
                        Text("0:00")
                        Spacer()
                        Text(String(duration) + ":00")
                    }
                    .padding()
                    .font(.caption)
                    .foregroundColor(.white)
                    
                    HStack{
                        Spacer()
                        PlaybackControlButton(systemName:"gobackward.10"){}
                        Spacer()
                        PlaybackControlButton(systemName:"play.circle.fill",fontSize:44){}
                        Spacer()
                        PlaybackControlButton(systemName:"goforward.10"){}
                        Spacer()
                        
                    }
                }
                .padding(.horizontal,40)
                
               // .padding()
                //.frame(maxWidth:.infinity,maxHeight:100,alignment: .topLeading)
            }.padding(20)
            
        }
    }
}

struct PlaybackControlButton: View{
    var systemName: String = "play"
    var fontSize:CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View{
        Button{
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size:fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
