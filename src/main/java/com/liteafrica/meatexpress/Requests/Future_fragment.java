package com.parag.ShillongCab.Activites.Ride_Later;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;
import com.parag.ShillongCab.Adapters.Future_adapter;
import com.parag.ShillongCab.AppController;
import com.parag.ShillongCab.Config_URL;
import com.parag.ShillongCab.Model.User;
import com.parag.ShillongCab.PrefManager;
import com.parag.ShillongCab.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by parag on 27/01/18.
 */

public class Future_fragment extends Fragment {
    private ProgressBar progressBar;
    private RecyclerView laterRv;
    private ArrayList<User> mItems=new ArrayList<User>();
    private static final String TAG = Future_fragment.class.getSimpleName();
    private PrefManager pref;
    private String _PhoneNo;
    private double My_lat=0,My_long=0;
    private Button Datesadd;
    private TextView no_rides;

    public Future_fragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle args = getArguments();
        My_lat = args.getDouble("my_lat");
        My_long = args.getDouble("my_long");
        pref = new PrefManager(getContext());
        HashMap<String, String> user = pref.getUserDetails();
        _PhoneNo = user.get(PrefManager.KEY_MOBILE);

    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View V = inflater.inflate(R.layout.later_dates, container, false);
        laterRv=V.findViewById(R.id.laterRv);
        no_rides=V.findViewById(R.id.no_rides);
        progressBar = V.findViewById(R.id.progressBar21);
        progressBar.setVisibility(View.VISIBLE);
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_LATER_RIDES,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d(TAG, response.toString());
                        progressBar.setVisibility(View.GONE);
                        try{
                            JSONObject jsonObj = new JSONObject(response);
                            JSONArray Book_Ride_Now = jsonObj.getJSONArray("Book_Ride_Later");
                            for (int i = 0; i < Book_Ride_Now.length(); i++) {
                                JSONObject c = Book_Ride_Now.getJSONObject(i);
                                if (!c.isNull("Unique_Ride_Code")) {
                                    User item=new User();
                                    item.setDate(c.getString("Start_Date"));
                                    item.setTime(c.getString("Start_time"));
                                    item.setFrom(c.getString("From_Address"));
                                    item.setTo(c.getString("To_Address"));
                                    item.setOTP(c.getInt("OTP"));
                                    item.setUnique_id(c.getString("Unique_Ride_Code"));
                                    item.setTo_Lat(c.getDouble("To_Latitude"));
                                    item.setTo_Long(c.getDouble("To_Longitude"));
                                    mItems.add(item);
                                }

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
        Datesadd=V.findViewById(R.id.buttondates);
       
        return  V;
    }

    private void go() {
        progressBar.setVisibility(View.GONE);
        if (mItems.size() != 0) {
            laterRv.setVisibility(View.VISIBLE);
            no_rides.setVisibility(View.GONE);
            Future_adapter sAdapter = new Future_adapter(getActivity(), mItems);
            sAdapter.notifyDataSetChanged();
            sAdapter.setMobile(_PhoneNo);
            sAdapter.setMyLat(My_lat,My_long);
            laterRv.setAdapter(sAdapter);
            LinearLayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
            mLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
            laterRv.setLayoutManager(mLayoutManager);
        }else{
            laterRv.setVisibility(View.GONE);
            no_rides.setVisibility(View.VISIBLE);

        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);


    }
    @Override
    public void onResume() {
        super.onResume();
      
        Datesadd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent o = new Intent(getActivity(), Ride_later_address.class);
                o.putExtra("mylat", My_lat);
                o.putExtra("mylong", My_long);
                startActivity(o);
                getActivity().finish();

            }
        });
    }




}
