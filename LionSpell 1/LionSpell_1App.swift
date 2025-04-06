//
//  LionSpell_1App.swift
//  LionSpell 1
//
//  Created by Tej Patel on 02/09/24.
//

import SwiftUI

@main
struct LionSpell_1App: App {
    @State var manager = GameManager()
    
    init(){
        manager.setSummary()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environment(manager)
        }
    }
}
