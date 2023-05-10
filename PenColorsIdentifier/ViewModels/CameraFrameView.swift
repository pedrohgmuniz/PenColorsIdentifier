//
//  CameraFrameView.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 10/05/23.
//

import SwiftUI

struct CameraFrameView: View {

    var image: CGImage?
    private let label = Text("frame")

    var body: some View {
        if let image = image {
            Image(image, scale: 1.0, label: label)
        } else {
            Color.black
        }
    }
}

struct CameraFrameView_Previews: PreviewProvider {
    static var previews: some View {
        CameraFrameView()
    }
}
