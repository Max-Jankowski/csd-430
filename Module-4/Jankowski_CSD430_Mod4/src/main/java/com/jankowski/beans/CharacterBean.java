// Max Jankowski
// Bellevue University 
// CSD-430 Mod 4 

package com.jankowski.beans;
import java.io.Serializable;

// the javabean will encapsulate character data from a novel. each of the instances will represent one character with 6 fields 

public class CharacterBean implements Serializable {
     
	// required to make sure the version is compataible during object deserialization 
    private static final long serialVersionUID = 1L;


    // defining 6 fields, added nationality as the setting gets wider in later novels 
    private String characterName;
    private String role;
    private String organization;
    private String nationality;
    private String era;
    private String description;

    
    
    // no argument constructor that javabean specs require 
    // sets initial values of fields as null 
    public CharacterBean() {
    }

    // getter allowing jsp and other classes to read values
 

   
    // returns characters full name 
    public String getCharacterName() {
        return characterName;
    }

        // returns their role 
    public String getRole() {
        return role;
    }

    
    // returns the organization or character affiliation 
    public String getOrganization() {
        return organization;
    }

    public String getNationality() {
        return nationality;
    }

    
    // the overall series takes place over almost a century, this places characters in the larger 
    // story within period of when they appeared in the books
    public String getEra() {
        return era;
    }
    
    public String getDescription() {
        return description;
    }

    // setters section to allow jsp and classes to assign values    
    // below are setters to names,roles, eras etc from the fields 
    public void setCharacterName(String characterName) {
        this.characterName = characterName;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
    public void setOrganization(String organization) {
        this.organization = organization;
    }
    
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    
    public void setEra(String era) {
        this.era = era;
    }
   
    public void setDescription(String description) {
        this.description = description;
    }

} 