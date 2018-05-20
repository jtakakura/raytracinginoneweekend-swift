import Foundation

class Vec3 {
    var e: [Float]
    
    init() {
        e = []
    }
    
    init(e0: Float, e1: Float, e2: Float) {
        e = [e0, e1, e2]
    }
    
    func x() -> Float {
        return e[0]
    }
    
    func y() -> Float {
        return e[1]
    }
    
    func z() -> Float {
        return e[2]
    }
    
    func r() -> Float {
        return e[0]
    }
    
    func g() -> Float {
        return e[1]
    }
    
    func b() -> Float {
        return e[2]
    }
    
    func length() -> Float {
        return sqrt(squaredLength());
    }

    func squaredLength() -> Float {
        return e[0] * e[0] + e[1] * e[1] + e[2] * e[2];
    }
    
    func makeUnitVector() {
        let k = 1.0 / length()
        e[0] *= k
        e[1] *= k
        e[2] *= k
    }

    subscript(i: Int) -> Float {
        return e[i]
    }
}

prefix func +(v: Vec3) -> Vec3 {
    return v;
}

prefix func -(v: Vec3) -> Vec3 {
    return Vec3(e0: -v.e[0], e1: -v.e[1], e2: -v.e[2]);
}

func +(v1: Vec3, v2: Vec3) -> Vec3 {
    return Vec3(e0: v1.e[0] + v2.e[0], e1: v1.e[1] + v2.e[1], e2: v1.e[2] + v2.e[2])
}

func -(v1: Vec3, v2: Vec3) -> Vec3 {
    return Vec3(e0: v1.e[0] - v2.e[0], e1: v1.e[1] - v2.e[1], e2: v1.e[2] - v2.e[2])
}

func *(v1: Vec3, v2: Vec3) -> Vec3 {
    return Vec3(e0: v1.e[0] * v2.e[0], e1: v1.e[1] * v2.e[1], e2: v1.e[2] * v2.e[2])
}

func /(v1: Vec3, v2: Vec3) -> Vec3 {
    return Vec3(e0: v1.e[0] / v2.e[0], e1: v1.e[1] / v2.e[1], e2: v1.e[2] / v2.e[2])
}

func *(t: Float, v: Vec3) -> Vec3 {
    return Vec3(e0: t * v.e[0], e1: t * v.e[1], e2: t * v.e[2])
}

func *(v: Vec3, t: Float) -> Vec3 {
    return t * v;
}

func /(v: Vec3, t: Float) -> Vec3 {
    return Vec3(e0: v.e[0] / t, e1: v.e[1] / t, e2: v.e[2] / t)
}

func dot(v1: Vec3, v2: Vec3) -> Float {
    return v1.e[0] * v2.e[0] + v1.e[1] * v2.e[1] + v1.e[2] * v2.e[2];
}

func cross(v1: Vec3, v2: Vec3) -> Vec3 {
    return Vec3(
        e0: (v1.e[1] * v2.e[2] - v1.e[2] * v1.e[1]),
        e1: (-(v1.e[0] * v2.e[2] - v1.e[2] * v1.e[0])),
        e2: (v1.e[0] * v2.e[1] - v1.e[1] * v1.e[0])
    )
}

func +=(v1: Vec3, v2: Vec3) -> Vec3 {
    v1.e[0] += v2.e[0]
    v1.e[1] += v2.e[1]
    v1.e[2] += v2.e[2]

    return v1
}

func -=(v1: Vec3, v2: Vec3) -> Vec3 {
    v1.e[0] -= v2.e[0]
    v1.e[1] -= v2.e[1]
    v1.e[2] -= v2.e[2]
    
    return v1
}

func *=(v1: Vec3, v2: Vec3) -> Vec3 {
    v1.e[0] *= v2.e[0]
    v1.e[1] *= v2.e[1]
    v1.e[2] *= v2.e[2]
    
    return v1
}

func /=(v1: Vec3, v2: Vec3) -> Vec3 {
    v1.e[0] /= v2.e[0]
    v1.e[1] /= v2.e[1]
    v1.e[2] /= v2.e[2]
    
    return v1
}

func *=(v: Vec3, t: Float) -> Vec3 {
    v.e[0] *= t
    v.e[1] *= t
    v.e[2] *= t
    
    return v
}

func /=(v: Vec3, t: Float) -> Vec3 {
    v.e[0] /= t
    v.e[1] /= t
    v.e[2] /= t
    
    return v
}

func unitVector(v: Vec3) -> Vec3 {
    return v / v.length()
}
