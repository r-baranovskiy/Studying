import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack {
                Text("Cupertino, CA")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        systemImageName: "cloud.sun.fill", temperature: 10)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        systemImageName: "sun.max.fill", temperature: 14)
                    WeatherDayView(
                        dayOfWeek: "THU",
                        systemImageName: "wind", temperature: 12)
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        systemImageName: "sunset.fill", temperature: 11)
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        systemImageName: "tornado", temperature: 8)
                }
                    Spacer()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var systemImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
                .padding(.top)
            Image(systemName: systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
