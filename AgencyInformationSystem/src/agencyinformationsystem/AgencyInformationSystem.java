package agencyinformationsystem;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;

/**
 *
 * @author Artem
 */
public class AgencyInformationSystem {

    public static void main(String[] args) {
        
        AgencyInformationSystem sd = new AgencyInformationSystem();
        
    }
    
    public AgencyInformationSystem()
    {
        initComponents();
        initActions();
    }
    
    private void initComponents()
    {
        JFrame f = new JFrame();
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setTitle("MainFrame");
        f.setSize(300, 400);
        f.setVisible(true);
        //
        
        jb.setText("Посчитать");
        //
        f.setLayout(new GridLayout(4,1));
        
        f.add(a);
        f.add(b);
        f.add(c);
        f.add(jb);
    }
    
    private void initActions()
    {
        jb.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int a1;
                int a2;
                int res;
                
                try
                {
                    a1 = Integer.parseInt(a.getText());
                    a2 = Integer.parseInt(b.getText());
                    
                    res = a1 + a2;
                    
                    c.setText(String.valueOf(res));
                }
                catch (Exception ex)
                {
                    System.out.println("Ошибка преобразования!");
                }
                
                
                
            }
        });
    }
    
    private JTextField a = new JTextField();
    private JTextField b = new JTextField();
    private JTextField c = new JTextField();
    private JButton jb = new JButton();
}
