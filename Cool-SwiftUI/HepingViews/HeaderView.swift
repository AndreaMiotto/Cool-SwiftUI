//
//  HeaderView.swift
//  Cool-SwiftUI
//
//  Created by Andrea Miotto on 26/4/20.
//  Copyright © 2020 Andrea Miotto. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Header")
    }
}
