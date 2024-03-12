/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import models.*;
import context.DBContext;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class ConversationDAO extends DBContext {

    public void insertConversation(Conversation conversation) {
        String sql = "INSERT INTO conversation (conversation_id, name, typeConversationId) VALUES (?, ?, ?)";
        try (Connection con = super.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, conversation.getConversation_id());
            st.setString(2, conversation.getName());
            st.setInt(3, conversation.getTypeConversationId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting conversation: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Conversation> GetAllGroupChats() {
        List<Conversation> list = new ArrayList<>();
        String sql = "select * from conversation where typeConversationId = 1 ";
        try (Connection con = super.getConnection(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Conversation c = new Conversation(rs.getInt("conversation_id"), rs.getString("name"), rs.getInt("typeConversationId"));
                list.add(c);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<EmployeeDTO> GetAllEmployeeinGroupChat(String searchParam) {
        String sql = "SELECT e.employee_id, e.name, COALESCE(d.name, 'None') AS departmentName\n"
                + "FROM employee e\n"
                + "LEFT JOIN employeedepartment ed ON e.employee_id = ed.employee_id\n"
                + "LEFT JOIN department d ON ed.department_id = d.department_id WHERE e.employee_id <> 1;";
        if (searchParam != null && !searchParam.isEmpty()) {
            sql += " AND LOWER(e.name) LIKE LOWER(?)";
        }
        List<EmployeeDTO> list = new ArrayList<>();
        try (Connection con = super.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            if (searchParam != null && !searchParam.isEmpty()) {
                st.setString(1, "%" + searchParam + "%");
            }
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    EmployeeDTO employeeDTO = new EmployeeDTO();
                    employeeDTO.setEmployeeId(rs.getInt("employee_id"));
                    employeeDTO.setName(rs.getString("name"));
                    employeeDTO.setDepartmentName(rs.getString("departmentName"));
                    list.add(employeeDTO);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public boolean namecontain(String para) {
        boolean containsTitle = false;
        try (Connection con = super.getConnection(); PreparedStatement st = con.prepareStatement("SELECT name FROM employee"); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                String title = rs.getString("name");
                if (title != null && para != null && title.toLowerCase().contains(para.toLowerCase())) {
                    containsTitle = true;
                    break;
                }
            }
        } catch (SQLException e) {
            // Ghi lại lỗi thay vì ném ngoại lệ
            System.err.println("Error while checking if title contains searchParam: " + e.getMessage());
            return false; // Trả về false nếu có lỗi xảy ra
        } catch (ClassNotFoundException e) {
            // Ghi lại lỗi thay vì ném ngoại lệ
            System.err.println("Database driver class not found: " + e.getMessage());
            return false; // Trả về false nếu có lỗi xảy ra
        }
        return containsTitle;
    }



    public void addEmtoConversation(int employeeId, int ConverId) {
        String sql = "INSERT INTO user_conversation (employee_id,conversation_id) VALUES (?, ?)";
        try (Connection con = super.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1,employeeId);
            st.setInt(2, ConverId); 
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting conversation: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<EmployeeDTO> GetAllEmployeeJoinedGroupChat(int ConverId) {
    String sql = "SELECT e.employee_id, e.name " +
                 "FROM employee e " +
                 "JOIN user_conversation u ON e.employee_id = u.employee_id " +
                 "WHERE u.conversation_id = ?";
    
    List<EmployeeDTO> list = new ArrayList<>();
    try (Connection con = super.getConnection();
         PreparedStatement st = con.prepareStatement(sql)) {
        st.setInt(1, ConverId);
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                EmployeeDTO employeeDTO = new EmployeeDTO();
                employeeDTO.setEmployeeId(rs.getInt("employee_id"));
                employeeDTO.setName(rs.getString("name"));
                list.add(employeeDTO);
            }
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    return list;
}


    public void insertMessage(int ConverId, int senderId, String message) {
        String sql = "INSERT INTO message (conversation_id, sender_id, content, timestamp) VALUES (?, ?, ?, ?)";
        try (Connection con = super.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, ConverId);
            st.setInt(2, senderId);
            st.setString(3, message);

            // Lấy thời gian hiện tại
            LocalDateTime currentTime = LocalDateTime.now();
            Timestamp timestamp = Timestamp.valueOf(currentTime);
            st.setTimestamp(4, timestamp);

            st.executeUpdate();
        } catch (ClassNotFoundException e) {
            // Xử lý ngoại lệ hoặc ném ra ngoài để lớp gọi xử lý
            throw new RuntimeException("Error inserting message: " + e.getMessage(), e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<MessageDTO> getAllMessagesInConversation() {
    String sql = "SELECT m.message_id, m.sender_id, m.content, e.name AS sender_name, m.timestamp " +
                 "FROM message m " +
                 "INNER JOIN employee e ON m.sender_id = e.employee_id"; // Thêm khoảng trắng vào câu truy vấn SQL
    
    List<MessageDTO> messageList = new ArrayList<>();
    
    try (Connection con = super.getConnection();
         PreparedStatement st = con.prepareStatement(sql)) {
        
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int messageId = rs.getInt("message_id");
                int senderId = rs.getInt("sender_id");
                String senderName = rs.getString("sender_name");
                String content = rs.getString("content");
                Date date= rs.getDate("timestamp"); // Sử dụng kiểu dữ liệu đúng cho timestamp
        
                
                MessageDTO m = new MessageDTO();
                m.setMessage_id(messageId);
                m.setSender_id(senderId);
                m.setSender(senderName);
                m.setContent(content);
                m.setFormatTime(date);             
                messageList.add(m);
            }
        }
    } catch (SQLException e) {
        System.out.println("Error getting messages from conversation: " + e.getMessage());
        // Xử lý ngoại lệ hoặc ném lại ngoại lệ
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    
    return messageList;
}
    public static void main(String[] args) {
        // Tạo một đối tượng của lớp ConversationDAO
        ConversationDAO conversationDAO = new ConversationDAO();

        // Gọi phương thức GetAllMessageinaConversation()
        List<MessageDTO> messageList = conversationDAO.getAllMessagesInConversation();

        // In ra thông tin của các tin nhắn trong danh sách
        for (MessageDTO message : messageList) {
            System.out.println("Message ID: " + message.getMessage_id());
            System.out.println("Sender ID: " + message.getSender_id());
            System.out.println("Sender Name: " + message.getSender());
            System.out.println("Content: " + message.getContent());
            System.out.println("Timestamp: " + message.getFormatTime());
            System.out.println("------------------------------------------");
        }
    }


  



}
