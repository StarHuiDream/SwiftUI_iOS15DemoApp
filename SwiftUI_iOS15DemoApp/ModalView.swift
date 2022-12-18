//
//  ModalView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/18.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @AppStorage("showModal") var showModal = true
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial).ignoresSafeArea()
            switch model.selectedModal {
            case .signIn: SignInView()
            case .signUp: SignUpView()
            }
            
            Button {
                withAnimation {
                    showModal = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}
