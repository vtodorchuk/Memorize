//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 23.12.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = MemorizeViewModal()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
