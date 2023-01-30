import UIKit

public class TransitionsView: UIView {
  public var duration: TimeInterval = 1
  public var shouldHide = true

  public let
  beachBall = UIView(),
  drink = UIView(),
  iceCream = UIView()

  public let button: UIButton = {
    let button = UIButton( frame: .init(x: 135, y: 30, width: 130, height: 50) )
    button.setTitle("Animate!", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.01164326165, green: 0.6604029536, blue: 0.9141276479, alpha: 1), for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), for: .highlighted)
    button.titleLabel!.font = UIFont.systemFont(ofSize: 26, weight: .bold)
    button.backgroundColor = #colorLiteral(red: 1, green: 0.9062726498, blue: 0.6375227571, alpha: 1)
    button.layer.cornerRadius = 10
    return button
  } ()
  
  public required init?(coder: NSCoder) {
    fatalError()
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let background = UIImageView(frame: frame)
    background.image = UIImage(named: "sunnyBackground")
    background.alpha = 0.6

    [background, button].forEach(addSubview)

    [(beachBall, "beachball", -1), (drink, "drink", 0), (iceCream, "icecream", 1)].forEach {
      (view, name, position: CGFloat) in

      addSubview(view)
      view.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: position * 125),
        view.centerYAnchor.constraint(equalTo: centerYAnchor),
        view.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.38, constant: -50),
        view.heightAnchor.constraint(equalTo: view.widthAnchor)
      ])

      let imageView = UIImageView( image: UIImage(named: name) )
      imageView.backgroundColor = .init(white: 0, alpha: 0.5)
      imageView.layer.cornerRadius = 5
      imageView.layer.masksToBounds = true
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
      imageView.contentMode = .scaleAspectFit
      view.addSubview(imageView)

      NSLayoutConstraint.activate([
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor),
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
    }
  }
}
