import UIKit

class LockUnlockButton: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(with image: UIImage) {
        self.init(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        self.image = image
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
