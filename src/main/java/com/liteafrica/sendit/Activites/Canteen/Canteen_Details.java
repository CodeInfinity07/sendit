package com.liteafrica.sendit.Activites.Canteen;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.widget.NestedScrollView;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.android.volley.toolbox.StringRequest;
import com.facebook.shimmer.ShimmerFrameLayout;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.material.snackbar.Snackbar;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.Activites.Splash_screen;
import com.liteafrica.sendit.Activites.Update_profile;
import com.liteafrica.sendit.Adapters.All_fragment_adapter;
import com.liteafrica.sendit.Adapters.NearAdapter;
import com.liteafrica.sendit.AppController;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.ConnectionDetector;
import com.liteafrica.sendit.Login.ServiceOffer;
import com.liteafrica.sendit.LruBitmapCache;
import com.liteafrica.sendit.Model.Eats;
import com.liteafrica.sendit.Model.Foods;
import com.liteafrica.sendit.Model._menu;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Canteen_Details extends AppCompatActivity implements View.OnClickListener  {

    Boolean isInternetPresent=false;
    private ConnectionDetector cd;
    private PrefManager pref;
    private double My_lat=0,My_long=0;
    private String _phoneNo;
    private ProgressBar progressBar;
    private CoordinatorLayout coordinatorLayout;
    private RecyclerView _moreRv;

    private boolean _collapsed=false;
    private NestedScrollView _nsScroll;
    private boolean _end=false;
    SimpleDateFormat simpleDateFormat =
            new SimpleDateFormat("yyy-MM-dd");
    private int hour;
    private int total=0;
    private boolean isLoading=false;
    private boolean _first=false;
    private Handler handler;
    public static final int PAGE_START = 1;
    private int currentPage = PAGE_START;
    private boolean isLastPage = false;
    private int totalPage = 10;
    int itemCount = 0;
    private int quotient,remainder;
    private int actual=10;
    private ShimmerFrameLayout mShimmerViewContainer;
    private ArrayList<String> MenuArray=new ArrayList<String>();
    private ArrayList<_menu> CanteenArray = new ArrayList<_menu>();
    private All_fragment_adapter sAdapter;
    private LinearLayoutManager mHorizontal;
    private TextView orders,_address,name,address2,time,discount,ratingno,distance;
    private RatingBar rating;
    private ImageView _i4,_arrow;
    private NetworkImageView service_pic;
    private Toolbar toolbar;
    private EditText Search_2;
    private Button _cancel;
    final ArrayList<Eats> mName = new ArrayList<Eats>();
    private RecyclerView salonrv;
    private MyCountDownTimer myCountDownTimer;
    private ProgressDialog mProgressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tez_canteen_details);
        cd=new ConnectionDetector(getApplicationContext());
        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        _phoneNo=user.get(PrefManager.KEY_MOBILE);
        progressBar=findViewById(R.id.progressBar3_eats);
        progressBar.setVisibility(View.VISIBLE);
        coordinatorLayout=findViewById(R.id.main_content);
        handler = new Handler();
        _moreRv=findViewById(R.id.moreRv);
        _moreRv.setNestedScrollingEnabled(false);
        service_pic=findViewById(R.id.service_pic);
        _i4=findViewById(R.id._i4);
        _i4.setOnClickListener(this);
        orders=findViewById(R.id.orders);
        toolbar = findViewById(R.id.toolbardd);
        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        toolbar.setTitle(R.string.app_name);

        _address=findViewById(R.id.address);
        Search_2 = findViewById(R.id.search);
        Search_2.setHint("Search items...");
        Search_2.setFocusable(false);
        _cancel = findViewById(R.id._cancel);
        _cancel.setOnClickListener(this);
        salonrv = findViewById(R.id.salonrv);
        salonrv.setNestedScrollingEnabled(false);
        name=findViewById(R.id.name);
        address2=findViewById(R.id.address2);
    //    rating=findViewById(R.id.rating);
     //   time=findViewById(R.id.time);
        discount=findViewById(R.id.discount);
     //   ratingno=findViewById(R.id.ratingno);
        distance=findViewById(R.id.distance);

        if(pref.getDropAt()!=null){
            _address.setText(pref.getDropAt());
        }
        if (pref.get_food_items() != 0) {
            orders.setText(String.valueOf(pref.get_food_items()));

        }



        mHorizontal = new LinearLayoutManager(Canteen_Details.this, LinearLayoutManager.VERTICAL, false);
        _moreRv.setLayoutManager(mHorizontal);



        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Canteen_Details.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

            }
        });
    }


    @Override
    protected void onResume(){
        super.onResume();

        go();

    }



    private void go() {
        CanteenArray.clear();
        mName.clear();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_FOODSS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.e("2nd", response);
                        try {

                            JSONObject jsonObj = new JSONObject(response);
                            JSONArray Eat = jsonObj.getJSONArray("foods");
                            if (Eat.length() != 0) {
                                for (int i = 0; i < Eat.length(); i++) {
                                    JSONObject d = Eat.getJSONObject(i);
                                    if (!d.isNull("Name")) {

                                        MenuArray.add(d.getString("Menu"));
                                        _menu item=new _menu();
                                        item.setID(d.getInt("ID"));
                                        item.setName(d.getString("Name"));
                                        item.setPrice(d.getDouble("senditPrice")-d.getDouble("Discount"));
                                        item.seteTEZ_Price(d.getDouble("senditPrice"));
                                        item.setPhoto(d.getString("Photo"));
                                        item.setDiscount(d.getDouble("Discount"));
                                        item.setSubmenu(d.getString("Submenu"));
                                        item.setMenu(d.getString("Menu"));
                                        item.setDetails(d.getString("Description"));
                                        CanteenArray.add(item);

                                    }
                                }

                            }

                            JSONArray parlours = jsonObj.getJSONArray("shop");
                            for (int i = 0; i < parlours.length(); i++) {
                                JSONObject c = parlours.getJSONObject(i);
                                Eats item = new Eats();
                                item.setName(c.getString("Name"));
                                item.setID(c.getInt("ID"));
                                item.setLatitude(c.getDouble("Latitude"));
                                item.setLonitude(c.getDouble("Longitude"));
                                item.setPhoto(c.getString("Photo"));
                                item.setcPhoto(c.getString("cPhoto"));
                                item.setRating(c.getDouble("Rating"));
                                item.setDiscount(c.getInt("Discount"));
                                item.setCategory(c.getString("Category"));
                                item.setAddress(c.getString("Address"));
                                item.setNoofPersons(c.getInt("TotalRating"));
                                item.setMinimum_time(c.getInt("Minimum_time"));
                                mName.add(item);

                            }



                        } catch (final JSONException e) {
                            Log.e("HI", "Json parsing error: " + e.getMessage());


                        }

                        if(mName.size()!=0) {
                            name.setText(mName.get(0).getName(0));
                            address2.setText(mName.get(0).getAddress(0));
                       //     rating.setRating((float) mName.get(0).getRating(0));
                       //     ratingno.setText("("+String.valueOf(mName.get(0).getNoofPersons(0))+")");
                         //   distance.setText( mName.get(0).getAddress(0));
                         //   time.setText(String.valueOf(mName.get(0).getMinimum_time(0))+" Mins");
                            if(mName.get(0).getDiscount(0)==0){
                                discount.setText("No discount available");
                            }else{
                                discount.setText("Discount of "+mName.get(0).getDiscount(0)+"% available on all items");
                            }
                            if (mName.get(0).getPhoto(0) != null) {

                                String url = mName.get(0).getPhoto(0).replaceAll(" ", "%20");
                                if (TextUtils.isEmpty(url)) {
                                    url = mName.get(0).getcPhoto(0).replaceAll(" ", "%20");
                                }
                                ImageLoader imageLoader = LruBitmapCache.getInstance(Canteen_Details.this)
                                        .getImageLoader();
                                imageLoader.get(url, ImageLoader.getImageListener(service_pic,
                                        R.mipmap.ic_noimage, R.mipmap.ic_noimage));
                                service_pic.setImageUrl(url, imageLoader);

                            }
                        }

                        if (!Canteen_Details.this.isFinishing()) {
                            if (mProgressDialog == null) {
                                mProgressDialog = new ProgressDialog(Canteen_Details.this, R.style.Theme_AppCompat_Light_Dialog_MinWidth);
                                mProgressDialog.setIcon(R.mipmap.ic_launcher);
                                mProgressDialog.setTitle("Populating products");
                                mProgressDialog.setMessage("please wait...");
                                mProgressDialog.setIndeterminate(false);
                                mProgressDialog.show();
                            }
                        }
                        myCountDownTimer = new MyCountDownTimer(5000, 1000);
                        myCountDownTimer.start();

                        populate();

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d("uuu", "Error: " + error.getMessage());
                if (error instanceof TimeoutError || error instanceof NoConnectionError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_INDEFINITE)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    recreate();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof AuthFailureError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_INDEFINITE)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    recreate();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof ServerError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Server Error.Please try another time", Snackbar.LENGTH_INDEFINITE)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    recreate();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof NetworkError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Network Error. Please try another time", Snackbar.LENGTH_INDEFINITE)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    recreate();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof ParseError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Data Error. Please try another time", Snackbar.LENGTH_INDEFINITE)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    recreate();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                }


            }

        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("_mId", String.valueOf(1));
                params.put("cid", String.valueOf(pref.get_cID()));
                return params;
            }

        };
        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);

    }


    public class MyCountDownTimer extends CountDownTimer {



        public MyCountDownTimer(long millisInFuture, long countDownInterval) {
            super(millisInFuture, countDownInterval);
        }



        @Override
        public void onTick(long millisUntilFinished) {

        }

        @Override
        public void onFinish() {
            if (!Canteen_Details.this.isFinishing()) {
                if (mProgressDialog != null) {
                    mProgressDialog.dismiss();
                    _moreRv.setVisibility(View.VISIBLE);
                    _moreRv.setItemAnimator(new DefaultItemAnimator());
                    _moreRv.setAdapter(sAdapter);
                    _moreRv.setHasFixedSize(true);
                }
            }

        }
    }




    private void populate() {


            if(MenuArray.size()!=0) {
                Search_2.setOnClickListener(this);
                Set<String> set = new HashSet<>(MenuArray);
                MenuArray.clear();
                MenuArray.addAll(set);
                sAdapter = new All_fragment_adapter(Canteen_Details.this, MenuArray);
                sAdapter.notifyDataSetChanged();
                sAdapter.setPref(pref);
                sAdapter.setCoordinatorlayout(coordinatorLayout);
                sAdapter.setHasStableIds(true);
                sAdapter.setFrom(1);
                sAdapter.setValues(orders);
                sAdapter.setSearch(Search_2);
                sAdapter.setCancel(_cancel);
                sAdapter.setFirstRv(_moreRv);
                sAdapter.setSecondRv(salonrv);
                sAdapter.setprogress(progressBar);

                if (pref.get_food_items() != 0) {
                    orders.setText(String.valueOf(pref.get_food_items()));
                } else {
                    orders.setText(String.valueOf(0));
                }

            }else{
                Snackbar snackbar = Snackbar
                        .make(coordinatorLayout, "No item found . Please visit later.", Snackbar.LENGTH_INDEFINITE)
                        .setAction("Back", new View.OnClickListener() {
                            @Override
                            public void onClick(View view) {
                                Intent i = new Intent(Canteen_Details.this, Canteen_Mainactivity.class);
                                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                                startActivity(i);
                                finish();
                                 overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                            }
                        });
                snackbar.setActionTextColor(Color.RED);
                snackbar.show();
            }


    }



    @Override
    public void onClick(View v) {

        switch (v.getId()) {

            case R.id._cancel:
                _moreRv.setVisibility(View.VISIBLE);
                salonrv.setVisibility(View.GONE);
                _cancel.setVisibility(View.GONE);
                Search_2.setText("");
                break;

            case R.id.search:
                Search_2.setFocusableInTouchMode(true);
                break;

            case R.id._i4:
                if(_phoneNo!=null) {
                    if (pref.get_food_items() != 0) {
                        pref.set_cID1(2);
                        Intent o = new Intent(Canteen_Details.this, GooglemapApp.class);
                        pref.set_ride(4);
                        startActivity(o);
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }else {
                        if (!Canteen_Details.this.isFinishing()) {
                            new AlertDialog.Builder(Canteen_Details.this, R.style.AlertDialogTheme)
                                    .setTitle("Your cart is empty")
                                    .setMessage("Please add items to your cart.")
                                    .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.cancel();
                                            Intent o = new Intent(Canteen_Details.this, Canteen_Mainactivity.class);
                                            startActivity(o);
                                            finish();
                                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                        }
                                    })
                                    .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.cancel();
                                        }
                                    })
                                    .show();
                        }
                    }
                }else{
                    if (!Canteen_Details.this.isFinishing()) {
                        new AlertDialog.Builder(Canteen_Details.this, R.style.AlertDialogTheme)
                                .setTitle("Please login.")
                                .setMessage("You need to login to complete your order.")
                                .setPositiveButton("Login", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(Canteen_Details.this, ServiceOffer.class);
                                        o.putExtra("from",2);
                                        startActivity(o);
                                        finish();
                                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                    }
                                })
                                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
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
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            if (mProgressDialog != null) {
                mProgressDialog.dismiss();
            }
                Intent i = new Intent(Canteen_Details.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
        }
        return true;
    }

    @Override
    protected void onStart(){
        super.onStart();

    }

    @Override
    public void onPause(){
        super.onPause();
    }

    @Override
    protected void onStop(){
        super.onStop();

    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
        Log.w("DES","DES");
    }

}






