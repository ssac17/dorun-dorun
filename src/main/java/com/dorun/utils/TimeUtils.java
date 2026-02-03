package com.dorun.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class TimeUtils {

    public static String formatRelativeTime(LocalDateTime dateTime) {
        LocalDateTime now = LocalDateTime.now();
        long diffTime = ChronoUnit.MINUTES.between(dateTime, now);

        if(diffTime < 1) {
            return "방금 전";
        }
        if(diffTime < 60) {
            return diffTime + "분 전";
        }
        if(diffTime < 60 * 24) {
            return (diffTime / 60) + "시간 전";
        }
        if(diffTime < 60 * 24 * 7) {
            return (diffTime / (60 * 24)) + "일 전";
        }
        //일주일 후에는 날짜 형식으로
        return dateTime.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
    }
}
