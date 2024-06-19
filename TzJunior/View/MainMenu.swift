//
//  MainMenu.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import SwiftUI

struct MainMenu: View {
    @State private var selectedView = 1

    var body: some View {
        VStack{
            TabView(selection: $selectedView) {
                CharactersView()
                    .tabItem {
                        Image(systemName:"person")
                        Text("Characters")
                            .foregroundColor(.black)

                    }
                    .tag(1)
                LocationView()
                    .tabItem {
                        Image(systemName:"globe")
                        Text("Locations")
                            .foregroundColor(.black)

                    }
                    .tag(2)
                EpisodesView()
                    .tabItem {
                        Image(systemName:"tv")
                        Text("Episodes")
                            .foregroundColor(.black)

                    }
                    .tag(3)
                SettingsView()
                    .tabItem {
                        Image(systemName:"gear")
                        Text("Settings")
                            .foregroundColor(.black)

                    }
                    .tag(4)
            }.tabViewStyle(DefaultTabViewStyle())
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("TabBarColor"))
    }
}

#Preview {
    MainMenu()
}
