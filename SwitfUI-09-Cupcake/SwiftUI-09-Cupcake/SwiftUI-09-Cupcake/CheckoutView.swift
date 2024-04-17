//
//  CheckoutView.swift
//  SwiftUI-09-Cupcake
//
//  Created by cradmin on 12/3/24.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), 
                           scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {
                    Task {
                        await placeOrder()
                    }
                })
                .padding()
            }
        }
        .navigationTitle("Check out")
        .alert("Thank you!", isPresented: $showingConfirmation){
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
       
        
        
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func placeOrder() async {
        // 1. Convert the current order object into JSON data
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // 2. Tell Swift how to send that data over a network call
        // Define the url to send the data to
        // Force unwrap for the URL
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        // Define the request
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField:
        "Content-Type")
        //request.httpMethod = "POST"
        
        // 3. Run the request and process the response
        do {
            // Do the network call
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // Decode the data from the result
            let decodedOrder = try JSONDecoder().decode(Order.self, from:
            data)
            // Set up the confirmation message
            confirmationMessage = "Your order for \(decodedOrder.quantity) x             \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
            
        } catch {
            print("Checkout failed.")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
