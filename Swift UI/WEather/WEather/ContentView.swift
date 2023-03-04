import SwiftUI

struct ContentView: View {
    @State private var isNight = true
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(city: "Minsk, BY")
                
                CurrentWeatherView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    currentWeather: 5)
                
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
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
        }
    }
}

// MARK: - Views

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")
        ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var city: String
    
    var body: some View {
        Text(city)
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .medium, design: .default))
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: String
    var currentWeather: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .padding(.bottom, 10)
            Text("\(currentWeather)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
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

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
