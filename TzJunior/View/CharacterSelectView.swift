//
//  CharacterSelectView.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import SwiftUI

struct CharacterSelectView: View {
    let character: Character
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            Text(character.name.uppercased())
                .foregroundColor(.black)
                .font(.title2)
                .bold()
                .padding(.top, 60)

            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 350)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 350)
                        .clipped()
                case .failure(_):
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 350)
                        .overlay(
                            Text("Failed to load image")
                                .foregroundColor(.white)
                        )
                @unknown default:
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 350)
                }
            }
            .frame(height: 350)
            
            HStack(spacing: 10) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
                    .padding(.leading, 30)

                Text(character.status)
                    .foregroundColor(.black)
            
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
                
                Text(character.gender)
                    .foregroundColor(.black)
                    .padding(.trailing, 50)
            }
            .padding()

            HStack(spacing: 10) {
                Rectangle()
                    .foregroundColor(Color("CharSelectColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        Text("STATUS")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .bold()
                    )
                    .padding(10)
                
                Rectangle()
                    .foregroundColor(Color("CharSelectColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        Text("GENDER")
                            .foregroundColor(.red)
                            .font(.headline)
                            .bold()
                    )
                    .padding(10)
            }
            .frame(height: 75)
            
            HStack(spacing: 10) {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.purple)
                    .padding(.leading, 30)

                Text(character.type.isEmpty ? "None" : character.type)
                    .foregroundColor(.black)
            
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.green)
                
                Text(character.species)
                    .foregroundColor(.black)
                    .padding(.trailing, 50)
            }
            .padding()

            HStack(spacing: 10) {
                Rectangle()
                    .foregroundColor(Color("CharSelectColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        Text("TYPE")
                            .foregroundColor(.purple)
                            .font(.headline)
                            .bold()
                    )
                    .padding(10)
                
                Rectangle()
                    .foregroundColor(Color("CharSelectColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        Text("SPECIES")
                            .foregroundColor(.green)
                            .font(.headline)
                            .bold()
                    )
                    .padding(10)
            }
            .frame(height: 75)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.fetchUserData()
        }
    }
}
