//
//  AstronautView.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/08.
//

import SwiftUI

struct AstronautView: View {
   @ObservedObject var astronautVM: AstronautVM
   
   var body: some View {
      GeometryReader { geoProxy in
         ScrollView(.vertical) {
            VStack {
               Image(astronautVM.astronaut.id)
                  .resizable()
                  .scaledToFit()
                  .frame(width: geoProxy.size.width)

               Text(astronautVM.astronaut.description)
                  .padding()
               
               ForEach(astronautVM.missions, id: \.id) { mission in
                  if let _ = mission.crew.first(where: { $0.name == astronautVM.astronaut.id } ) {
                     HStack {
                        Image(mission.image)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 60)
                        VStack(alignment: .leading) {
                           Text(mission.displayName)
                              .font(.headline)
                           Text(mission.formattedLaunchDate)
                              .foregroundColor(Color.secondary)
                        }
                        Spacer()
                     }
                     .padding(.horizontal)
                  }
               }
            }
         }
         .navigationBarTitle(Text(astronautVM.astronaut.name), displayMode: .inline)
      }
   }
   
   init(astronaut: Astronaut) {
      self.astronautVM = AstronautVM(astronaut: astronaut)
   }
}

struct AstronautView_Previews: PreviewProvider {
   static var home = HomeVM()
   static var previews: some View {
      AstronautView(astronaut: home.astronauts[0])
   }
}
