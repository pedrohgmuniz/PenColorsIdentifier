//
//  OnboardingView.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 04/05/23.
//

import SwiftUI

let onBoardingText = """
Este app identifica as cores de canetas esferográficas da Faber Castell através da câmera do seu celular. Ao clicar no botão abaixo, a câmera do seu aparelho será iniciada. Basta apontá-la para a caneta cuja cor você quer identificar.

Você pode acessar esta explicação novamente clicando no botão de ajuda.
"""

struct CameraView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Text(onBoardingText)
                    .font(.system(size: 20, weight: .regular))
                    .padding(.trailing, 20)
                    .padding(.leading, 20)

                Spacer()

                Button {
                    // action
                } label: {
                    Text("Iniciar câmera")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 280, height: 50)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .foregroundColor(Color("customLightGray"))
                        .background(Color("customOrange"))
                        .cornerRadius(15)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("customBlue"))
            .navigationTitle("Tutorial rápido")
//            .border(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
