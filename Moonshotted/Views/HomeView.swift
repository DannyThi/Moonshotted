//
//  HomeView.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/07.
//

import SwiftUI

struct HomeView: View {
   @ObservedObject var home = HomeVM()
   
   var body: some View {
      NavigationView {
         List(home.missions) { mission in
            NavigationLink(destination: MissionView(mission: mission, astronauts: home.astronauts)) {
               HStack {
                  Image(mission.image)
                     .resizable()
                     .scaledToFit()
                     .frame(width: 44)
                  VStack(alignment: .leading) {
                     Text(mission.displayName)
                        .font(.headline)
                     Text(mission.formattedLaunchDate)
                  }
               }
            }
         }
         .navigationBarTitle("MoonShotted")
      }
   }
}

struct HomeView_Previews: PreviewProvider {
   static var previews: some View {
      HomeView()
   }
}
