//
//  EnterMoodList.swift
//  MoodTracker
//
//  Created by Kevin Blom on 19/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI
import UIKit

struct EnterMoodList : View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Binding var isModal: Bool
    
    var enterableMoods = EnterableMoods()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(self.enterableMoods.list) {
                    enterableMoodItem in
                    Button(action: {
                        let mood = MoodEntity(context: self.managedObjectContext)
                        
                        mood.id = UUID()
                        mood.date = Date()
                        mood.moodID = Int32(enterableMoodItem.id)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch let error {
                            print(error)
                            // handle the Core Data error
                        }
                        self.isModal.toggle()
                    }) {
                        EnterableMoodRow(moodName: enterableMoodItem.moodName, backgroundColor: Color.forId(id: enterableMoodItem.id)).padding(.vertical, 7)
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height)
            } .background(Color.backgroundWhite)
        }
    }
}

#if DEBUG
struct EnterMoodList_Previews : PreviewProvider {
    
    static var previews: some View {
        EnterMoodList(isModal: .constant(true))
            .previewDevice("iPhone 8")
    }
}
#endif
