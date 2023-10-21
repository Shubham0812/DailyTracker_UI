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
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    
    @State var viewAppeared = false
    
    
    // MARK: - Views
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Spacer()

                    Text("Tracker")
                        .font(TypefaceOne.regular.font(size: 22))
                        .offset(x: 28)
                    Spacer()
                    TodayView()
                }
                
                VStack(alignment: .leading) {
                    Text("Hey \(mainViewModel.userName),")
                        .font(TypefaceTwo.semibold.font(size: 30))
                        .tracking(-0.2)
                        .offset(y: viewAppeared ? 0 : 12)
                        .opacity(viewAppeared ? 1 : 0.3)
                        .animation(.easeInOut(duration: 0.2).delay(0.05), value: viewAppeared)
                    
                    HStack {
                        Text("How are you")
                            .font(TypefaceTwo.semibold.font(size: 32))
                            .tracking(-0.2)
                            .opacity(0.6)
                        
                        Text("feeling?")
                            .font(TypefaceTwo.bold.font(size: 32))
                            .tracking(-0.2)
                    }
                    .offset(y: viewAppeared ? 0 : 12)
                    .opacity(viewAppeared ? 1 : 0.3)
                    .animation(.easeInOut(duration: 0.2).delay(0.05), value: viewAppeared)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
        }
        .onAppear() {
            viewAppeared = true
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
