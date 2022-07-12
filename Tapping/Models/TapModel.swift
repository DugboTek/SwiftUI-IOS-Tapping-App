//
//  TopicModel.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/13/22.
//

import Foundation
import SwiftUI

struct TapModel: Identifiable, Codable{
    var name: String
    var duration: Int
    var description: String
    var image: String
    var id = UUID().uuidString
    var show = false
    
   
    
}

 var tapList = [
    TapModel(name: "Fear of Failure", duration: 10,description: "Finding acceptance in failure",image:"forest2"),
    
    TapModel(name: "I’ve Got To Be Perfect", duration: 2,description: "Getting release from perfectionism",image:"forest3"),
    
    TapModel(name: "I Am All Alone", duration: 5,description: "Finding out that I am never alone",image:"ocean5"),
    
    TapModel(name: "I’m So Overwhelmed", duration: 6,description: "Relief from overwhelming feelings",image:"ocean4"),
    
    TapModel(name: "What If…?", duration: 5,description: "Feeling safe with the “what if’s”",image:"ocean4"),
    
    TapModel(name: "I Am Bad", duration: 5,description: "Rethinking my negative beliefs",image:"ocean4"),
    
    TapModel(name: "I’m Not Good Enough", duration: 5,description: "I am acceptable as I am",image:"ocean4"),
    
    TapModel(name: "Fear of Emotions", duration: 5,description: "Keeping the “fire” in the fireplace",image:"ocean4"),
    
    TapModel(name: "It’s Not Safe to feel Safe", duration: 5,description: "Being open to positive, unfamiliar feelings",image:"ocean4"),
    
    TapModel(name: "Trust is Too Dangerous", duration: 5,description: "Figuring out when it is safe to start trusting (again)",image:"ocean4"),


    
 ]
