package com.parag.ShillongCab.Activites.Ride_Later;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;
import com.parag.ShillongCab.Adapters.Image_Adapter;
import com.parag.ShillongCab.AppController;
import com.parag.ShillongCab.Config_URL;
import com.parag.ShillongCab.Model.User;
import com.parag.ShillongCab.Place.RecyclerTouchListener;
import com.parag.ShillongCab.PrefManager;
import com.parag.ShillongCab.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by parag on 18/02/18.
 */

public class PastFragment extends Fragment {
    private ProgressBar progressBar;
    private RecyclerView laterRv;
    private ArrayList<User> mItems = new ArrayList<User>();
    private static final String TAG = PastFragment.class.getSimpleName();
    private PrefManager pref;
    private String _PhoneNo;
    private double My_lat = 0, My_long = 0;
    private TextView no_rides;

    public PastFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View V = inflater.inflate(R.layout.layout_past, container, false);
        pref = new PrefManager(getActivity());
        HashMap<String, String> user = pref.getUserDetails();
        _PhoneNo = user.get(PrefManager.KEY_MOBILE);
        laterRv = V.findViewById(R.id.pastRv);
        no_rides = V.findViewById(R.id.no_past);
        progressBar = V.findViewById(R.id.progressBarpast);
        return V;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);


    }

    @Override
    public void onResume() {
        super.onResume();
        mItems.clear();
        progressBar.setVisibility(View.VISIBLE);
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_PAST_RIDES,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d(TAG, response.toString());
                        progressBar.setVisibility(View.GONE);
                        try{
                            JSONObject jsonObj = new JSONObject(response);

                          JSONArray rides = jsonObj.getJSONArray("Book_Ride_Now");


                                for (int i = 0; i < rides.length(); i++) {
                                    JSONObject c = rides.getJSONObject(i);


                                    User item = new User();
                                    item.setDate(c.getString("Start_Date"));
                                    item.setTime(c.getString("Start_time"));
                                    item.setFrom(c.getString("From_Address"));
                                    item.setTo(c.getString("To_Address"));
                                    item.setSnapshot(c.getString("Map_Snapshot"));
                                    item.setCost(c.getString("Cost"));
                                    item.setUnique_id(c.getString("Unique_Ride_Code"));
                                    if (!c.isNull("Ride_Cancelled_by")) {
                                        item.setCancel_by(c.getInt("Ride_Cancelled_by"));
                                    }
                                    mItems.add(item);



                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                        go();
                    }



                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d(TAG, "Error: " + error.getMessage());


            }

        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("_mId", _PhoneNo);
                return params;
            }

        };

        // Añade la peticion a la cola
        AppController.getInstance().addToRequestQueue(eventoReq);
    }

    private void go() {
        progressBar.setVisibility(View.GONE);
        if (mItems.size() != 0) {
            laterRv.setVisibility(View.VISIBLE);
            no_rides.setVisibility(View.GONE);
            Image_Adapter sAdapter = new Image_Adapter(getActivity(), mItems);
            sAdapter.notifyDataSetChanged();
            sAdapter.setMobile(_PhoneNo);
            sAdapter.setMyLat(My_lat, My_long);
            laterRv.setAdapter(sAdapter);
            LinearLayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
            mLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
            laterRv.setLayoutManager(mLayoutManager);
            laterRv.addOnItemTouchListener(
                    new RecyclerTouchListener(getActivity(), laterRv,
                            new RecyclerTouchListener.OnTouchActionListener() {

                                @Override
                                public void onClick(View view, final int position) {

                                    if (mItems.size() != 0) {
                                        Intent i = new Intent(getActivity(), PastRides.class);
                                        i.putExtra("my_lat", My_lat);
                                        i.putExtra("my_long", My_long);
                                        i.putExtra("UNIQUEID", mItems.get(position).getUnique_id(position));
                                        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                                        i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                                        startActivity(i);

                                    }

                                }

                                @Override
                                public void onRightSwipe(View view, int position) {

                                }

                                @Override
                                public void onLeftSwipe(View view, int position) {

                                }
                            }));
        } else {
            laterRv.setVisibility(View.GONE);
            no_rides.setVisibility(View.VISIBLE);

        }
    }

}

