//
//  ViewRouter.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 11/05/23.
//

import SwiftUI

// This file controls which View is shown when the app is launched
// Then we create a MotherView, which holds the OnBoarding and the main View
// Based on our ViewRouter's current page property we decide which View is shown

class ViewRouter: ObservableObject {

    @Published var currentPage: String

    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "cameraView"
        }
    }

}
