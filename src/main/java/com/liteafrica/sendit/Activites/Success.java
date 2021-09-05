package com.liteafrica.sendit.Activites;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

import com.google.android.material.snackbar.Snackbar;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.liteafrica.sendit.Requests.Tabs_past_future_ride;
import com.liteafrica.sendit.delivery.DrivermapApp;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.util.HashMap;

import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;



public class Success extends AppCompatActivity implements View.OnClickListener {


    private PrefManager pref;
    private String _PhoneNo;
    private DatabaseReference mDatabase;
    private float rate = 0.0f;
    private double My_lat = 0, My_long = 0;
    private Toolbar toolbar;
    private Button Stop;
    private TextView S1, S2;
    private TextView _bill_generated;
    private ProgressBar _p1;
    DecimalFormat df = new DecimalFormat("0.00");
    private String _Name;
    private CoordinatorLayout coordinatorLayout;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.success);
        _bill_generated = findViewById(R.id.bill_generated);
        coordinatorLayout = findViewById(R.id.cor);

        Stop = findViewById(R.id.success_ride);
        Stop.setOnClickListener(this);
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _PhoneNo = user.get(PrefManager.KEY_MOBILE);
        S1 = findViewById(R.id.s1);
        S2 = findViewById(R.id.s2);

            S1.setText("Order");
            S2.setText(" delievered");

        pref.set_ride(0);
        pref.set_cID(0);
        pref.packagesharedPreferences(null);
        pref.setPickAt1(null);
        pref.setDropAt1(null);
        pref.set_food_money(0);
        pref.set_food_items(0);
        pref.setPickLat1(null);
        pref.setPickLong1(null);
        pref.setCanteen(null);
        pref.setcName(null);
        pref.setcPhoto(null);
        pref.setcAddress(null);
        pref.setcDiscount(0);
        pref.setcPackaging(0);
        pref.setcLess(null);
        pref.setcMore(null);
        pref.setDelivery(0);
        pref.setGoTRide(0);
        toolbar = findViewById(R.id.toolbar_success);
        _p1=findViewById(R.id.progressBar3_last);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        Intent i = getIntent();
        My_lat = i.getDoubleExtra("mylat", 0);
        My_long = i.getDoubleExtra("mylong", 0);
        mDatabase = FirebaseDatabase.getInstance().getReference();
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Success.this, Splash_screen.class);
                i.putExtra("my_lat", My_lat);
                i.putExtra("my_long", My_long);
                startActivity(i);
                finish();
                 overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });
    }

    @Override
    protected void onPause() {
        super.onPause();

    }

    @Override
    protected void onDestroy() {

        super.onDestroy();
    }

    @Override
    protected void onResume() {
        super.onResume();
            if (pref.getCon() != null) {
                new GetRide().execute();
            }


    }


    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.success_ride:
                if (!Success.this.isFinishing()) {
                    if(pref.getResposibility()==1) {
                    new AlertDialog.Builder(Success.this, R.style.AlertDialogTheme)
                            .setIcon(R.mipmap.ic_launcher)
                            .setTitle("Thank you")
                            .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                        Intent i = new Intent(Success.this, Splash_screen.class);
                                        startActivity(i);
                                        finish();
                                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                                    dialog.cancel();
                                }
                            })
                            .show();
                }else{
                        new AlertDialog.Builder(Success.this, R.style.AlertDialogTheme)
                                .setIcon(R.mipmap.ic_launcher)
                                .setTitle("Order is delivered.")
                                .setMessage("Thank you.")
                                .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        new PostBookdata().execute();


                                        dialog.cancel();
                                    }
                                })
                                .show();
                    }
                }

                break;
            default:
                break;
        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();

    }

    private class PostBookdata  extends AsyncTask<Void, Integer, String> {


        private boolean success;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        protected String doInBackground(Void... args) {
            return uploadFile();
        }

        private String uploadFile() {
            // TODO Auto-generated method stub
            String res = null;

            try {

                RequestBody requestBody = new MultipartBody.Builder()
                        .setType(MultipartBody.FORM)
                        .addFormDataPart("mobile", _PhoneNo)
                        .addFormDataPart("User", pref.getUserMobile())
                        .addFormDataPart("OTP",pref.getOrder())
                        .build();

                Request request = new Request.Builder()
                        .url(Config_URL.STOP_RIDE)
                        .post(requestBody)
                        .build();
                OkHttpClient client = new OkHttpClient();
                okhttp3.Response response = client.newCall(request).execute();
                if (response.body() != null) {
                    res = response.body().string();
                    String[] pars = res.split("error");
                    success = pars[1].contains("false");
                }

                Log.e("TAG", "Response : " + res);

                return res;

            } catch (UnknownHostException | UnsupportedEncodingException e) {
                Log.e("TAG", "Error: " + e.getLocalizedMessage());
            } catch (Exception e) {
                Log.e("TAG", "Other Error: " + e.getLocalizedMessage());
                success=false;
            }


            return res;

        }

        protected void onPostExecute(String file_url) {
            if (success) {
                if (pref.getCon() != null ) {
                    mDatabase.child("sendit").child(pref.getCon()).child("ask").setValue("6");
                   // mDatabase.child("sendit").child(pref.getCon()).removeValue();
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("Ride").removeValue();
                    pref.setCon(null);
                    pref.setUserMobile(null);
                    pref.setOrder(null);
                    pref.setisRunning(0);
                    if(pref.getResposibility()==2) {
                        Intent i = new Intent(Success.this, Splash_screen.class);
                        startActivity(i);
                        finish();
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    } else if(pref.getResposibility()==3) {
                        Intent i = new Intent(Success.this, Tabs_past_future_ride.class);
                        startActivity(i);
                        finish();
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }
                } else {
                    Snackbar.make(coordinatorLayout, "Error!Please try again", Snackbar.LENGTH_LONG).show();

                }

            }
        }
    }
    private class GetRide extends AsyncTask<Void, Integer, String> {

        private String Cost;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            _p1.setVisibility(View.VISIBLE);
        }

        protected String doInBackground(Void... args) {
            return uploadFile();
        }

        private String uploadFile() {
            // TODO Auto-generated method stub
            String res = null;

            try {


                RequestBody requestBody = new MultipartBody.Builder()
                        .setType(MultipartBody.FORM)
                        .addFormDataPart("_mId", _PhoneNo)
                        .addFormDataPart("Unique_Ride_Code", pref.getUniqueRide())
                        .build();

                Request request = new Request.Builder()
                        .url(Config_URL.GET_DETAILS_RIDES)
                        .post(requestBody)
                        .build();
                OkHttpClient client = new OkHttpClient();
                okhttp3.Response response = client.newCall(request).execute();
                res = response.body().string();
                Log.w("delivered", res);
                try {
                    JSONObject jsonObj = new JSONObject(res);

                    JSONArray ride = jsonObj.getJSONArray("Book_Ride_Now");
                    for (int i = 0; i < ride.length(); i++) {
                        JSONObject c = ride.getJSONObject(i);
                        if (!c.isNull("Cost")) {
                            Cost = String.valueOf(df.format(c.getDouble("Cost")));
                             }
                    }



                } catch (final JSONException e) {
                    Log.e("TAG", "Error: " + e.getLocalizedMessage());
                }

                Log.e("TAG", "Response : " + res);

                return res;

            } catch (UnknownHostException | UnsupportedEncodingException e) {
                Log.e("TAG", "Error: " + e.getLocalizedMessage());
            } catch (Exception e) {
                Log.e("TAG", "Other Error: " + e.getLocalizedMessage());
               // new GetRide().execute();
            }


            return res;

        }

        protected void onPostExecute(String file_url) {
            _p1.setVisibility(View.GONE);
            _bill_generated.setText(Cost);
        }

    }


}
