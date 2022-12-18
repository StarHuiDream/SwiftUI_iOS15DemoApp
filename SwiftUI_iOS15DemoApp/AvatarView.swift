//
//  AvatarView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/18.
//

import SwiftUI

struct AvatarView: View {
    
    @AppStorage("isLogged") var isLogged = false
    
    var body: some View {
        Group {
            if isLogged {
                avatar
            } else {
               defaultAvatar
            }
        }
        .frame(width: 28, height: 28)
        .cornerRadius(14)
        .padding(8)
        .foregroundColor(.secondary)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .strokeStyle(cornerRadius: 14)
    }
    
    var avatar: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
            case .empty:
                ProgressView()
            case .failure(_):
                Color.secondary
            default:
                EmptyView()
            }
        }
    }
    
    var defaultAvatar: some View {
        Image("Avatar Default")
            .resizable()
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(isLogged: false)
    }
}
