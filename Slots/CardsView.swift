//
//  CardsView.swift
//  Slots
//
//  Created by Ameer Alkhazraji on 3/30/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    
    var body: some View {
       Image(symbol).resizable().aspectRatio(1, contentMode: .fit).background(background).opacity(0.5).cornerRadius(20)
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(symbol: Binding.constant("apple"), background: Binding.constant(Color.white))
    }
}
