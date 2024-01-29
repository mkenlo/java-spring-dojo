package com.mkenlo.thegoldgame.model;

import java.util.Date;

public class Activity {
    private int earnings;
    private String type;
    private boolean isCompleted;
    private Date completedDate;
    private String summary;

    public Activity(String type) {
        this.type = type;
        this.isCompleted = true;
        this.completedDate = new Date();
        this.summary = "";
    }

    /**
     * @return int return the earnings
     */
    public int getEarnings() {
        return earnings;
    }

    /**
     * @param earnings the earnings to set
     */
    public void setEarnings(int earnings) {
        this.earnings = earnings;
    }

    /**
     * @return String return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    public boolean getIsCompleted() {
        return isCompleted;
    }

    /**
     * @param isCompleted the isCompleted to set
     */
    public void setIsCompleted(boolean isCompleted) {
        this.isCompleted = isCompleted;
    }

    /**
     * @return Date return the completedDate
     */
    public Date getCompletedDate() {
        return completedDate;
    }

    /**
     * @param completedDate the completedDate to set
     */
    public void setCompletedDate(Date completedDate) {
        this.completedDate = completedDate;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

}
