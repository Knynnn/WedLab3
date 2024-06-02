package com.example.hongjsp;

import java.io.Serializable;
import java.sql.Timestamp;

public class ScoreRecord implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String userId;
    private int score;
    private Timestamp date;

    // 无参构造函数
    public ScoreRecord() {
    }

    // 带参构造函数
    public ScoreRecord(String userId, int score) {
        this.userId = userId;
        this.score = score;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
