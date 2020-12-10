/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Post_photo;

import java.util.Date;

/**
 *
 * @author vc
 */
public class Post implements Comparable<Post>{
   int id_user;
    public int getSrno() {
        return srno;
    }

    public void setSrno(int srno) {
        this.srno = srno;
    }
   String phot;
   Date date;
   String story; 
   int srno;

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getPhot() {
        return phot;
    }

    public void setPhot(String phot) {
        this.phot = phot;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }
   
    
        @Override
    public int compareTo(Post o) {
       int compareSR_NO=(o.getSrno());
       return compareSR_NO-this.getSrno();
    }
}
