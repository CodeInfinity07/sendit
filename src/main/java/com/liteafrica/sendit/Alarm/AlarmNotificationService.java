package com.liteafrica.sendit.Alarm;

/**
 * Created by parag on 13/09/17.
 */

import android.app.IntentService;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

import androidx.core.app.NotificationCompat;

import com.liteafrica.sendit.R;
import com.liteafrica.sendit.delivery.GetRide;


/**
 * Created by sonu on 10/04/17.
 */

public class AlarmNotificationService extends IntentService {
    private NotificationManager alarmNotificationManager;

    //Notification ID for Alarm
    public static final int NOTIFICATION_ID = 1;

    public AlarmNotificationService() {
        super("AlarmNotificationService");
    }

    @Override
    public void onHandleIntent(Intent intent) {
        //Send notification
        //sendNotification("New ride!!");
    }




}