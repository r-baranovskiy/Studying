import SwiftUI

struct infoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color(.gray))
            .frame(height: 50)
            .overlay {
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                }
            }
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView(text: "Hello", imageName: "phone.fill")
    }
}
