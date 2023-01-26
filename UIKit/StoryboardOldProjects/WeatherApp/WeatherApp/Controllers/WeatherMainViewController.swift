import  UIKit
import CoreLocation

class WeatherMainViewController: UIViewController,
                                 WeatherAppViewModelProtocol,
                                 WeatherManagerProtocol,
                                 CLLocationManagerDelegate
{
    
    //MARK: - Constants
    
    private let weatherViewModel = WeatherAppViewModel()
    private var weatherManager = WeatherManager()
    private let locationManager = CLLocationManager()
    
    private var currentLongitude = CLLocationDegrees()
    private var currentLatitude = CLLocationDegrees()
    private var mainWeatherView = UIView()
    private let backgroundImageView = UIImageView()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        mainWeatherView = weatherViewModel.mainWeatherAppView
        backgroundImageView.image = UIImage(named: "background")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        weatherManager.delegate = self
        weatherViewModel.delegate = self

        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        backgroundImageView.clipsToBounds = false
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addView(backgroundImageView)
        view.addView(mainWeatherView)
        
        setupConstraints()
    }
    
    //MARK: - Delegates
    
    //LocationManager delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let longitude = location.coordinate.longitude
            let latitude = location.coordinate.latitude
            locationManager.stopUpdatingLocation()
            currentLatitude = latitude
            currentLongitude = longitude
            weatherManager.fetchWeather(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

    //ViewModel delegate
    
    func locationButtonDidPressed() {
        locationManager.startUpdatingLocation()
        locationManager.requestLocation()
        weatherManager.fetchWeather(latitude: currentLatitude, longitude: currentLongitude)
        locationManager.stopUpdatingLocation()
    }
    
    func userIsTyping(_ weatcherViewModel: WeatherAppViewModel, text: String) {
        weatherManager.fetchWeather(cityName: text)
    }
    
    //WeatherManager delegate
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weatherModel: WeatherModel) {
        weatherViewModel.updateUI(temp: weatherModel.tempatureString, cityName: weatherModel.cityName, conditionImageName: weatherModel.conditionName)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    //MARK: - Setup Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            mainWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}

