//
//  RoundedShape.swift
//  Tapping
//
//  Created by Sola Dugbo on 6/28/22.
//

import Foundation
import SwiftUI

struct RoundedShape: Shape{
    var corners: UIRectCorner
    
    func path(in rect: CGRect)-> Path{
        let path = UIBezierPath(roundedRect:rect,byRoundingCorners: corners,cornerRadii: CGSize(width:45,height:45))
        
        return Path(path.cgPath)
    }
}
