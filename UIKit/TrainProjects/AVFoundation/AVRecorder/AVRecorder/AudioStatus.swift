import Foundation

enum AudioStatus: Int {
    case stopped
    case playing
    case recording
    
    var audioName: String {
        let audioNames = ["Audio:Stopped", "Audio:Playing", "Audio:recording"]
        return audioNames[rawValue]
    }
    
    var description: String {
        return audioName
    }
}
