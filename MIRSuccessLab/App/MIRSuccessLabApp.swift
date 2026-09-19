import SwiftUI

@main
struct MIRSuccessLabApp: App {
    var body: some Scene {
        WindowGroup("MIR Success Lab") {
            MainWindowView()
        }
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("Новый проект") {}
                    .keyboardShortcut("n", modifiers: [.command])
            }
        }
    }
}
