//
//  SignUpView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/17.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Sing Up")
                .font(.largeTitle)
                .bold()
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
                .foregroundColor(.secondary)
            Button {
                
            } label: {
                Text("Create an Account")
                    .bold()
                    .padding(8)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(20)
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        .padding(20)
        .background(
            Image("Blob 1").offset(x: 200, y: -100)
        )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
