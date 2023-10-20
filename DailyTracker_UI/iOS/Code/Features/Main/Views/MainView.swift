//
//  ContentView.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 07/10/23.
//

import SwiftUI
import CoreData

struct MainView: View {

    // MARK: - Variables

    
    
    // MARK: - Views
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
