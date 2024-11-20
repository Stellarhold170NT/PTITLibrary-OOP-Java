/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import redis.clients.jedis.Jedis;
import ptit.library.model.Book;
import ptit.library.model.Student;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 *
 * @author Admin
 */
public class CacheController {
    private static final int PAGE_SIZE = 20;
//    private static Jedis jedis = new Jedis("localhost", 6379); 
    
    private static JedisPool jedisPool;

    static {
        // Cấu hình cho JedisPool
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(50);  // Số kết nối tối đa
        config.setMaxIdle(10);  // Số kết nối nhàn rỗi tối đa
        config.setMinIdle(1);   // Số kết nối nhàn rỗi tối thiểu
        config.setMaxWaitMillis(10000);  // Thời gian chờ tối đa

        // Tạo pool kết nối
        jedisPool = new JedisPool(config, "localhost", 6379);
    }

    public static Jedis getJedis() {
        return jedisPool.getResource();
    }

    public static void storeStudentData() {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            List<Student> students = StudentDAO.getData();

            jedis.flushAll();

            for (Student student : students) {
                String studentKey = "student:" + student.getStudent_code();
                jedis.hset(studentKey, "student_code", student.getStudent_code());
                jedis.hset(studentKey, "student_code", student.getStudent_code());
                jedis.hset(studentKey, "full_name", student.getFull_name());
                jedis.hset(studentKey, "enrollment_year", student.getEnrollment_year().toString());
                jedis.hset(studentKey, "major", student.getMajor());
                jedis.hset(studentKey, "gpa", student.getGpa().toString());
                jedis.hset(studentKey, "online", String.valueOf(false));

                jedis.rpush("student_list", studentKey);
            }

            System.out.println("Lưu trữ thông tin sinh viên thành công");
        }
        catch (Exception e) {
            e.printStackTrace();
        } finally { 
            if (jedis != null) {
                jedis.close();
            }
        }
        System.out.println("KẾT THÚC LƯU TRỮ");
    }
    
    public static void updateStudentOnline(String id, boolean online) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.hset("student:" + id, "online", String.valueOf(online)); 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
    }
    
    
//    public static Map<String, String> getStudentInfo(String id) {
//        Jedis jedis = null;
//        
//        return jedis.hgetAll("student:" + id);
//    }
    
    public static List<Map<String, String>> getListStudent(int page) {

        Jedis jedis = null;
        try {
            jedis = getJedis();
            int start = (page - 1) * PAGE_SIZE;  // Vị trí bắt đầu
            int end = start + PAGE_SIZE - 1;  // Vị trí kết thúc
            List<String> studentKeys = (List<String>) jedis.lrange("student_list", start, end);
            List<Map<String, String>> studentsInfo = new ArrayList<>();

            for (String studentKey : studentKeys) {
                Map<String, String> studentData = jedis.hgetAll(studentKey);
                studentsInfo.add(studentData);
            }

            return studentsInfo;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        
        return new ArrayList<>();
    }
    
    public static long getStudentListSize() {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.llen("student_list");
        }
        catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return 0;
    }
}
