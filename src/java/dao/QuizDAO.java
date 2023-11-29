/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chapter;
import model.Question;
import model.Quiz;
import model.Subject;

/**
 *
 * @author Admin
 */
public class QuizDAO extends BaseDAO {

    public ArrayList<Quiz> getQuizzesBySubject(int subjectId, int chapterId) {
        String sql = "SELECT q.quiz_id, q.quiz_name, q.total_questions, s.subject_name, c.title chapter_name "
                + "FROM quiz q "
                + "JOIN subject s ON s.id = q.subject_id "
                + "LEFT JOIN chapter c ON c.chapter_id = q.chapter_id "
                + "WHERE q.subject_id = ?";

        if (chapterId != 0) {
            sql += "AND q.chapter_id = ?";
        }

        ArrayList<Quiz> quizList = new ArrayList<>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subjectId);
            if (chapterId != 0) {
                stmt.setInt(2, chapterId);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setTotal_questions(rs.getInt("total_questions"));
                s.setName(rs.getString("name"));
                c.setTitle(rs.getString("title"));
                quizList.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return quizList;
    }

    public ArrayList<Quiz> searchQuizzes(int subjectId, String name, int chapterId) {
        String sql = "SELECT q.quiz_id, q.quiz_name, q.total_questions, s.subject_name, c.title chapter_name "
                + "FROM quiz q "
                + "JOIN subject s ON s.id = q.subject_id "
                + "LEFT JOIN chapter c ON c.chapter_id = q.chapter_id "
                + "WHERE q.subject_id = ? AND q.quiz_name LIKE ?";

        if (chapterId != 0) {
            sql += " AND q.chapter_id = ?";
        }

        ArrayList<Quiz> quizList = new ArrayList<>();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subjectId);
            stmt.setString(2, "%" + name + "%");
            if (chapterId != 0) {
                stmt.setInt(3, chapterId);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setTotal_questions(rs.getInt("total_questions"));
                s.setName(rs.getString("name"));
                c.setTitle(rs.getString("title"));
                quizList.add(q);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return quizList;
    }

    public ArrayList<Quiz> getAllQuizzes() {
        ArrayList<Quiz> quizList = new ArrayList<>();
        String sql = "SELECT q.quiz_id, q.quiz_name, q.total_questions, q.is_active, s.id, s.subject_code, c.title chapter_name, c.chapter_id FROM quiz q JOIN subject s ON s.id = q.subject_id LEFT JOIN chapter c ON c.chapter_id = q.chapter_id ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setTotal_questions(rs.getInt("total_questions"));
                q.setIs_active(rs.getInt("is_active"));
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("subject_code"));
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("chapter_name"));
                q.setSubject(s);
                q.setChapter(c);
                quizList.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizList;
    }

    public ArrayList<Quiz> getQuizByPage(ArrayList<Quiz> quizList, int start, int end) {
        ArrayList<Quiz> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(quizList.get(i));
        }
        return arr;
    }

    public ArrayList<Quiz> searchQuiz(String searchContent, String subject, String chapter) {
        ArrayList<Quiz> quizList = new ArrayList<>();
        String sql = "SELECT * FROM quiz q "
                + "JOIN subject s ON s.id = q.subject_id "
                + "LEFT JOIN chapter c ON c.chapter_id = q.chapter_id\n"
                + "where q.quiz_name like ? and q.subject_id like ? and q.chapter_id like ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchContent + "%");
            st.setString(2, "%" + subject + "%");
            st.setString(3, "%" + chapter + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                q.setTotal_questions(rs.getInt("total_questions"));
                s.setId(rs.getInt("id"));
                s.setCode(rs.getString("subject_code"));
                c.setChapter_id(rs.getInt("chapter_id"));
                c.setTitle(rs.getString("title"));
                q.setSubject(s);
                q.setChapter(c);
                quizList.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return quizList;
    }

    public void deleteQuizByID(String quizID) {
        String sql = "DELETE FROM quiz_question WHERE (`quiz_id` = '" + quizID + "');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        sql = "DELETE FROM quiz WHERE (`quiz_id` = '" + quizID + "');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Quiz getQuiz(String getBy, String value) {
        String sql = "SELECT q.quiz_id, q.quiz_name,q.subject_id, q.chapter_id, q.total_questions, \n"
                + "q.is_active, q.created_by, q.created_at, q.updated_by, q.updated_at \n"
                + "from quiz q \n"
                + "where " + getBy + " = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, value);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                Subject s = new Subject();
                Chapter c = new Chapter();
                q.setQuiz_id(rs.getInt("quiz_id"));
                q.setQuiz_name(rs.getString("quiz_name"));
                s.setId(rs.getInt("subject_id"));
                c.setChapter_id(rs.getInt("chapter_id"));
                q.setTotal_questions(rs.getInt("total_questions"));
                q.setIs_active(rs.getInt("is_active"));
                q.setCreated_by(rs.getInt("created_by"));
                q.setCreated_at(rs.getString("created_at"));
                q.setUpdated_by(rs.getInt("updated_by"));
                q.setUpdated_at(rs.getString("updated_at"));
                q.setSubject(s);
                q.setChapter(c);
                return q;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void activeAndDeactive(Quiz quiz) {
        String sql = "UPDATE quiz SET  \n"
                + "`is_active`=?,`updated_by`=?,`updated_at`=NOW()"
                + "where quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz.getIs_active());
            st.setInt(2, quiz.getUpdated_by());
            st.setInt(3, quiz.getQuiz_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addQuiz(Quiz quiz) {
        String sql = "INSERT INTO quiz\n"
                + "(`quiz_name`,`subject_id`,`chapter_id`,`total_questions`,`is_active`,`created_by`,`created_at`)\n"
                + "VALUES(?, ?, ?, ?, ?, ?, NOW())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quiz.getQuiz_name());
            st.setInt(2, quiz.getSubject().getId());
            st.setInt(3, quiz.getChapter().getChapter_id());
            st.setInt(4, quiz.getTotal_questions());
            st.setInt(5, quiz.getIs_active());
            st.setInt(6, quiz.getCreated_by());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getSubjectName(String subjectId) {
        String sql = "select subject_name \n"
                + "from subject\n"
                + "where subject.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, subjectId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("subject_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public String getChapterName(String chapterId) {
        String sql = "select title \n"
                + "from chapter\n"
                + "where chapter_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, chapterId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("title");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void updateQuiz(Quiz quiz) {
        String sql = "UPDATE quiz SET  \n"
                + "`quiz_name`=?,`total_questions`=?,"
                + "`updated_by`=?,`updated_at`=NOW() "
                + "where quiz_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quiz.getQuiz_name());
            st.setInt(2, quiz.getTotal_questions());
            st.setInt(3, quiz.getUpdated_by());
            st.setInt(4, quiz.getQuiz_id());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Question> getQuestionsByQuiz(String quizId) {
        ArrayList<Question> questionList = new ArrayList<>();
        String sql = "SELECT q.question_id, q.question_content \n"
                + "FROM question q INNER JOIN quiz_question qq \n"
                + "ON qq.question_id = q.question_id \n"
                + "WHERE q.is_active = 1 AND qq.quiz_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, quizId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("question_id");
                String content = rs.getString("question_content");
                Question ques = new Question();
                ques.setId(id);
                ques.setQuestionContent(content);
                questionList.add(ques);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionList;
    }

    public void deleteQuesByID(String quesId, String quizId) {
        String sql = "DELETE FROM quiz_question WHERE (`question_id` = '" + quesId + "') AND `quiz_id` = '" + quizId + "';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateTotal(String quizId) {
        String sql = "UPDATE quiz SET total_questions = total_questions - 1 where quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, quizId);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ArrayList<Question> getQuestionToAdd(Quiz quiz) {
        ArrayList<Question> questionListToAdd = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM question q\n"
                + "WHERE question_id NOT IN (\n"
                + "    SELECT question_id\n"
                + "    FROM quiz_question\n"
                + "    WHERE quiz_id = ?\n"
                + ") And q.subject_id = ? And q.chapter_id = ? And q.is_active = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz.getQuiz_id());
            ps.setInt(2, quiz.getSubject().getId());
            ps.setInt(3, quiz.getChapter().getChapter_id());
            ps.setInt(4, 1);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("question_id");
                String content = rs.getString("question_content");
                Question ques = new Question();
                ques.setId(id);
                ques.setQuestionContent(content);
                questionListToAdd.add(ques);
            }
            return questionListToAdd;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addQuestionToQuiz(String quizId, ArrayList<Integer> listQuestionId, int isFixed) {
        try {
            for (int i = 0; i < listQuestionId.size(); i++) {
                String sql = "INSERT INTO quiz_question (quiz_id, question_id)\n"
                        + "SELECT * FROM (SELECT " + quizId + " AS quiz_id, " + listQuestionId.get(i) + " AS question_id) AS temp\n"
                        + "WHERE NOT EXISTS (\n"
                        + "    SELECT * FROM group6_lms.quiz_question\n"
                        + "    WHERE quiz_id = " + quizId + " AND question_id = " + listQuestionId.get(i) + "\n"
                        + ");";

                PreparedStatement st = connection.prepareStatement(sql);
                st.executeUpdate();
            }

            if (isFixed != 0) {
                String sql = "UPDATE quiz SET total_questions = total_questions + ? WHERE quiz_id = ?";

                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, listQuestionId.size()); // tăng lên số câu hỏi đã thêm
                stmt.setString(2, quizId);

                stmt.executeUpdate();
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int getNewQuizID() {
        String sql = "SELECT  quiz_id FROM quiz\n"
                + "ORDER BY quiz_id DESC \n"
                + "LIMIT 1;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quiz_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public ArrayList<Integer> geAllQuestionIdByChapterSubject(Quiz quiz) {
        ArrayList<Integer> questionIdList = new ArrayList<>();
        String sql = "SELECT question_id FROM group6_lms.question\n"
                + "WHERE subject_id = ? And chapter_id = ? AND is_active = 1;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz.getSubject().getId());
            ps.setInt(2, quiz.getChapter().getChapter_id());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("question_id");
                questionIdList.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionIdList;
    }
}
