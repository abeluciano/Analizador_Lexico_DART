package examenFinal;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextPane;
import java.awt.ScrollPane;
import java.awt.List;
import javax.swing.JScrollPane;
import javax.swing.JLabel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class GUIAnalizadorLexico {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUIAnalizadorLexico window = new GUIAnalizadorLexico();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public GUIAnalizadorLexico() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 530, 550);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JButton btnAnalizar = new JButton("Analizar");
		btnAnalizar.setBounds(283, 30, 198, 42);
		btnAnalizar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		
		JButton btnLimpiar = new JButton("Limpiar");
		btnLimpiar.setBounds(283, 90, 198, 42);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(265, 162, 239, 321);
		
		JLabel lblNewLabel = new JLabel("Hecho por: aaragona@ulasalle.edu.pe");
		lblNewLabel.setBounds(10, 486, 237, 14);
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(10, 11, 248, 472);
		
		JTextArea textArea = new JTextArea();
		scrollPane_1.setViewportView(textArea);
		
		List list = new List();
		scrollPane.setViewportView(list);
		frame.getContentPane().setLayout(null);
		frame.getContentPane().add(lblNewLabel);
		frame.getContentPane().add(scrollPane_1);
		frame.getContentPane().add(btnLimpiar);
		frame.getContentPane().add(btnAnalizar);
		frame.getContentPane().add(scrollPane);
	}
}
