package examenFinal;

import java.awt.EventQueue;
import java.io.IOException;
import java.io.StringReader;

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
import javax.swing.JOptionPane;

import java.awt.event.ActionListener;
import java.io.StringReader;
import java.awt.event.ActionEvent;
import java.awt.TextArea;

public class GUIAnalizadorLexico extends JFrame implements ActionListener {

	private JTextArea textArea;
	JButton btnLimpiar, btnAnalizar;
	private JTextArea textArea_1;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUIAnalizadorLexico window = new GUIAnalizadorLexico();
					window.setVisible(true);
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
		setBounds(100, 100, 530, 550);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		IniciarComponentes();
		setTitle("Analizador Lexico");
		setLocationRelativeTo(null);
		setResizable(false);
	}

	private void IniciarComponentes() {
		JLabel lblNewLabel = new JLabel("Hecho por: aaragona@ulasalle.edu.pe");
		
		JScrollPane scrollPane_1 = new JScrollPane();
		
		btnLimpiar = new JButton("Limpiar");
		btnLimpiar.addActionListener(this);
		
		btnAnalizar = new JButton("Analizar");
		btnAnalizar.addActionListener(this);
		
		JScrollPane scrollPane = new JScrollPane();
		GroupLayout groupLayout = new GroupLayout(getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addGap(1)
							.addComponent(scrollPane_1, GroupLayout.PREFERRED_SIZE, 248, GroupLayout.PREFERRED_SIZE)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout.createSequentialGroup()
									.addGap(18)
									.addComponent(btnAnalizar, GroupLayout.PREFERRED_SIZE, 198, GroupLayout.PREFERRED_SIZE))
								.addGroup(groupLayout.createSequentialGroup()
									.addGap(18)
									.addComponent(btnLimpiar, GroupLayout.PREFERRED_SIZE, 198, GroupLayout.PREFERRED_SIZE))
								.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 239, GroupLayout.PREFERRED_SIZE)))
						.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 237, GroupLayout.PREFERRED_SIZE))
					.addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.TRAILING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap(22, Short.MAX_VALUE)
					.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(btnAnalizar, GroupLayout.PREFERRED_SIZE, 42, GroupLayout.PREFERRED_SIZE)
							.addGap(18)
							.addComponent(btnLimpiar, GroupLayout.PREFERRED_SIZE, 42, GroupLayout.PREFERRED_SIZE)
							.addGap(30)
							.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 321, GroupLayout.PREFERRED_SIZE))
						.addComponent(scrollPane_1, GroupLayout.PREFERRED_SIZE, 472, GroupLayout.PREFERRED_SIZE))
					.addGap(3)
					.addComponent(lblNewLabel))
		);
		
		textArea_1 = new JTextArea();
		scrollPane.setViewportView(textArea_1);
		
		textArea = new JTextArea();
		scrollPane_1.setViewportView(textArea);
		getContentPane().setLayout(groupLayout);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(btnAnalizar == e.getSource()) {
			String expresion = textArea.getText();
			AnalizadorLexico lexico = new AnalizadorLexico(new StringReader(expresion), textArea_1);
			try {
				 lexico.yylex();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		if(btnLimpiar == e.getSource()) {
			
			textArea_1.setText(null);
		}
	}
}
