package controller;

import dal.ConversationDAO;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.MessageDTO;

@ServerEndpoint(value = "/chatRoomServer")
public class ChatRoomServerEndpoint {

    static Set<Session> userId = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
public void handleOpen(Session session) {
    userId.add(session);

    // Lấy danh sách tin nhắn từ cơ sở dữ liệu và gửi chúng đến người dùng mới
    ConversationDAO cd= new ConversationDAO();
    List<MessageDTO> messages = cd.getAllMessagesInConversation();
    for (MessageDTO msg : messages) {
        try {
            session.getBasicRemote().sendText(msg.getContent());
        } catch (IOException ex) {
            Logger.getLogger(ChatRoomServerEndpoint.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}


@OnMessage
public void handleMessage(String message, Session userSession) throws IOException {
    String username = (String) userSession.getUserProperties().get("");
    if (username == null) {
        userSession.getUserProperties().put("username", message);
        userSession.getBasicRemote().sendText("System: you are connected as " + message);
    } else {
        for (Session session : users) {
            if (session.isOpen()) { // Kiểm tra nếu session còn mở
                session.getBasicRemote().sendText(username + ": " + message);
            }
        }
      
    }
}



    @OnClose
    public void handleClose(Session session) {
        users.remove(session);
    }

    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }

}