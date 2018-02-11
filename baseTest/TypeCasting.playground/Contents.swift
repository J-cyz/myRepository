class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [   //whatever Movie or Song,return MediaItem,自行推断为MediaItem
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var mediaItemCount = 0
var movieCount = 0
var songCount = 0

for item in library {
    if item is MediaItem {      //is用于判断是否为同一类型
        mediaItemCount += 1
    }
    if item is Movie {
        movieCount += 1
    }
    else if item is Song {
        songCount += 1
    }
}
print("Media library contains \(mediaItemCount) mediaItems including  \(movieCount) movies and \(songCount) songs")

for item in library {
    if let movie = item as? Movie {     //向下转型 MediaItem -> Movie
        print("Movie: \(movie.name), dir. \(movie.director)")
    }
    else if let song = item as? Song {      //向下转型 MediaItem -> Song
        print("Song: \(song.name), by \(song.artist)")
    }
}


//Any:代表任何类型的实例，包括方法类型
//AnyObject:代表任何class类型的实例

var things = [Any]()

things.append(0)                        //Int
things.append(0.0)                      //Double,默认Double而不是FLoat
things.append(42)                       //Int
things.append(3.14159)                  //Double
things.append("hello")                  //String
things.append((3.0, 5.0))               //(Double,Double)
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))        //Moview
things.append({ (name: String) -> String in "Hello, \(name)" })             //闭包,添加闭包函数
for thing in things {
    switch thing {      //对于[Any],必须向下转型
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

















