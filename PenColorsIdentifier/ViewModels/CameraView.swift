//
//  ContentView.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 10/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = CameraFrameHandler()

    var body: some View {
        CameraFrameView(image: model.frame)
            .ignoresSafeArea()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
