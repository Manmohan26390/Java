
package mymail;

import java.util.Properties;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;
public class Mymail {

   
    public static int send_otp(String to) {
        
    
 
          
      

      int i;
     
      String from = "r26390r@gmail.com";
      final String username = "r26390r";
      final String password = "ravi@gmail"; 
        
        
      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
     props.put("mail.smtp.host", "smtp.gmail.com");
      props.put("mail.smtp.port", "587");
       
      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	Random r=new Random();
         i=r.nextInt(10000);
        
        // Now set the actual message
	   message.setText( "Your OTP is"+i+"");

	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
      return i;
 }
    
}
    
        
