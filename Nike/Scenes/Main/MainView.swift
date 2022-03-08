//
//  MainView.swift
//  Nike
//
//  Created by Leandro Hernandez on 28/2/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel

    //
    init(viewModel: MainViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.setup()
    }
    
    //
    private func setup() {
        Appearance.setup.uiPageControl()
    }
    
    //
    var body: some View {
        
        ZStack {
            
            Color.ui.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Spacer().frame(height: 104)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        NewCollectionView(items: self.viewModel.newCollection)
                        
                        HStack(alignment: .center, spacing: 24) {
                            Button {
                                print("Action")
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Lifestyle")
                                        .font(.system(size: 24))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.ui.black)
                                    Text("35 items")
                                        .font(.system(size: 17))
                                        .foregroundColor(Color.ui.fireOpal)
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Button {
                                print("Action")
                            } label: {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Running")
                                        .font(.system(size: 24))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.ui.gainsboro)
                                    Text("41 items")
                                        .font(.system(size: 17))
                                        .foregroundColor(Color.ui.gainsboro)
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Button {
                                print("Action")
                            } label: {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Tennis")
                                        .font(.system(size: 24))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.ui.gainsboro)
                                    Text("18 items")
                                        .font(.system(size: 17))
                                        .foregroundColor(Color.ui.gainsboro)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        
                        GridView(items: self.viewModel.lifestyles)
                            .padding(.horizontal, 16)
                        
                        Spacer(minLength: 80)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .overlay(content: {
            NavigationBar()
        })
        .onAppear {
            self.viewModel.fetchSneakers()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
