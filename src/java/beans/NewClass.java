/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Laura
 */
public class NewClass {

    private String name = "lalalaX";
    private String name1 = "";
    
    public void lala()
    {
         if(name.endsWith("X"))
        {
            name1 = name.substring(0, name.lastIndexOf('X'));
        } else {
            name1 = name;
        }
        System.out.println(name+" - "+name1);
    }
    
    
    public static void main(String[] args) {
        NewClass nc = new NewClass();
        nc.lala();
    }

}
