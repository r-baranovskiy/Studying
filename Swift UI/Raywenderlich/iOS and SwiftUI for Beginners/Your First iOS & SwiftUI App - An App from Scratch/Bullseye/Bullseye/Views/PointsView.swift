import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        VStack(spacing: 10) {
            let roundedSliderValue = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedSliderValue)
            InstructionText(text: "The slider's value is ")
            BigNumberView(text: String(roundedSliderValue))
            BodyText(text: "You scored \(game.points(sliderValue: roundedSliderValue)) Points\n🎉🎉🎉 ")
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}
