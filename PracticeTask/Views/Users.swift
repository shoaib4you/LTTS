//
//  ContentView.swift
//  PracticeTask
//
//  Created by Shoaib Khan on 18/04/22.
//

import SwiftUI

struct Users: View {
    
    // Variables
    @State var arrUser = [ResUser]()
    @State var arrUserOrg = [ResUser]()
    @State var selectedUser : ResUser?
    var viewModel = UserVM()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Text(selectedUser?.username ?? "")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                    Spacer()
                }
                HStack {
                    Text(selectedUser?.name ?? "")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text(selectedUser?.email ?? "")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .alignmentGuide(.trailing) { d in d[.trailing] }
                        .padding(.bottom, 10)
                    Spacer()
                }
            }
            .padding(.leading, 35)
            .padding(.top, 20)
            List(arrUser) { itemRes in
                VStack(alignment: .leading, spacing: 4.0) {
                    HStack {
                        Text(itemRes.username ?? "")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    HStack {
                        Text(itemRes.name ?? "")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack {
                        Text(itemRes.email ?? "")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .alignmentGuide(.trailing) { d in d[.trailing] }
                            .padding(.bottom, 10)
                        Spacer()
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectedUser = itemRes
                    self.arrUser = self.arrUserOrg
                    self.arrUser.removeAll {
                        $0.id == itemRes.id
                    }
                }
            }
            .padding(.vertical, 10.0)
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .onAppear() {
                viewModel.getUsers(type: [ResUser].self) { responseData in
                    self.arrUser = responseData.reversed()
                    self.arrUserOrg = responseData.reversed()
                } failureBlock: { error in
                    print(error.localizedDescription)
                }
            }
        }
        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        Users(arrUser: [], selectedUser: nil)
    }
}
