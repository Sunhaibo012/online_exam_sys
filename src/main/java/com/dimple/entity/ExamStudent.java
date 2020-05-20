package com.dimple.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 试卷和学生的关联表(ExamStudent)实体类
 *
 * @author makejava
 * @since 2019-05-01 11:39:01
 */
@Data
public class ExamStudent implements Serializable {
    private static final long serialVersionUID = -57626389942460266L;

    private Integer esId;
    //学生的id
    private Integer studentId;
    //试卷的id
    private Integer examId;
    //0表示未参加考试，1表示已经参加考试
    private String status;
    //是否已经阅卷
    private String reading;

    //最终成绩
    private Double totalScore;

    private String subname;

    private String subid;

    public void setEsId(Integer esId) {
        this.esId = esId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setReading(String reading) {
        this.reading = reading;
    }

    public void setTotalScore(Double totalScore) {
        this.totalScore = totalScore;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public void setSubid(String subid) {
        this.subid = subid;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getEsId() {
        return esId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public Integer getExamId() {
        return examId;
    }

    public String getStatus() {
        return status;
    }

    public String getReading() {
        return reading;
    }

    public Double getTotalScore() {
        return totalScore;
    }

    public String getSubname() {
        return subname;
    }

    public String getSubid() {
        return subid;
    }
}