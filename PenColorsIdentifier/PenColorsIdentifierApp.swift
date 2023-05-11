//
//  PenColorsIdentifierApp.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 04/05/23.
//

import SwiftUI

@main
struct PenColorsIdentifierApp: App {
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(ViewRouter())
        }
    }
}
