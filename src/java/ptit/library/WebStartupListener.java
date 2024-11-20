/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import ptit.library.controller.CacheController;

/**
 *
 * @author Admin
 */
public class WebStartupListener implements  ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContextListener.super.contextDestroyed(sce); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("SERVER TOMCAT KHỞI TẠO");
        CacheController.storeStudentData();
       
    }
    
    
}
