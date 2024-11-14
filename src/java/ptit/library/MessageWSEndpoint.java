/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library;

import com.google.gson.Gson;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import ptit.library.controller.MessageDAO;


/**
 *
 * @author Admin
 */

class Message {
    private String sender;
    private String receiver;
    private String message;
    private List<String> url;

    public Message(String sender, String receiver, String message, List<String> url) {
        this.sender = sender;
        this.receiver = receiver;
        this.message = message;
        this.url = url;
    }

    public String getSender() {
        return sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public String getMessage() {
        return message;
    }

    public List<String> getUrl() {
        return url;
    }
}

@jakarta.websocket.server.ServerEndpoint("/chat")
public class MessageWSEndpoint {
    private static Set<Session> clients = new HashSet<>();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("New connection: " + session.getId() + " = " + session.getRequestParameterMap().get("username").get(0));
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("TIN NHẮN NHẬN ĐƯỢC: " + message);
        Gson gson = new Gson();
        Message msg = gson.fromJson(message, Message.class);
        System.out.println(msg.getSender() + " | " + msg.getReceiver() + " | " + msg.getMessage());
        
        MessageDAO.insertMessage(msg.getSender(), msg.getReceiver(), message);
        
        String jsonMsg = MessageDAO.getLastestMessageUserSend(msg.getSender());
        System.out.println(jsonMsg);
               
        for (Session client : clients) {
            if (client.getRequestParameterMap().get("username").get(0).equals(msg.getReceiver()) || 
                    client.getRequestParameterMap().get("username").get(0).equals(msg.getSender())) { 
                try {
                    System.out.println("GỬI LẠI TIN ĐẾN : " + msg.getReceiver());
                    client.getBasicRemote().sendText(jsonMsg);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("Connection closed: " + session.getId());
    }
    
}
