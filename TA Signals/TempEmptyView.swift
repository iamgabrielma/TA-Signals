//
//  TempEmptyView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 27/7/21.
//

import SwiftUI

struct TempEmptyView: View {
    var body: some View {
        TabView{
            NavigationView{
                VStack{
                    Text("Hello")
                }
                .navigationTitle("TA Signals - Empty View")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct TempEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        TempEmptyView()
    }
}
