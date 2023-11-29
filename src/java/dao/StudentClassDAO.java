/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Classs;
import model.Setting;

/**
 *
 * @author bao chau
 */
public class StudentClassDAO extends BaseDAO {

    public ArrayList<Classs> getMyClass(int userID) {
        ArrayList<Classs> classList = new ArrayList<>();
        String sql = "select class.id, class.semester_id, class.class_name, class.subject_id, subject.subject_code, class.trainer_id, user.fullname, setting.setting_value\n"
                + "from student_class join class on class.id = student_class.class_id \n"
                + "join subject on subject.id = class.subject_id \n"
                + "join user on user.id = class.trainer_id \n"
                + "join setting on setting.id = class.semester_id\n"
                + "where student_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs c = new Classs();
                c.setId(rs.getInt(1));
                c.setSemester_id(rs.getInt(2));
                c.setClass_name(rs.getString(3));
                c.setSubject_id(rs.getInt(4));
                c.setSubject_code(rs.getString(5));
                c.setTrainer_id(rs.getInt(6));
                c.setTrainer_name(rs.getString(7));
                c.setSemester_name(rs.getString(8));
                classList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classList;
    }

    public ArrayList<Setting> getMySemesterList(int userID) {
        ArrayList<Setting> semesterList = new ArrayList<>();
        String sql = "select distinct setting.id,setting.setting_value\n"
                + "from setting join class on class.semester_id = setting.id\n"
                + "join student_class on student_class.class_id= class.id\n"
                + "join user on user.id = student_class.student_id\n"
                + "where user.id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setId(rs.getInt(1));
                s.setSetting_value(rs.getString(2));
                semesterList.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return semesterList;
    }
    
    public ArrayList<Classs> getClassBySemester(int userID,int semesterID) {
        ArrayList<Classs> classList = new ArrayList<>();
        String sql = "select class.id, class.semester_id, class.class_name, class.subject_id, subject.subject_code, class.trainer_id, user.fullname, setting.setting_value\n"
                + "from student_class join class on class.id = student_class.class_id \n"
                + "join subject on subject.id = class.subject_id \n"
                + "join user on user.id = class.trainer_id \n"
                + "join setting on setting.id = class.semester_id\n"
                + "where student_id = ? and class.semester_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, semesterID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Classs c = new Classs();
                c.setId(rs.getInt(1));
                c.setSemester_id(rs.getInt(2));
                c.setClass_name(rs.getString(3));
                c.setSubject_id(rs.getInt(4));
                c.setSubject_code(rs.getString(5));
                c.setTrainer_id(rs.getInt(6));
                c.setTrainer_name(rs.getString(7));
                c.setSemester_name(rs.getString(8));
                classList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return classList;
    }

    public static void main(String[] args) {
        StudentClassDAO d = new StudentClassDAO();
        System.out.println(d.getMySemesterList(20).size());
    }
}
