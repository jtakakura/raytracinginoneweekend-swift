import Foundation

func hit_sphere(center: Vec3, radius: Float, r: Ray) -> Bool {
    let oc = r.origin() - center
    let a = dot(v1: r.direction(), v2: r.direction())
    let b = 2 * dot(v1: oc, v2: r.direction())
    let c = dot(v1: oc, v2: oc) - radius * radius
    let discriminant = b * b - 4 * a * c
    return (discriminant > 0)
}

func color(r: Ray) -> Vec3 {
    if (hit_sphere(center: Vec3(e0: 0.0, e1: 0.0, e2: -1.0), radius: 0.5, r: r)) {
        return Vec3(e0: 1.0, e1: 0.0, e2: 0.0)
    }
    let unitDirection = unitVector(v: r.direction())
    let t = 0.5 * (unitDirection.y() + 1.0)

    return (1.0 - t) * Vec3(e0: 1.0, e1: 1.0, e2: 1.0) + t * Vec3(e0: 0.5, e1: 0.7, e2: 1.0)
}

let nx = 200
let ny = 100

print(String(format: "P3\n%d %d\n255", nx, ny))

let lowerLeftCorner = Vec3(e0: -2.0, e1: -1.0, e2: -1.0)
let horizontal = Vec3(e0: 4.0, e1: 0.0, e2: 0.0)
let vertical = Vec3(e0: 0.0, e1: 2.0, e2: 0.0)
let origin = Vec3(e0: 0.0, e1: 0.0, e2: 0.0)

for j in (0..<ny).reversed() {
    for i in 0..<nx {
        let u = Float(i) / Float(nx)
        let v = Float(j) / Float(ny)
        let r = Ray(a: origin, b: lowerLeftCorner + u * horizontal + v * vertical)
        let col = color(r: r)
        let ir = Int(255.9 * col[0])
        let ig = Int(255.9 * col[1])
        let ib = Int(255.9 * col[2])

        print(String(format: "%d %d %d", ir, ig, ib))
    }
}
