//
//  TappingViewModel.swift
//  Tapping
//
//  Created by Sola Dugbo on 7/11/22.
//

import SwiftUI

class TappingViewModel: ObservableObject{
    @Published var showDetailView: Bool = false
    @Published var currentActiveItem: TapModel?
}
