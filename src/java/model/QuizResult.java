/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bao chau
 */
public class QuizResult {

    private int result_id;
    private int user_id;
    private int quiz_id;
    private float score;
    private String completed_at;

    public QuizResult() {
    }

    public QuizResult(int result_id, int user_id, int quiz_id, float score, String completed_at) {
        this.result_id = result_id;
        this.user_id = user_id;
        this.quiz_id = quiz_id;
        this.score = score;
        this.completed_at = completed_at;
    }
     
    
    public int getResult_id() {
        return result_id;
    }

    public void setResult_id(int result_id) {
        this.result_id = result_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getCompleted_at() {
        return completed_at;
    }

    public void setCompleted_at(String completed_at) {
        this.completed_at = completed_at;
    }
    

    @Override
    public String toString() {
        return "QuizResult{" + "result_id=" + result_id + ", user_id=" + user_id + ", quiz_id=" + quiz_id + ", score=" + score + ", completed_at=" + completed_at + '}';
    }

}
