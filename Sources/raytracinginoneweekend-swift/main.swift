import Foundation

func color(r: Ray) -> Vec3 {
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
