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
    var id = UUID()
    
   
    
}

 var tapList = [
    TapModel(name: "Stress", duration: 10,description: "Tapping for stress can be extremely beneficitial, take time to tap on each point to relieve your stress"),
    
    TapModel(name: "Anxieity", duration: 2,description: "Tapping for stress can be extremely beneficitial, take time to tap on each point to relieve your stress"),
    
    TapModel(name: "Healing", duration: 5,description: "Tapping for stress can be extremely beneficitial, take time to tap on each point to relieve your stress"),
    TapModel(name: "Depression", duration: 5,description: "Tapping for stress can be extremely beneficitial, take time to tap on each point to relieve your stress"),
    
 ]
