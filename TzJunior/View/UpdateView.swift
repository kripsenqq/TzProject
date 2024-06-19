//
//  UpdateView.swift
//  TzJunior
//
//  Created by kripsenqq on 19.06.2024.
//

import SwiftUI

struct UpdateView: View {
    var body: some View {
        VStack{
            Spacer()
            
            Button{
                print("lol")
            }label: {
                Text("UPDATE NOW")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("UpdateColor"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                    .foregroundColor(Color.white)
                    .shadow(radius: 6)
                    .padding(.bottom, 20)
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    UpdateView()
}
