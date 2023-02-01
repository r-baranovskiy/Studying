import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.17, green: 0.24, blue: 0.31)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("koko6a")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle()) //Создание круга
                    .overlay {
                        Circle().stroke(Color(.gray), lineWidth: 2)
                    } //Наложение
                Text("Руслан")
                    .foregroundColor(.white)
                    .font(.custom("AmaticSC-Bold", size: 40))
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.custom("AmaticSC-Regular", size: 30))
                Divider() //Разделение
                infoView(text: "+123 333 444 666", imageName: "phone.fill")
                infoView(text: "kashchenko@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
