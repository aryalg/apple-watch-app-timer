//
//  ContentView.swift
//  timer-app WatchKit Extension
//
//  Created by Bikram Aryal on 20/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false;
    @State var timerVal = 1;
    
    var body: some View {
        VStack {
            Text("Start Timer For \(timerVal) seconds")
                .padding()
            Picker(selection: $timerVal, label: Text("")) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
                
          
            
        }
            NavigationLink(
             destination: SecondView(secondScreenShown: $secondScreenShown, timerVal: timerVal),
             isActive: $secondScreenShown,
             label: {
                 Text("Go")
             })
       
        }
    }
}


struct SecondView: View {
    @Binding var secondScreenShown: Bool;
    @State var timerVal = 1;

    var body: some View {
        
        if(timerVal > 0) {
            VStack {
                Text("Time Remaining")
                    .font(.system(size: 14 ))
                Text("\(timerVal)")
                    .font(.system(size: 40 ))
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
                            if self.timerVal > 0 {
                                self.timerVal -= 1
                            }
                        }
                    }
                Text("seconds")
                    .font(.system(size: 14 ))
                Button(action: {
                    self.secondScreenShown = false;
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                })
                
                
            }
        } else {
            
            Button(action: {
                self.secondScreenShown = false;
            }, label: {
                Text("Done")
                    .foregroundColor(.green)
            })
            
        }
        
       
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
