//
//  ContentView.swift
//  Cool-SwiftUI
//
//  Created by Andrea Miotto on 26/4/20.
//  Copyright © 2020 Andrea Miotto. All rights reserved.
//

import SwiftUI

struct Index: View {
    var body: some View {
        NavigationView {
            List {
                
                Section(header: HeaderView(title: "Basic Animations")) {
                    NavigationLink(
                        destination: AddProfileView(),
                        label: {
                            Text("Add Profile")
                    })
                }

                Section(header: HeaderView(title: "Advanced Animations")) {
                    NavigationLink(
                        destination: PolygonSidesAnimationView(),
                        label: {
                            Text("Polygon Sides")
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Cool SwiftUI"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Index()
    }
}
