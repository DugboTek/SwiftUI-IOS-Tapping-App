//
//  IntroView.swift
//  Tapping
//
//  Created by Sola Dugbo on 7/26/22.
//

import SwiftUI

struct IntroStep{
    let image: String
    let title: String
    let description: String
}

private let introSteps = [
    IntroStep(image:"meditate",title:"Here we can begin an intro to tapping.",description:"tap next to continue"),
    IntroStep(image:"stress",title:"Tapping is a Science.",description:"tap next to continue"),
    IntroStep(image:"dance",title:"here we can begin an intro to tapping",description:"tap next to continue"),
    IntroStep(image:"stress",title:"here we can begin an intro to tapping",description:"tap next to continue"),
    IntroStep(image:"stress",title:"here we can begin an intro to tapping",description:"tap next to continue"),

]

struct IntroView: View {
    @State private var currentStep = 0
    init(){
        UIScrollView.appearance().bounces=false
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action:{
                        self.currentStep = introSteps.count - 1
                }){
                    Text("skip")
                        .padding(16)
                        .foregroundColor(.gray)
                }
                
            }
            
            TabView(selection: $currentStep){
                ForEach(0..<introSteps.count){it in
                    VStack{
                        Image(introSteps[it].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:250,height:250)

                        Text(introSteps[it].title)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("black"))
                            .padding(.horizontal,32)
                            .padding(.top,16)
                        Text(introSteps[it].description)
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .foregroundColor(Color("black"))
                            .padding(.horizontal,32)
                            .padding(.top,2)
                    }
                    .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack{
                ForEach(0..<introSteps.count){ it in
                    if it == currentStep{
                        Rectangle()
                            .frame(width:20,height: 10)
                            .cornerRadius(10)
                            .foregroundColor(.purple)
                    }
                    else{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            Button(action: {
                if self.currentStep < introSteps.count - 1 {
                    self.currentStep += 1
                    
                }
                else{
                    
                }
            }){
                Text(currentStep<introSteps.count - 1 ? "Next" : "Get Started")
                    .padding(16)
                    .frame(maxWidth:.infinity)
                    .background(Color.purple)
                    .cornerRadius(16)
                    .padding(.horizontal,16)
                    .foregroundColor(.white)
            }
        
        
           // .background{
               // LinearGradient(gradient: Gradient(colors: [Color("orange2"),Color("orange1")]), startPoint: .top, endPoint: .bottom)
            //}*--
            //.ignoresSafeArea()
        //.frame(width:.infinity,height: .infinity)
    }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
