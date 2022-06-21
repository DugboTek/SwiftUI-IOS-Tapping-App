
import Foundation
import SwiftUI

struct TopicModel: Identifiable, Codable{
    var name: String
    var id = UUID()
}

var topicsList = [
    TopicModel(name:"Anxiety"),
    TopicModel(name:"Stress"),
    TopicModel(name:"Depression"),
    TopicModel(name:"Healing"),
    TopicModel(name:"Example"),
    
 ]
