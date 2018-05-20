import Foundation

class Ray {
    var A: Vec3;
    var B: Vec3;

    init(a: Vec3, b: Vec3) {
        A = a
        B = b
    }
    
    convenience init() {
        self.init(a: Vec3(), b: Vec3())
    }

    func origin() -> Vec3 {
        return A;
    }
    
    func direction() -> Vec3 {
        return B;
    }
    
    func pointAtParameter(t: Float) -> Vec3 {
        return A + t * B;
    }
}
