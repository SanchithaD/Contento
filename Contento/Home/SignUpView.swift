//
//  SignUpView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 3/15/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI
import Firebase


struct actIndSignup: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var agreeCheck: Bool = false
    @State var errorText: String = ""
    @State private var showAlert = false
    @State private var shouldAnimate = false
    
    var alert: Alert {
        
        Alert(title: Text("Verify your Email ID"), message: Text("Please click the link in the verification email sent to you"), dismissButton: .default(Text("Dismiss")){
            
            self.presentationMode.wrappedValue.dismiss()
            self.emailAddress = ""
            self.password = ""
            self.agreeCheck = false
            self.errorText = ""
        
            })
       }
    
    var body: some View {
        
        VStack {
             
            AppTitleView(Title: "Sign Up")
        
            VStack() {
                          
                           
                    Text("Email").font(.title).fontWeight(.thin).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                    
                
                    TextField("user@domain.com", text: $emailAddress).textContentType(.emailAddress)
                        .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                        Text("Password").font(.title).fontWeight(.thin)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                            .padding()
                
                    SecureField("Enter a password", text: $password)
                        .padding()
                    
                    Toggle(isOn: $agreeCheck)
                    {
                        Text("Agree to the Terms and Condition").fontWeight(.thin)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                
                
                    Button(action: {
                        
                        if(self.agreeCheck){
                            print("Printing outputs" + self.emailAddress, self.password  )
                            self.shouldAnimate = true
                            self.sayHelloWorld(email:self.emailAddress, password:self.password)
                        }
                        else{
                             self.errorText = "Please Agree to the Terms and Condition"
                        }
                    }) {
                        
                    Text("Sign Up")
                        .padding()
                        .foregroundColor(Color.red)
                        
                    }
                
                    Text(errorText).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                    actIndSignup(shouldAnimate: self.$shouldAnimate)
                
                     Spacer()

                    }.padding(10)
            .background(Color.white)

        }
        
        
        .alert(isPresented: $showAlert, content: { self.alert })

    }
    
    
    func sayHelloWorld(email: String, password: String) {
       
        
           Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
             
                let errorText: String  = error?.localizedDescription ?? "unknown error"
                self.errorText = errorText
                
              return
            }
            
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                if let error = error {
                    self.errorText = error.localizedDescription
                  return
                }
                self.showAlert.toggle()
                
                self.shouldAnimate = false
                
            }
            
            print("\(user.email!) created")
            
        }
        
        
    }
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
