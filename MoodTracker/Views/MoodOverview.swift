//
//  ContentView.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//
import SwiftUI
import CoreData

struct MoodOverview : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isModal: Bool = false

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack() {
                    Button(action: {
                        self.isModal.toggle()
                    }) {
                        NewMoodButton()
                    }.sheet(isPresented: self.$isModal, content: {
                        VStack{
                            DragIndicator()
                            EnterMoodList(isModal: self.$isModal)
                        }
                        .background(Color.backgroundWhite)
                        .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
                    })
                    
                    MoodList()
                    
                }
                .navigationBarTitle("Moods")
                .navigationBarItems(trailing:
                    NavigationLink(destination: Settings()) {
                    Text("Settings").padding()
                })
            }
        }
    }
}


