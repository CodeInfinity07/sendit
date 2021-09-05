package com.liteafrica.sendit.Alarm;

/**
 * Created by parag on 13/09/17.
 */

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

import static androidx.legacy.content.WakefulBroadcastReceiver.startWakefulService;

/**
 * Created by sonu on 09/04/17.
 */

public class AlarmReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            context.startForegroundService(new Intent(context, AlarmSoundService.class));
        } else {
            context.startService(new Intent(context, AlarmSoundService.class));
        }

        ComponentName comp = new ComponentName(context.getPackageName(),
                AlarmNotificationService.class.getName());
        startWakefulService(context, (intent.setComponent(comp)));

    }


}
