//
//  CharactersView.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 1) {
                    Text("Characters")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.leading, 30)
                        .padding(.top, 100)

                    if let characters = viewModel.char?.results {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 0) {
                            ForEach(characters.indices, id: \.self) { index in
                                NavigationLink(
                                    destination: CharacterSelectView(character: characters[index]),
                                    label: {
                                        CharacterCardView(character: characters[index])
                                            .shadow(radius: 5)
                                            .padding(5)
                                    }
                                )
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.bottom, 20)
                    } else {
                        ProgressView()
                            .padding(.top, 50)
                    }
                }
                .onAppear {
                    viewModel.fetchUserData()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CharacterCardView: View {
    let character: Character

    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 186)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 186)
                        .clipped()
                case .failure(_):
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 186)
                        .overlay(
                            Text("Failed to load image")
                                .foregroundColor(.white)
                        )
                @unknown default:
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 186)
                }
            }
            .frame(height: 186) 

            Text(character.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                .padding(.leading, 10)
                .background(Color.white)
                .foregroundColor(.black)
                .bold()
                .fixedSize(horizontal: false, vertical: true)

            Text("Status: \(character.status)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .padding(.leading, 10)
                .background(Color.white)
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(5)
        .clipped()
    }
}


#Preview {
    CharactersView()
}
