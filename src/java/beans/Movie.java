/*
 * Author:      Laura Rössl
 * Date:        10.04.2015
 * Projectname: Cinetic
 */
package beans;


public class Movie {
   private String titleEnglish;
   private String picture;
   private String description;
   private String trailer;
   private String music;
   private String titleGerman;
   private int rating;
   private String genreEnglish;
   private String genreGerman;
   private int length;
   private int movieID;

    public Movie(String titleEnglish, String picture, String description, String trailer, String music, String titleGerman, int rating, String genreEnglish, String genreGerman, int length, int movieID) {
        this.titleEnglish = titleEnglish;
        this.picture = picture;
        this.description = description;
        this.trailer = trailer;
        this.music = music;
        this.titleGerman = titleGerman;
        this.rating = rating;
        this.genreEnglish = genreEnglish;
        this.genreGerman = genreGerman;
        this.length = length;
        this.movieID = movieID;
    }

    public String getTitleEnglish() {
        return titleEnglish;
    }

    public void setTitleEnglish(String titleEnglish) {
        this.titleEnglish = titleEnglish;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getMusic() {
        return music;
    }

    public void setMusic(String music) {
        this.music = music;
    }

    public String getTitleGerman() {
        return titleGerman;
    }

    public void setTitleGerman(String titleGerman) {
        this.titleGerman = titleGerman;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getGenreEnglish() {
        return genreEnglish;
    }

    public void setGenreEnglish(String genreEnglish) {
        this.genreEnglish = genreEnglish;
    }

    public String getGenreGerman() {
        return genreGerman;
    }

    public void setGenreGerman(String genreGerman) {
        this.genreGerman = genreGerman;
    }  
    
    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
}
