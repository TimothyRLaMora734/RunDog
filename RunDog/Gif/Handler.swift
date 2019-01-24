import ImageIO
import Cocoa
import CoreGraphics

public class Handler {
  public let encoder: Encoder
  public let decoder: Decoder

  public init(encoder: Encoder, decoder: Decoder) {
    self.encoder = encoder
    self.decoder = decoder
  }

  /// Modify each frame in the gif
  public func modify(gifUrl: URL, closure: (NSImage) -> NSImage ) -> URL? {
    guard let info = decoder.decode(gifUrl: gifUrl) else {
      return nil
    }

    let images = info.images.map(closure)

    return encoder.encode(images: images, frameDuration: info.frameDuration)
  }
}
