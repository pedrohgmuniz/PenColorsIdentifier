//
//  OnboardingView.swift
//  PenColorsIdentifier
//
//  Created by Pedro Muniz on 04/05/23.
//

import SwiftUI

let onBoardingText = """
Este app identifica as cores de canetas. Ao clicar no botão de 'começar' abaixo, sempre que você entrar no app, a câmera do seu aparelho será ativada. Então basta apontá-la para a caneta cuja cor você quer identificar.

Você pode acessar este tutorial novamente clicando no botão de ajuda.
"""

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(onBoardingText)
                    .font(.system(size: 20, weight: .regular))

                Spacer()

                Button {
                    // action
                } label: {
                    Text("Identificar cor da caneta")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 280, height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding(.trailing, 20)
            .padding(.leading, 20)
            .navigationTitle("Tutorial rápido")
//            .border(.red)
        }
//        .border(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
