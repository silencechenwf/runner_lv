package com.chinasofti.pojo;

public class Memory_comment {
    private Integer memoryCommentId;

    private Integer memoryId;

    private String commentator;

    private String commented;

    private String content;

    private String time;

    public Integer getMemoryCommentId() {
        return memoryCommentId;
    }

    public void setMemoryCommentId(Integer memoryCommentId) {
        this.memoryCommentId = memoryCommentId;
    }

    public Integer getMemoryId() {
        return memoryId;
    }

    public void setMemoryId(Integer memoryId) {
        this.memoryId = memoryId;
    }

    public String getCommentator() {
        return commentator;
    }

    public void setCommentator(String commentator) {
        this.commentator = commentator == null ? null : commentator.trim();
    }

    public String getCommented() {
        return commented;
    }

    public void setCommented(String commented) {
        this.commented = commented == null ? null : commented.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }
}