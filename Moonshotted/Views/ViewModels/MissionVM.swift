//
//  MissionVM.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/07.
//

import SwiftUI

class MissionVM: ObservableObject {
   @Published var mission: Mission
   @Published var crewMembers: [CrewMember]
   
   init(mission: Mission, astronauts: [Astronaut]) {
      self.mission = mission
      
      var members = [CrewMember]()
      for crew in mission.crew {
         if let astronaut = astronauts.first(where: { $0.id == crew.name }) {
            members.append(CrewMember(astronaut: astronaut, role: crew.role))
         }
      }
      
      self.crewMembers = members
   }
}
