import Foundation

let nx = 200
let ny = 100

print(String(format: "P3\n%d %d\n255", nx, ny))

for j in (0..<ny).reversed() {
    for i in 0..<nx {
        let col = Vec3(e0: Float(i) / Float(nx), e1: Float(j) / Float(ny), e2: 0.2)
        let ir = Int(255.9 * col[0])
        let ig = Int(255.9 * col[1])
        let ib = Int(255.9 * col[2])

        print(String(format: "%d %d %d", ir, ig, ib))
    }
}
