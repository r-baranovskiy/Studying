import UIKit

final class UIMenuViewController: UIViewController {
    
    private var menu =  UIMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createMenu()
        configureNavBar()
    }
    
    private func configureNavBar() {
        let barButtonRight = UIBarButtonItem(
            image: UIImage(systemName: "list.bullet"), menu: menu)
        navigationItem.rightBarButtonItem = barButtonRight
    }
    
    private func createMenu() {
        let story = UIAction(
            title: "Camera",
            image: UIImage(systemName: "camera.metering.partial")) { _ in
            }
        
        let note = UIAction(
            title: "Note",
            image: UIImage(systemName: "pencil.line")) { _ in
            }
        
        let photo = UIAction(
            title: "Photo",
            image: UIImage(systemName: "photo")) { _ in
            }
        
        let subMenu = UIMenu(title: "Else", options: .displayInline,
                             children: [note, photo])
        
        menu = UIMenu(title: "Options", children: [story, subMenu])
    }
}

//extension UIMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
//        UIContextMenuConfiguration(actionProvider:  { _ in
//            self.menu
//        })
//    }
//}

