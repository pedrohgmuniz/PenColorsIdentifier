//
//  ImagePicker.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 04/05/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    func makeCoordinator() -> ImagePicker.Coordinator {
        let button = UIButton()
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
        return picker
    }

}


