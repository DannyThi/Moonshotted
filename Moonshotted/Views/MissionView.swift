//
//  MissionView.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/07.
//

import SwiftUI

struct CrewMember: Codable {
   let astronaut: Astronaut
   let role: String
}

struct MissionView: View {
   @ObservedObject var missionVM: MissionVM
   
   var body: some View {
      GeometryReader { geoProxy in
         ScrollView(.vertical) {
            VStack {
               Image(missionVM.mission.image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: geoProxy.size.width * 0.8)
                  .padding(.top)
               
               Text("Launch Date: \(missionVM.mission.formattedLaunchDate)")
                  .font(.headline)
                  .padding(.vertical)
               
               Text(missionVM.mission.description)
                  .padding(.horizontal)
               
               ForEach(missionVM.crewMembers, id: \.role) { member in
                  NavigationLink(destination: AstronautView(astronaut: member.astronaut)) {
                     HStack {
                        Image(member.astronaut.id)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 83)
                           .clipShape(Capsule())
                           .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                        VStack(alignment: .leading) {
                           Text(member.astronaut.name)
                              .font(.headline)
                           Text(member.role)
                        }
                        Spacer()
                     }
                  }
                  .padding(.horizontal)
                  .buttonStyle(PlainButtonStyle())
               }
            }
            Spacer(minLength: 25)
         }
         .navigationBarTitle(Text(missionVM.mission.displayName), displayMode: .inline)
      }
   }
   
   init(mission: Mission, astronauts: [Astronaut]) {
      self.missionVM = MissionVM(mission: mission, astronauts: astronauts)
   }
}


struct MissionView_Previews: PreviewProvider {
   static var home = HomeVM()
   static var previews: some View {
      MissionView(mission: home.missions[0], astronauts: home.astronauts)
   }
}
