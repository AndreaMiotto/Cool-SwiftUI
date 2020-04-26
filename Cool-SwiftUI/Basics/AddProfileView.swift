//
//  AddProfileView.swift
//  Cool-SwiftUI
//
//  Created by Andrea Miotto on 26/4/20.
//  Copyright © 2020 Andrea Miotto. All rights reserved.
//

import SwiftUI

struct AddProfileView: View {

    // Private states
    @State private var addProfile: Bool = false
    @State private var profileCompleted: Bool = false
    @State private var name: String = ""
    @State private var lastName: String = ""


    var body: some View {
        VStack {
            // max width vstack
            HStack { Spacer() }

            // Add profile button
            Button(action: {
                self.addProfile = true
            }, label: {
                Image( systemName: addProfile ?
                    "person.circle.fill" :
                    "person.crop.circle.badge.plus"
                )
                    .font(.system(size: 60))
                    .foregroundColor(Color(UIColor.label))

            })
                // 3d rotation effect
                .rotation3DEffect(
                    addProfile ? .degrees(360) : .degrees(0),
                    axis: (x: 0, y: 1, z: 0)
            )
                // spring effect
                .animation(
                    .interpolatingSpring(
                        mass: 0.5,
                        stiffness: 100,
                        damping: 9,
                        initialVelocity: 4
                    )
            )

            // Textfields and buttons
            if addProfile {

                Group {
                    Spacer().frame(height: 40)

                    // name textfield

                    TextField("Name", text: $name, onEditingChanged: { (editing) in
                        self.isCompleted()
                    }) {
                        self.isCompleted()
                    }
                    Divider()
                    Spacer().frame(height: 20)

                    // last name textfield

                    TextField("Last Name", text: $lastName, onEditingChanged: { (editing) in
                        self.isCompleted()
                    }) {
                        self.isCompleted()
                    }
                    Divider()
                    Spacer().frame(height: 40)

                    // cancel button

                    Button(action: {
                        self.reset()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                    })
                }
                    // transition effect
                    .transition(
                        AnyTransition
                            .move(edge: .bottom)
                            .combined(with: .opacity)
                )

                if profileCompleted {
                    Spacer().frame(height: 40)

                    // save button
                    Button(action: {
                        self.reset()
                    }, label: {
                        Text("Save Profile")
                            .foregroundColor(Color(UIColor.label))
                    })
                        // transition effect
                        .transition(
                            .asymmetric(
                                insertion: AnyTransition
                                    .move(edge: .trailing)
                                    .combined(with: .opacity),
                                removal: AnyTransition
                                    .move(edge: .bottom)
                                    .combined(with: .opacity)
                            )
                    )
                }
                Spacer()
            }
        }
        .padding(40)
        .padding(.top, 20)
            // enable animations on whole vstack
        .animation(.easeOut)
        .navigationBarTitle(Text("Add Profile"))
    }

    private func isCompleted() {
        if self.name.count > 0 && self.lastName.count > 0 {
            self.profileCompleted = true
        }
    }

    private func reset() {
        self.addProfile = false
        self.profileCompleted = false
        self.name = ""
        self.lastName = ""
    }
}

struct BasicScaleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProfileView()
        }
    }
}
