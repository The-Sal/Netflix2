//
//  Netflix2App.swift
//  Netflix2
//
//  Created by Sal Faris on 29/01/2022.
//

import SwiftUI

@main
struct Netflix2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 850, minHeight: 400)
        }.windowToolbarStyle(.unified(showsTitle: false))
            .windowStyle(.hiddenTitleBar)
            .commands {
                SidebarCommands() // 1
            }

        
    }
}
