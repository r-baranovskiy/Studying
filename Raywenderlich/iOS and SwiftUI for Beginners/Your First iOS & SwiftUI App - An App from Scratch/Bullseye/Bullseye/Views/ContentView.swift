import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    InstructionsView(game: $game)
                    HStack {
                        Text("1")
                            .bold()
                            .foregroundColor(Color("TextColor"))
                        Slider(value: $sliderValue, in: 1.0...100.0)
                        Text("100")
                            .foregroundColor(Color("TextColor"))
                            .bold()
                    }
                    .padding(20)
                    Button(action: {
                        alertIsVisible = true
                        print(alertIsVisible)
                    }) {
                        Text("Hit me".uppercased())
                            .bold()
                            .font(.title3)
                    }
                    .padding(20.0)
                    .background(
                        ZStack {
                            Color("ButtonColor")
                            LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
                        })
                    .foregroundColor(Color.white)
                    .cornerRadius(21.0)
                    .alert(isPresented: $alertIsVisible) {
                        return Alert(title: Text("Hello there!"), message: Text("You scored \(game.points(sliderValue: Int(sliderValue))) points in this round"), dismissButton: .default(Text("Cancel")))
                    }
                }
            }
        }
    }
    
    struct InstructionsView: View {
        @Binding var game: Game
        
        var body: some View {
            VStack {
                InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
            }
            BigNumberView(text: String(game.target))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
