//
//  SignUpView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/17.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var model: Model
    
    enum Field: Hashable {
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @State var circleY: CGFloat = 185
    @FocusState var focusedField: Field?
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var circleColor: Color = .blue

    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Sing Up")
                .font(.largeTitle)
                .bold()
            Text("Access 120+ hours of courses, tutorials and livestreams")
                .font(.headline)
                .foregroundColor(.secondary)
            
            TextField("Email", text: $email)
                .inputStyle(icon: "mail")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focusedField, equals: .email)
                .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self) { value in
                    withAnimation {
                        emailY = value
                        circleY = value
                    }
                }
        
            SecureField("Password", text: $password)
                .inputStyle(icon: "lock")
                .textContentType(.password)
                .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self) { value in
                    withAnimation {
                        passwordY = value
                        circleY = value
                    }
                }
            Button {
               
            } label: {
                Text("Create an Account")
                    .bold()
                    .padding(8)
                    .frame(maxWidth:.infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            Group {
                Text("By clicking on ")
                + Text("_Create an account_")
                    .foregroundColor(.primary)
                + Text(", you agree to our **Terms of Service** and **[Privacy Policy](www.starhui.cn)**")
                Divider()
                HStack {
                    Text("Already have an account?")
                    Button {
                        model.selectedModal = .signIn
                    } label: {
                        Text("**Sign in**")
                    }
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(circleColor)
                .frame(width: 64, height: 64)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y:circleY)
        )
//        .padding(20)
//        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
//        .padding(20)
//        .background(
//            Image("Blob 1").offset(x: 200, y: -100)
//        )
        .coordinateSpace(name: "coordinate")
        .onChange(of: focusedField) { value in
            if value == .email {
                circleY = emailY
                circleColor = .blue
            } else {
                circleY = passwordY
                circleColor = .red
            }
        }
        .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
    }
    
    var geometry : some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("coordinate")).minY)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
            SignUpView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(Model())
    }
}
