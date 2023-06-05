//
//  ContentView.swift
//  AuthApp
//
//  Created by Haneen on 16/11/1444 AH.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
        if userID == "" {
            AuthView()}
        else{
            Text("Logged In! Your user id is \(userID)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
