//
//  ShowPage.swift
//  LiquidSwipe
//
//  Created by armdnks on 12/5/21.
//

import SwiftUI

struct ShowPage: View {
    var body: some View {

        VStack {
            Image("earth")
                .resizable()
                .frame(width: 256, height: 256)
        }
    }
}

struct ShowPage_Previews: PreviewProvider {
    static var previews: some View {
        ShowPage()
    }
}
