package com.liteafrica.sendit.Utils;

import android.app.Activity;
import android.view.View;
import android.widget.TextView;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.Marker;
import com.liteafrica.sendit.R;


/**
 * Created by parag on 03/02/18.
 */

public class Marker_custom_infowindow implements GoogleMap.InfoWindowAdapter {

    private Activity context;

    public Marker_custom_infowindow(Activity context) {
        this.context = context;
    }

    @Override
    public View getInfoWindow(Marker marker) {
        View view = context.getLayoutInflater().inflate(R.layout.infowindow, null);

        TextView tvTitle = view.findViewById(R.id.info);
        tvTitle.setText(marker.getTitle());

        return view;
    }

    @Override
    public View getInfoContents(Marker marker) {

        return null;
    }
}
