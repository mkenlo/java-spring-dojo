package com.mkenlo.thegoldgame.controller;

import java.text.SimpleDateFormat;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mkenlo.thegoldgame.model.Activity;
import com.mkenlo.thegoldgame.model.ActivityType;
import com.mkenlo.thegoldgame.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    User user;

    public HomeController() {
        this.user = new User();
    }

    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }

    @PostMapping("/find")
    public String findGold(ActivityType activityType, HttpSession session) {

        if (session.getAttribute("user") == null) {
            session.setAttribute("user", user);
        }
        Activity activity = new Activity(activityType.getName());

        int earnings = generateNum(activityType.getMinGold(), activityType.getMaxGold());

        if (activityType.getName().equalsIgnoreCase("quest")) {
            Random random = new Random();
            activity.setIsCompleted(random.nextBoolean());
        }
        if (activity.getIsCompleted())
            user.addGold(earnings);
        else
            user.addGold(-1 * earnings);

        activity.setEarnings(earnings);
        activity.setSummary(createSummary(activity));

        user.addActivity(activity);
        session.setAttribute("user", user);

        return "redirect:/";
    }

    private int generateNum(int minimum, int maximum) {
        Random random = new Random();
        int n = random.nextInt(maximum + 1);
        while (n < minimum)
            n = random.nextInt(maximum + 1);

        return n;
    }

    private String createSummary(Activity activity) {

        String verb1 = activity.getType().equalsIgnoreCase("quest") ? "completed" : "entered";
        String verb2 = activity.getIsCompleted() ? "earned" : "lost";

        if (activity.getType().equalsIgnoreCase("quest") && !activity.getIsCompleted()) {
            verb1 = "failed";
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEEEEE, MMM D, Y h:m a");
        String date = dateFormat.format(activity.getCompletedDate());

        return String.format("You %s a %s and %s %d gold. (%s)", verb1, activity.getType(), verb2,
                activity.getEarnings(),
                date);
    }

}
