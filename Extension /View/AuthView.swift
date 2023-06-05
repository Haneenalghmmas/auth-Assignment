//
//  AuthView.swift
//  AuthApp
//
//  Created by Haneen on 16/11/1444 AH.
//

import SwiftUI

struct AuthView: View {
    @State private var  currentViewShowing: String = "Login"
    var body: some View {
        if(currentViewShowing == "Login") {
            Login(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        }  else{ SignIn(currentShowingView: $currentViewShowing) .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }}
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
