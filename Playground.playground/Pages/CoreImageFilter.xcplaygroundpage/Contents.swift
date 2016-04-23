//: [Previous](@previous)

import UIKit
import CoreImage

/*:
See more at [Apple Core Image Reference Collection.](https://developer.apple.com/library/prerelease/ios/documentation/GraphicsImaging/Reference/CoreImagingRef/index.html)

and [Apple Core Image Programming Guide](https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_intro/ci_intro.html)
*/

/*:
All Core Image Filters at [Core Image FIlter reference](https://developer.apple.com/library/prerelease/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP40004346)
*/

typealias Filter = CIImage -> CIImage

func blur(radius:Double) -> Filter {
    return { image in
        let parameters = [kCIInputRadiusKey:radius,kCIInputImageKey:image]
        let filter = CIFilter(name: "CIGaussianBlur",withInputParameters:parameters)
        return filter!.outputImage!
    }
}

func sepia(intensity:Double) -> Filter {
    return { image in
        let parameters = [kCIInputIntensityKey:intensity,kCIInputImageKey:image]
        let filter = CIFilter(name: "CISepiaTone",withInputParameters:parameters)
        return filter!.outputImage!
    }
}

func bloom(radius:Double,intensity:Double) -> Filter {
    return { image in
        let parameters = [kCIInputIntensityKey:intensity,kCIInputImageKey:image,kCIInputRadiusKey:radius]
        let filter = CIFilter(name: "CIBloom",withInputParameters:parameters)
        return filter!.outputImage!
    }
}

infix operator >>> { associativity left}
func >>> (filter1:Filter, filter2:Filter) -> Filter {
    return {img in filter2(filter1(img))}
}


let original = CIImage(image: UIImage(named: "photo")!)
let blurred = blur(6)(original!)
let sepiaTone = sepia(0.9)(original!)
let sepiaBlur = sepia(0.8) >>> blur(5)
let ultraImage = sepiaBlur(original!)
let bloomed = bloom(10, intensity: 6)(original!)

//: [Next](@next)