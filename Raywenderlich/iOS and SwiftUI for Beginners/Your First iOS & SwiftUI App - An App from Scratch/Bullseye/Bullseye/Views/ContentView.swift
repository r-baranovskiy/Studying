import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                    .padding(20)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
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
    
    struct SliderView: View {
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack{
                SliderValueText(text: "1")
                Slider(value: $sliderValue, in: 1.0...100.0)
                SliderValueText(text: "100")
            }
        }
    }
    
    struct HitMeButton: View {
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        @Binding var game: Game
        
        var body: some View {
            Button(action: {
                alertIsVisible = true
            }) {
                Text("Hit me".uppercased())
                    .bold()
                    .font(.title3)
            }
            .padding(20)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(colors: [Color.white.opacity(0.4), Color.clear], startPoint: .top, endPoint: .bottom)
                })
            .foregroundColor(Color.white)
            .cornerRadius(21.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color.white, lineWidth: 2)
            )
            .alert(isPresented: $alertIsVisible) {
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(Int(sliderValue.rounded()))\n" + "You scored \(game.points(sliderValue: Int(sliderValue))) points in this round"), dismissButton: .default(Text("Cancel")))
            }
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
