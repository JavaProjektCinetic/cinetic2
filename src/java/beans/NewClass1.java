/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 *
 * @author Laura
 */
public class NewClass1 extends JFrame {

    public NewClass1() {
        initComponents();
        
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
    }

    private void initComponents() {
        JPanel pn = new JPanel();
        this.getContentPane().setLayout(new BorderLayout());
        this.getContentPane().add(pn, BorderLayout.CENTER);
        pn.setLayout(new GridLayout(10, 10));
        
        for (int i = 0; i < 10; i++) {
            for(int j = 0; j<10; j++)
            {
                JLabel lb = new JLabel("x");
                lb.setSize(10, 20);
                pn.add(lb);
            }
        }
    }
    
    public static void main(String[] args) {
        new NewClass1().setVisible(true);
    }

}
