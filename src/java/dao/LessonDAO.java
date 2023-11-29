/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import model.Lesson;

/**
 *
 * @author dangn
 */
public class LessonDAO extends BaseDAO {

    public ArrayList<Lesson> getLesList() {
        ArrayList<Lesson> lessonList = new ArrayList<>();
        String sql = "select * from group6_lms.Lesson";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setChapter_id(rs.getInt("chapter_id"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setTitle(rs.getString("title"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                lessonList.add(lesson);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lessonList;
    }

    public ArrayList<Lesson> getLessonByPage(ArrayList<Lesson> list, int start, int end) {
        ArrayList<Lesson> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void addLesson(String title, int chapter_id, int is_active, String description, String video_link, String file_attached, String subject_code, int linked_quiz, int lesson_type) {
        String sql = "insert into lesson(title,chapter_id,is_active,description,video_link,file_attached,subject_code,created_at,linked_quiz,lesson_type)\n"
                + "VALUES(?,?,?,?,?,?,?,NOW());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setInt(2, chapter_id);
            st.setInt(3, is_active);
            st.setString(4, description);
            st.setString(5, video_link);
            st.setString(6, file_attached);
            st.setString(7, subject_code);
            st.setInt(8, linked_quiz);
            st.setInt(9, lesson_type);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteLesson(String lesson_id) {
        String sql = "DELETE FROM Lesson\n"
                + "WHERE lesson_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lesson_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Lesson> searchLesson(String searchQuery, String title, String chapter) {
        ArrayList<Lesson> lessonList = new ArrayList<>();
        String sql = "select l.*,s.subject_code,s.subject_name"
                + " from lesson l join subject s on l.subject_code = s.subject_code\n"
                + "where l.title like ? and q.chapter like ? and l.lesson_type like ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchQuery + "%");
            st.setString(2, "%" + title + "%");
            st.setString(3, "%" + chapter + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lesson q = new Lesson();
                q.setLesson_id(rs.getInt("lesson_id"));
                q.setSubject_code(rs.getString("subject_code"));
                q.setTitle(rs.getString("title"));
                q.setChapter_id(rs.getInt("chapter_id"));
                q.setIs_active(rs.getInt("is_active"));
                q.setDescription(rs.getString("description"));
                q.setVideo_link(rs.getString("video_link"));
                q.setLinked_quiz(rs.getInt("linked_quiz"));
                q.setLesson_type(rs.getInt("lesson_type"));
                q.setFile_attached(rs.getString("file_attached"));
                lessonList.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessonList;
    }

    public Lesson getLessonByID(String lesson_id) {
        ResultSet rs;
        String sql = "select * from group6_lms.Lesson"
                + "\nwhere lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lesson_id);
            rs = st.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLesson_id(rs.getInt("lesson_id"));
                lesson.setChapter_id(rs.getInt("chapter_id"));
                lesson.setIs_active(rs.getInt("is_active"));
                lesson.setTitle(rs.getString("title"));
                lesson.setDescription(rs.getString("description"));
                lesson.setVideo_link(rs.getString("video_link"));
                lesson.setFile_attached(rs.getString("file_attached"));
                lesson.setLesson_type(Integer.parseInt(rs.getString("lesson_type")));
                lesson.setCreated_at(rs.getString("created_at"));
                lesson.setCreated_by(rs.getInt("created_by"));
                lesson.setUpdated_by(rs.getInt("updated_by"));
                lesson.setUpdated_at(rs.getString("updated_at"));
                return lesson;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        LessonDAO l = new LessonDAO();
        System.out.println(l.getLessonByID("1"));
    }
}
