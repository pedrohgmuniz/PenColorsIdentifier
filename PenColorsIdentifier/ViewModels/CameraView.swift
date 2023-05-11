//
//  ContentView.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 10/05/23.
//

import SwiftUI

struct CameraView: View {
    @StateObject private var model = CameraFrameHandler()

    var body: some View {
        CameraFrameView(image: model.frame)
            .ignoresSafeArea()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
