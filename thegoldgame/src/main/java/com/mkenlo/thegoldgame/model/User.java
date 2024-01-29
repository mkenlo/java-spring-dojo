package com.mkenlo.thegoldgame.model;

import java.util.ArrayList;

public class User {

    private int totalGold;
    ArrayList<Activity> activities;

    public User() {
        this.totalGold = 0;
        this.activities = new ArrayList<>();
    }

    public void addActivity(Activity activity) {
        this.activities.add(activity);
    }

    public void addGold(int gold) {
        this.totalGold += gold;
    }

    public int getTotalGold() {
        return totalGold;
    }

    public ArrayList<Activity> getActivities() {
        return activities;
    }

    

}
