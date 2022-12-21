import SwiftUI

struct RoundedImageViewStrocked: View {
    var imageSystemName: String
    
    var body: some View {
        Image(systemName: imageSystemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedImageViewFilled: View {
    var imageSystemName: String
    
    var body: some View {
        Image(systemName: imageSystemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStrocked(imageSystemName: "arrow.counterclockwise")
            RoundedImageViewFilled(imageSystemName: "list.dash")
            RoundedRectTextView(text: "1993")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
    }
}
