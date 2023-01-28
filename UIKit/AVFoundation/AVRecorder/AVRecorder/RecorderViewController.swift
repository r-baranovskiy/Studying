import UIKit
import AVFoundation

class RecorderViewController: UIViewController {
    
    // MARK: - UI Constants
    
    private let startRecordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Record", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stopRecordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stop record", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let startPlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .medium)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stopPlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stop playback", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .medium)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - AVFoundation Constants
    
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    private var hasMicAccess = false
    private var displayNotification = false
    
    private var status: AudioStatus = .stopped
    
    private var urlForDemo: URL {
        let fileManager = FileManager.default
        let tempDir = fileManager.temporaryDirectory
        let filePath = "TempMemo.caf"
        return tempDir.appendingPathComponent(filePath, conformingTo: .audio)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        recordSettings()
        startRecordButton.addTarget(self, action: #selector(startRecord), for: .touchUpInside)
        stopRecordButton.addTarget(self, action: #selector(stopRecord), for: .touchUpInside)
        startPlayButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        stopPlayButton.addTarget(self, action: #selector(stopPlayback), for: .touchUpInside)
        view.addSubview(startRecordButton)
        view.addSubview(stopRecordButton)
        view.addSubview(startPlayButton)
        view.addSubview(stopPlayButton)
        addNotifications()
        setUpConstraints()
    }
    
    // MARK: - Notifications
    
    private func addNotifications() {
        let notificationCenter = NotificationCenter()
        notificationCenter.addObserver(
            self, selector: #selector(handleRouteChange),
            name: AVAudioSession.routeChangeNotification, object: nil)
        notificationCenter.addObserver(
            self, selector: #selector(handleInteruption),
            name: AVAudioSession.interruptionNotification, object: nil)
    }
    @objc private func handleInteruption(notification: Notification) {
        if let info = notification.userInfo,
           let rawValue = info[AVAudioSessionInterruptionTypeKey] as? UInt {
            let type = AVAudioSession.InterruptionType(rawValue: rawValue)
            if type == .began {
                if status == .playing {
                    stopPlayback()
                } else if status == .recording {
                    stopRecord()
                }
            } else {
                if let rawValue = info[AVAudioSessionInterruptionOptionKey] as? UInt {
                    let options = AVAudioSession.InterruptionOptions(rawValue: rawValue)
                    if options == .shouldResume {
                        
                    }
                }
            }
        }
    }
    
    @objc private func handleRouteChange(notification: Notification) {
        if let info = notification.userInfo,
           let rawValue = info[AVAudioSessionRouteChangeReasonKey] as? UInt {
            let reason = AVAudioSession.RouteChangeReason(rawValue: rawValue)
            if reason == .oldDeviceUnavailable {
                guard let previousRoute = info[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription,
                      let previousOutput = previousRoute.outputs.first else {
                    return
                }
                if previousOutput.portType == .headphones {
                    if status == .playing {
                        stopPlayback()
                    } else if status == .recording {
                        stopRecord()
                    }
                }
            }
        }
    }
     
    // MARK: - Playing
    
    @objc private func play() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: urlForDemo)
            
        } catch {
            print(error.localizedDescription)
        }
        guard let audioPlayer = audioPlayer else {
            return
        }
        audioPlayer.delegate = self

        if audioPlayer.duration > 0.0 {
            //audioPlayer.prepareToPlay()
            audioPlayer.play()
            status = .playing
        }
        
        
    }
    
    @objc private func stopPlayback() {
        if status == .playing {
            audioPlayer?.stop()
            status = .stopped
        }
    }
    
    // MARK: - Recording
    
    private func requestMicrophoneAccess() {
        let session = AVAudioSession.sharedInstance()
        session.requestRecordPermission { granted in
            self.hasMicAccess = granted
            if granted {
                self.audioRecorder?.record()
            } else {
                self.displayNotification = true
            }
        }
    }
    
    @objc private func startRecord() {
        if status == .stopped && hasMicAccess {
            audioRecorder?.record()
            status = .recording
        } else {
            requestMicrophoneAccess()
        }

    }
    
    @objc private func stopRecord() {
        if status == .recording {
            audioRecorder?.stop()
            status = .stopped
        } else {
            print("Not recoring")
        }
    }
    
    private func recordSettings() {
        let recordStrings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: urlForDemo, settings: recordStrings)
        } catch {
            print("Error creating audio recorder")
        }
    }
    
    // MARK: - Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            startRecordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startRecordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stopRecordButton.topAnchor.constraint(equalTo: startRecordButton.bottomAnchor, constant: 50),
            stopRecordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startPlayButton.topAnchor.constraint(equalTo: stopRecordButton.bottomAnchor, constant: 50),
            startPlayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stopPlayButton.topAnchor.constraint(equalTo: startPlayButton.bottomAnchor, constant: 50),
            stopPlayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

// MARK: - AVAudioPlayerDelegate

extension RecorderViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        status = .stopped
    }
}

// MARK: - AVAudioRecorderDelegate

extension RecorderViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        status = .stopped
    }
}


