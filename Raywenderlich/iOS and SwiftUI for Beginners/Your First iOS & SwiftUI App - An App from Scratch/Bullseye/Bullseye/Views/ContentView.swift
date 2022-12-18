import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .font(.footnote)
            }
            Text(String(game.target))
                .kerning(-1)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                alertIsVisible = true
                print(alertIsVisible)
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $alertIsVisible) {
                return Alert(title: Text("Hello there!"), message: Text("You scored \(game.points(sliderValue: Int(sliderValue))) points in this round"), dismissButton: .default(Text("Cancel")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
