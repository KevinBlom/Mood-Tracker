//
//  ContentView.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI
import CoreData

struct MoodList : View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: MoodEntity.getAllMoods()) var moodEntities:FetchedResults<MoodEntity>
    @State var isModal: Bool = false
    
    var body: some View {
        
        
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
                Button(action: {
                    let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MoodEntity")
                    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                    do {
                        try self.managedObjectContext.executeAndMergeChanges(using: batchDeleteRequest)
                    } catch let error {
                        print(error)
                    }
                }) {
                    Text("Delete").frame(height: 30).padding(.trailing)
                }
                ScrollView {
                    Button(action: {
                        self.isModal.toggle()
                    }) {
                        EnterMoodRow()
                    }
                    Section(header: Text("Moods").font(.headline))
                    {
                        ForEach(self.moodEntities) {
                            moodEntity in
                            MoodRow(mood: moodEntity)
                        }
                        .frame(width: geometry.size.width)
                    }
                    
                }
                .frame(width: geometry.size.width, alignment: .center)
                .background(Color.backgroundWhite)
                .sheet(isPresented: self.$isModal, content: {
                    VStack{
                        RoundedRectangle(cornerRadius: 10.0)
                            .frame(width: 20, height: 5, alignment: .center)
                            .foregroundColor(Color.gray)
                            .padding(.top, 8)
                        EnterMoodList(isModal: self.$isModal)
                            .environment(\.managedObjectContext, self.managedObjectContext)
                    }
                    .background(Color.backgroundWhite)
                })
            }
        }
    }
}

//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        MoodList()
//            .previewDevice("iPhone 8")
//    }
//}
//#endif
