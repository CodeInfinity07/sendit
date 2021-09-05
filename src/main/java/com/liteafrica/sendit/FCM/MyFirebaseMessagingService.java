package com.liteafrica.sendit.FCM;

import android.app.AlarmManager;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.text.TextUtils;
import android.util.Log;

import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Mainactivity;
import com.liteafrica.sendit.Activites.Canteen.NotificationAll;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.Activites.Ride_Later.Ride_later_tabs;
import com.liteafrica.sendit.Activites.Splash_screen;
import com.liteafrica.sendit.Alarm.AlarmNotificationService;
import com.liteafrica.sendit.Alarm.AlarmReceiver;
import com.liteafrica.sendit.Alarm.AlarmSoundService;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.delivery.GetRide;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

/**
 * Created by parag on 06/02/17.
 */
public class MyFirebaseMessagingService extends FirebaseMessagingService implements MediaPlayer.OnPreparedListener{

    private static final String TAG = MyFirebaseMessagingService.class.getSimpleName();

    private NotificationUtils notificationUtils;
    private String imageUrl;
    private PrefManager pref;
    private String _phoneNo;
    private DatabaseReference mDatabase;
    private boolean _played;
    private PendingIntent pendingIntent;
    private static final int ALARM_REQUEST_CODE = 10009;

    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {
        Log.e(TAG, "From: " + remoteMessage.getFrom());

        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        _phoneNo=user.get(PrefManager.KEY_MOBILE);
        Intent alarmIntent = new Intent(getApplicationContext(), AlarmReceiver.class);
        pendingIntent = PendingIntent.getBroadcast(getApplicationContext(), ALARM_REQUEST_CODE, alarmIntent, 0);
        if (pendingIntent != null) {
            stopAlarmManager();
        }
        if (remoteMessage.getNotification() != null) {
            Log.e(TAG, "Notification Body: " + remoteMessage.getNotification().getBody());
            handleNotification(remoteMessage.getNotification().getBody());
        }

        // Check if message contains a data payload.
        if (remoteMessage.getData().size() > 0) {
            Log.e(TAG, "Data Payload: " + remoteMessage.getData().toString());

            try {
                JSONObject json = new JSONObject(remoteMessage.getData().toString());


                handleDataMessage(json);
            } catch (Exception e) {
                Log.e(TAG, "Exception: " + e.getMessage());
            }
        }
    }

    private void handleNotification(String message) {
        if (!NotificationUtils.isAppIsInBackground(getApplicationContext())) {
            // app is in foreground, broadcast the push message
            Intent pushNotification = new Intent(Config_URL.PUSH_NOTIFICATION);
            pushNotification.putExtra("message", message);
            LocalBroadcastManager.getInstance(this).sendBroadcast(pushNotification);

            // play notification sound
            NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
            notificationUtils.playNotificationSound();
        } else {
            // If the app is in background, firebase itself handles the notification
        }
    }

    private void handleDataMessage(JSONObject json) {
        Log.e(TAG, "push json: " + json.toString());

        try {
            JSONObject data = json.getJSONObject("data");

            String title = data.getString("title");
            String message = data.getString("message");
            String timestamp = data.getString("timestamp");
            if(!data.isNull("image")){
                if(!TextUtils.isEmpty(data.getString("image"))){
                    imageUrl = data.getString("image");
                }
            }
            if (!NotificationUtils.isAppIsInBackground(getApplicationContext())) {
                CustomNotification(title, message);

            } else {

                if (imageUrl==null && TextUtils.isEmpty(imageUrl)) {
                    CustomNotification(title, message);
                }else {
                    NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
                    notificationUtils.playNotificationSound();
                    Intent resultIntent = null;
                    if(pref.getResposibility()==1) {
                        if(message.contains("Order")){
                            resultIntent = new Intent(getApplicationContext(), Splash_screen.class);
                        }else {
                            resultIntent = new Intent(getApplicationContext(), Canteen_Mainactivity.class);
                        }
                        resultIntent.putExtra("message", message);
                        resultIntent.putExtra("reached", true);
                        resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    }else if(pref.getResposibility()==2) {
                        if(!_played) {
                            RegisterAlarmBroadcast();
                        }
                         resultIntent = new Intent(getApplicationContext(), Ride_later_tabs.class);
                        resultIntent.putExtra("message", message);
                        resultIntent.putExtra("reached", true);
                        resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    }
                    showNotificationMessageWithBigImage(getApplicationContext(), title, message, timestamp, resultIntent, imageUrl);
                    if(_phoneNo!=null) {
                        mDatabase = FirebaseDatabase.getInstance().getReference();
                        mDatabase.child("Push").child(_phoneNo).child("messgae").setValue(message);
                    }
                }


            }

        } catch (JSONException e) {
            Log.e(TAG, "Json Exception: " + e.getMessage());
        } catch (Exception e) {
            Log.e(TAG, "Exception: " + e.getMessage());
        }
    }

    public void CustomNotification(String title,String durationo) {
        NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
        notificationUtils.playNotificationSound();
        Intent resultIntent = null;
        if(pref.getResposibility()==1) {

            if(durationo.contains("Order")){
                resultIntent = new Intent(getApplicationContext(), Splash_screen.class);
            }else {
                resultIntent = new Intent(getApplicationContext(), Canteen_Mainactivity.class);
            }
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }else if(pref.getResposibility()==2) {
            if(!_played) {
                RegisterAlarmBroadcast();
            }
             resultIntent = new Intent(getApplicationContext(), Ride_later_tabs.class);
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }

        showNotificationMessage(getApplicationContext(), title, durationo, "00:00:00", resultIntent);
    }

    private void showNotificationMessage(Context context, String title, String message, String timeStamp, Intent intent) {
        NotificationUtils notificationUtils = new NotificationUtils(context);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        notificationUtils.showNotificationMessage(title, message, timeStamp, intent);
    }

    /**
     * Showing notification with text and image
     */
    private void showNotificationMessageWithBigImage(Context context, String title, String message, String timeStamp, Intent intent, String imageUrl) {
        notificationUtils = new NotificationUtils(context);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        notificationUtils.showNotificationMessage(title, message, timeStamp, intent, imageUrl);
    }

    private void RegisterAlarmBroadcast() {
        _played=true;
        triggerAlarmManager(System.currentTimeMillis());

    }
    public void onPrepared(MediaPlayer player) {
        player.start();
    }

    public void triggerAlarmManager(long alarmTriggerTime) {
        AlarmManager manager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);//get instance of alarm manager
        manager.set(AlarmManager.RTC_WAKEUP, (alarmTriggerTime), pendingIntent);
        //sst alarm manager with entered timer by converting into milliseconds
    }
    public void stopAlarmManager() {

        AlarmManager manager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
        if (manager != null) {
            manager.cancel(pendingIntent);
        }
        stopService(new Intent(getApplicationContext(), AlarmSoundService.class));
        NotificationManager notificationManager = (NotificationManager) this
                .getSystemService(Context.NOTIFICATION_SERVICE);
        if (notificationManager != null) {
            notificationManager.cancel(AlarmNotificationService.NOTIFICATION_ID);
        }

    }
}