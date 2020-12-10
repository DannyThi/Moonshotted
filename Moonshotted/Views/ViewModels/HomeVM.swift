//
//  HomeVM.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/07.
//

import SwiftUI

class HomeVM: ObservableObject {
   @Published var missions: [Mission] = Bundle.main.decode("missions.json")
   @Published var astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

   
}
