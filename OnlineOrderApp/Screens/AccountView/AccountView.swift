//
//  AccountView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-04.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusTextField: FormTextField?
    
    enum FormTextField{
         case firstName, lastName, email
    }

    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit {
                            focusTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit {
                            focusTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField, equals: .email)
                        .onSubmit {
                            focusTextField = nil
                        }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: [.date])
                    
                    Button {
                        viewModel.saveChanged()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("REQUESTS")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.napkin)
                    Toggle("Frequent Refills", isOn: $viewModel.user.refills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🧾 Account")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss"){
                        focusTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
