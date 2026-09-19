import SwiftUI

struct MainWindowView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Section("Исследование") {
                    Label("Обзор", systemImage: "rectangle.grid.2x2")
                    Label("Люди", systemImage: "person.3")
                    Label("Наборы данных", systemImage: "externaldrive")
                    Label("Исследования", systemImage: "flask")
                }
                Section("Аналитика") {
                    Label("Анализ", systemImage: "chart.xyaxis.line")
                    Label("Траектории", systemImage: "point.3.connected.trianglepath.dotted")
                    Label("Сценарии", systemImage: "arrow.triangle.branch")
                    Label("Отчёты", systemImage: "doc.text")
                }
            }
            .navigationTitle("MIR Success Lab")
        } detail: {
            ContentUnavailableView(
                "Рабочее пространство готово",
                systemImage: "chart.bar.xaxis",
                description: Text("Выберите исследование или набор данных слева.")
            )
        }
        .frame(minWidth: 1100, minHeight: 700)
    }
}
