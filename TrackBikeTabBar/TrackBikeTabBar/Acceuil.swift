//
//  Acceuil.swift
//  TrackBikeTabBar
//
//  Created by Thierry Lebeau on 29/11/2022.
//

import SwiftUI

struct Acceuil: View {
    var body: some View {
        Image("piste")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.top)
    }
}

struct Acceuil_Previews: PreviewProvider {
    static var previews: some View {
        Acceuil()
    }
}
