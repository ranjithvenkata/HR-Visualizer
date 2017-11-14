/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.util.Arrays;


/**
 *
 * @author Ranjith Dontamsetti
 */
public class CheckCountry {
   public int sea;
    public int sa;
    public int ea;
    public int rw;
    
String[] southEastAsia = new String[] {"Brunei","Cambodia","East Timor","Indonesia","Laos","Malaysia","Myanmar","Philippines","Singapore","Thailand","Vietnam"};
String[] southAsia = new String[] {"Afghanistan","Bangladesh","Bhutan","India","Nepal","Maldives","Pakistan","Sri Lanka"};
String[] eastAsia = new String[] {"China","Hong Kong","Macau","Taiwan","Mongolia","Japan","North Korea","South Korea"};
    public CheckCountry()
    {
    sea=0;
    sa=0;
    ea=0;
    rw=0;
    }
   public void check(String country)
{
if(Arrays.asList(southEastAsia).contains(country))
{
    sea++;
    
}
else if(Arrays.asList(southAsia).contains(country))
{
    sa++;
    
}
else if(Arrays.asList(eastAsia).contains(country))
{
    ea++;
    
}
else
rw++;
        }
        
}      
        


