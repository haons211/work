/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Message {
    private int message_id;
    private int conversation_id;
    private int sender_id;
    private String content;
    private Date timestamp;
    private String formatTime;

    public Message() {
    }

    public Message(int message_id, int conversation_id, int sender_id, String content, Date timestamp) {
        this.message_id = message_id;
        this.conversation_id = conversation_id;
        this.sender_id = sender_id;
        this.content = content;
        this.timestamp = timestamp;
    }

    public Message(int message_id, int conversation_id, int sender_id, String content, Date timestamp, String formatTime) {
        this.message_id = message_id;
        this.conversation_id = conversation_id;
        this.sender_id = sender_id;
        this.content = content;
        this.timestamp = timestamp;
        this.formatTime = formatTime;
    }

    public Message(int conversation_id, int sender_id, String content, Date timestamp, String formatTime) {
        this.conversation_id = conversation_id;
        this.sender_id = sender_id;
        this.content = content;
        this.timestamp = timestamp;
        this.formatTime = formatTime;
    }

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public int getConversation_id() {
        return conversation_id;
    }

    public void setConversation_id(int conversation_id) {
        this.conversation_id = conversation_id;
    }

    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getFormatTime() {
        return formatTime;
    }

    public void setFormatTime(Date timestamp) {
        if (timestamp != null) {
            SimpleDateFormat formatter;
            LocalDate currentDate = LocalDate.now();
            SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
            String formattedComDate = formatter2.format(timestamp);
            // Nếu ngày nhận trùng với ngày hiện tại
            if (formattedComDate.equalsIgnoreCase(currentDate.toString())) {
                formatter = new SimpleDateFormat("HH:mm");
            } else {
                formatter = new SimpleDateFormat("dd MMM");
            }
            this.formatTime = formatter.format(timestamp);
        } else {
            // Xử lý nếu complete_date là null
            this.formatTime = ""; // hoặc một giá trị mặc định khác tùy ý của bạn
        }
    }
     
    
    
    
}
