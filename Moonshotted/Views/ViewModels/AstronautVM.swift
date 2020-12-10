//
//  AstronautVM.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/08.
//

import SwiftUI

class AstronautVM: ObservableObject {
   @Published var astronaut: Astronaut
   let missions: [Mission] = Bundle.main.decode("missions.json")
   
   init(astronaut: Astronaut) {
      self.astronaut = astronaut
   }
}
