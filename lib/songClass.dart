/*
* Author: Ethan Sutherland
* Description: Defines the Song class so that song data can be stored
*              in song objects and manipulated as needed.
 */
class Song{
  //Fields
  String title, artist, infolink, mp3link, coverart, genre;

  //Getters and Setters
  set songTitle(String title){
    this.title = title;
  }

  String get songTitle {
    return title;
  }

  set songArtist(String artist){
    this.artist = artist;
  }

  String get songArtist {
    return artist;
  }

  set songInfo(String infolink){
    this.infolink = infolink;
  }

  String get songInfo {
    return infolink;
  }

  set songMP3(String mp3link){
    this.mp3link = mp3link;
  }

  String get songMP3 {
    return mp3link;
  }

  set songArt(String coverart){
    this.coverart = coverart;
  }

  String get songArt {
   return coverart;
  }

  set songGenre(String genre){
    this.genre = genre;
  }

  String get songGenre {
    return genre;
  }

  //Constructor
  Song() {
    //default nothing
  }

  Song.constructor(this.title, this.artist, this.infolink, this.mp3link, this.coverart, this.genre);

  //Functions
  void songData() {
    print(title + artist + infolink + mp3link + coverart + genre);
  }
}
