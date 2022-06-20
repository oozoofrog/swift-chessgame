
import Foundation

public final class Board {
    
    public func prepare() {
        
    }
    
    public enum Rank: Int {
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
    }
    
    public enum File: String {
        case A, B, C, D, E, F, G, H
    }
    
}
