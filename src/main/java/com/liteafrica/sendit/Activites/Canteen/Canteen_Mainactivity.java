package com.liteafrica.sendit.Activites.Canteen;

import android.app.Activity;
import android.app.Dialog;
import android.app.UiModeManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.widget.NestedScrollView;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.NetworkImageView;
import com.android.volley.toolbox.StringRequest;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.material.navigation.NavigationView;
import com.google.android.material.snackbar.Snackbar;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.Activites.Main_Page.UserSuccess;
import com.liteafrica.sendit.Activites.Main_Page.Wb1_access;
import com.liteafrica.sendit.Activites.Ride_Later.ContactUs;
import com.liteafrica.sendit.Activites.Ride_Later.PastRides;
import com.liteafrica.sendit.Activites.Ride_Later.Ride_later_tabs;
import com.liteafrica.sendit.Activites.Searching.Item_selected;
import com.liteafrica.sendit.Activites.Splash_screen;
import com.liteafrica.sendit.Activites.Update_profile;
import com.liteafrica.sendit.Adapters.AdvertiseAdapter;
import com.liteafrica.sendit.Adapters.CanteenAdapter;
import com.liteafrica.sendit.Adapters.Image_Adapter;
import com.liteafrica.sendit.Adapters.MainPrimaryAdapter;
import com.liteafrica.sendit.Adapters.MainRv;
import com.liteafrica.sendit.Adapters.RecyclerTouchListener;
import com.liteafrica.sendit.Adapters.SelfieAdapter;
import com.liteafrica.sendit.AppController;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.FCM.NotificationUtils;
import com.liteafrica.sendit.Login.ServiceOffer;
import com.liteafrica.sendit.Model.Eats;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Canteen_Mainactivity extends AppCompatActivity implements  View.OnClickListener  {

    private PrefManager pref;
    private boolean mResolvingError=false;
    private double My_lat=0,My_long=0;
    private String _phoneNo;
    private CoordinatorLayout coordinatorLayout;
    private RecyclerView viewPager;
    private ArrayList<Eats> ImagesArray = new ArrayList<Eats>();
    private ArrayList<Eats> CanteenArray = new ArrayList<Eats>();
    private ArrayList<Eats> MenuArray = new ArrayList<Eats>();
    private int currentPage=0;
    private static final int REQUEST_PICK_FROM = 10016;
    private TextView[] dots;
    private int _palce=0;
    private RecyclerView _moreRv,_imageRV,mainRv;
    private NestedScrollView Nscroll;
    private boolean _time=false;
    private ArrayList<String> AdArray=new ArrayList<String>();
    private WebView webView;
    private Handler handler1;
    private Runnable p;
    private AdvertiseAdapter sAdapter2;
    private LinearLayout L1;
    private static final int RECOVERY_DIALOG_REQUEST = 203;
    private TextView orders,_address;
    private ImageView _i4;
    private NestedScrollView scroller;
    private ImageView youtubeCard,whatsappCard,_facebookfeed,twitterfeeds,instagramFeed;
    private ImageView _drawer;
    private DrawerLayout drawer;
    private NavigationView navigationView;
    private View navHeader;
    private TextView txtName;
    private NetworkImageView profile_image;
    private Toolbar toolbar;
    private String con;
    private DatabaseReference mDatabase;
    private boolean drawn=false;
    private boolean drawn1=false;
    private boolean drawn2=false;
    private boolean drawn3=false;
    private boolean drawn4=false;
    private String _name;
    private RelativeLayout _C1,_C2,_C3,_C4;
    private NetworkImageView _sc1, _sc2, _sc3, _sc4;
    private TextView _nc1, _nc2, _nc3, _nc4;
    private int _dealMobile1,_dealMobile2,_dealMobile3,_dealMobile4;
    private ImageView _arrow;
    private ActionBarDrawerToggle actionBarDrawerToggle;
    private Image_Adapter sAdapter1;
    private boolean drawn5;
    private EditText Search_2;


    @Override
protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        mDatabase = FirebaseDatabase.getInstance().getReference();
        setContentView(R.layout.tez_eats_main_layout);
        drawer = findViewById(R.id.drawer_layout_main);
        coordinatorLayout=findViewById(R.id
                .cor_home_eats);
        navigationView = findViewById(R.id.nav_view);
        navHeader = navigationView.getHeaderView(0);
        txtName = navHeader.findViewById(R.id.name_profile);
        profile_image = navHeader.findViewById(R.id.img_profile);
        Search_2=findViewById(R.id.search);
        Search_2.setHint("Search Shops");
        Search_2.setOnClickListener(this);
        toolbar = findViewById(R.id.toolbardd);
        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setUpNavigationView();
        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        _phoneNo=user.get(PrefManager.KEY_MOBILE);
        _name=user.get(PrefManager.KEY_NAME);
        L1=findViewById(R.id._l1);
        _moreRv=findViewById(R.id.moreRv);
        _moreRv.setNestedScrollingEnabled(false);

        mainRv=findViewById(R.id.mainRv);
        mainRv.setNestedScrollingEnabled(false);

        _imageRV=findViewById(R.id.imageRV);
        _imageRV.setNestedScrollingEnabled(false);

        _i4=findViewById(R.id._i4);
        _i4.setOnClickListener(this);
        orders=findViewById(R.id.orders);
        _address=findViewById(R.id.address);
        if(pref.getDropAt()!=null){
            _address.setText(pref.getDropAt());
        }

        Nscroll=findViewById(R.id.Nscroll);
        viewPager = findViewById(R.id.view_pager);
        viewPager.setVisibility(View.VISIBLE);
        viewPager.setNestedScrollingEnabled(false);
        Nscroll.setSmoothScrollingEnabled(true);


        youtubeCard=findViewById(R.id.youtube1);
        whatsappCard=findViewById(R.id.whatsapp1);
        youtubeCard.setOnClickListener(this);
        whatsappCard.setOnClickListener(this);
        _facebookfeed=findViewById(R.id.facebook1);
        twitterfeeds=findViewById(R.id.twitter1);
        instagramFeed=findViewById(R.id.instagram1);
        instagramFeed.setOnClickListener(this);
        _facebookfeed.setOnClickListener(this);
        twitterfeeds.setOnClickListener(this);




       if(_phoneNo==null){
           hideItem();
       }else{
           showItem();
       }


        TextView fab =  findViewById(R.id.moretext1);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Click action
                Intent s11 = new Intent(Canteen_Mainactivity.this, SendImageforDelivery.class);
                startActivity(s11);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });

        TextView fab2 =  findViewById(R.id.moretext2);
        fab2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Click action
                Intent s11 = new Intent(Canteen_Mainactivity.this, CourierFunction.class);
                startActivity(s11);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });

    }



    private void hideItem()
    {
        Menu nav_Menu = navigationView.getMenu();
        nav_Menu.findItem(R.id.logout).setVisible(false);
        nav_Menu.findItem(R.id.login).setVisible(true);
    }

    private void showItem()
    {
        Menu nav_Menu = navigationView.getMenu();
        nav_Menu.findItem(R.id.logout).setVisible(true);
        nav_Menu.findItem(R.id.login).setVisible(false);
    }

    @Override
    public void onClick(View v) {

          switch (v.getId()) {


              case R.id.search:
                  Intent o1 = new Intent(Canteen_Mainactivity.this, Item_selected.class);
                  startActivity(o1);
                  finish();
                  overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                  break;


              case R.id.arrow:
                  if (drawer != null) {
                      drawer.openDrawer(Gravity.LEFT);
                  }
                  break;

              case R.id.facebook1:
                  if(pref.getFacebook()!=null) {
                      Intent facebookIntent = new Intent(Intent.ACTION_VIEW);
                      String facebookUrl = getFacebookPageURL(this);
                      facebookIntent.setData(Uri.parse(facebookUrl));
                      startActivity(facebookIntent);
                  }else{
                      Toast.makeText(getApplicationContext(),"No facebook account found",Toast.LENGTH_SHORT).show();
                  }
                  break;

              case R.id.twitter1:
                  open_social_network("com.twitter.android", "https://twitter.com/Official_MissSA");
                  break;



              case R.id.whatsapp1:
                  open_whatsapp();
                  break;
              case R.id.youtube1:
                  Intent o12 = new Intent(Canteen_Mainactivity.this, Wb1_access.class);
                  o12.putExtra("url","http://lite.africa");
                  startActivity(o12);
                  overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                  finish();
                  break;

              case R.id.instagram1:
                  if(pref.getInstagram()!=null) {
                      Uri uri = Uri.parse(pref.getInstagram());
                      Intent likeIng = new Intent(Intent.ACTION_VIEW, uri);

                      likeIng.setPackage("com.instagram.android");

                      try {
                          startActivity(likeIng);
                      } catch (ActivityNotFoundException e) {
                          startActivity(new Intent(Intent.ACTION_VIEW,
                                  Uri.parse(pref.getInstagram())));
                      }
                  }


                  break;

              case R.id._i4: {
                  if (_phoneNo != null) {
                      if (pref.get_food_money()!= 0) {
                          pref.set_cID1(1);
                          Intent o = new Intent(Canteen_Mainactivity.this, GooglemapApp.class);
                          pref.set_ride(3);
                          startActivity(o);
                          overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                      }else{
                          if (!Canteen_Mainactivity.this.isFinishing()) {
                              new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                                      .setTitle("Your cart is empty")
                                      .setMessage("Please add items to your cart.")
                                      .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                          @Override
                                          public void onClick(DialogInterface dialog, int which) {
                                              dialog.cancel();
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
                  } else {
                      if (!Canteen_Mainactivity.this.isFinishing()) {
                          new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                                  .setTitle("Please login.")
                                  .setMessage("You need to login to complete your order.")
                                  .setPositiveButton("Login", new DialogInterface.OnClickListener() {
                                      @Override
                                      public void onClick(DialogInterface dialog, int which) {
                                          dialog.cancel();
                                          Intent o = new Intent(Canteen_Mainactivity.this, ServiceOffer.class);
                                          o.putExtra("from",1);
                                          startActivity(o);
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


              }
              break;

          }
    }

    public String getFacebookPageURL(Context context) {
        final String url1 =  pref.getFacebook();
        String FACEBOOK_PAGE_ID = "sendit";
        PackageManager packageManager = context.getPackageManager();
        try {
            int versionCode = packageManager.getPackageInfo("com.facebook.katana", 0).versionCode;
            if (versionCode >= 3002850) { //newer versions of fb app
                return "fb://facewebmodal/f?href=" + url1;
            } else { //older versions of fb app
                return "fb://page/" + FACEBOOK_PAGE_ID;
            }
        } catch (PackageManager.NameNotFoundException e) {
            return url1; //normal web url
        }
    }

    private void open_social_network(String _package,String _handle) {
        Intent intent4 = new Intent();
        intent4.setType("text/plain");
        intent4.setAction(Intent.ACTION_SEND);
        final PackageManager packageManager = getPackageManager();
        List<ResolveInfo> list = packageManager.queryIntentActivities(intent4, PackageManager.MATCH_DEFAULT_ONLY);

        for (ResolveInfo resolveInfo : list)
        {
            String packageName = resolveInfo.activityInfo.packageName;

            //In case that the app is installed, lunch it.
            if (packageName != null && packageName.equals(_package))
            {
                try
                {
                    Intent browseTwitter = new Intent(Intent.ACTION_VIEW, Uri.parse(_handle));
                    startActivity(browseTwitter);

                    return;
                }
                catch (Exception ignored)
                {

                }
            }
        }

        //If it gets here it means that the twitter app is not installed. Therefor, lunch the browser.
        try
        {
            Intent browseTwitter = new Intent(Intent.ACTION_VIEW, Uri.parse(_handle));
            startActivity(browseTwitter);
        }
        catch (Exception ignored)
        {

        }
    }

    private void open_whatsapp() {
        PackageManager packageManager = getPackageManager();
        Intent i = new Intent(Intent.ACTION_VIEW);

        try {
            String url = "https://api.whatsapp.com/send?phone="+pref.getWhatsApp()+"&text=" + URLEncoder.encode("HI SendIt", "UTF-8");
            i.setPackage("com.whatsapp");
            i.setData(Uri.parse(url));
            if (i.resolveActivity(packageManager) != null) {
                startActivity(i);
            }
        } catch (Exception e){
            e.printStackTrace();
        }

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

        }

@Override
protected void onResume() {
    super.onResume();
    getEats();


        orders.setText(String.valueOf(pref.get_food_items()));

        if(_name!=null){
            txtName.setText(_name);
        }

    if(pref.getUniqueRide()!=null){

                String[] pars = pref.getUniqueRide().split("\\.");
                con = TextUtils.join("", pars);
                mDatabase.child("sendit").child(con).addValueEventListener(new FirebaseDataListener_after_ride());


    }

}


    private class FirebaseDataListener_after_ride implements ValueEventListener {

        private String _ask;
        private String ETR;
        private String _verify;

        @Override
        public void onDataChange(DataSnapshot dataSnapshot) {

            int count = (int) dataSnapshot.getChildrenCount();
            if (count != 0) {
            if (pref.getUniqueRide() != null) {
                    _ask = (String) dataSnapshot.child("ask").getValue();

                if((String) dataSnapshot.child("changed").getValue()!=null){
                    CustomNotification3("Order changed!", "Your order has been changed due to availibility. Inconvinience regretted. ");
                }
                    if(dataSnapshot.child("ETR").getValue()!=null ){
                        ETR=(String) dataSnapshot.child("ETR").getValue();
                        ETR=parseDateToETR(ETR);
                    }



                if(dataSnapshot.child("Verify").getValue()!=null ){
                    _verify=(String) dataSnapshot.child("Verify").getValue();
                   if(_verify.contains("3")) {
                        CustomNotification4("Payment  verified!", "Your have choosen EFT for payment. Your payment has been veridied. Thank you! " + ETR);

                    }
                }

                if (dataSnapshot.child("OTP").getValue() != null ) {
                    pref.setOrder((String) dataSnapshot.child("OTP").getValue());
                }

                    if(_ask!=null){
                    if (_ask.contains("2") && !drawn) {
                        drawn=true;
                        if(dataSnapshot.child("message").getValue()!=null ){
                            String _message = (String) dataSnapshot.child("message").getValue();
                            CustomNotification("Order Accepted", _message);
                            String[] pars = pref.getUniqueRide().split("\\.");
                            con = TextUtils.join("", pars);
                            mDatabase.child("sendit").child(con).child("message").removeValue();
                        }else {
                            CustomNotification("Thank You. Your order has been accepted", "Watch out for further updates coming your way");
                        }
                    }
                    else if (_ask.contains("3") && !drawn1) {
                        drawn1=true;
                        if(dataSnapshot.child("message").getValue()!=null ){
                            String _message = (String) dataSnapshot.child("message").getValue();
                            CustomNotification("Order Confirmed", _message);
                            String[] pars = pref.getUniqueRide().split("\\.");
                            con = TextUtils.join("", pars);
                            mDatabase.child("sendit").child(con).child("message").removeValue();
                        }else {
                            CustomNotification("Your order has beem confirmed",
                                    "Your next update will confirm your expected delivery date");
                        }

                    }
                    else if (_ask.contains("4")&& !drawn2) {
                        drawn2=true;
                        if((String) dataSnapshot.child("pchanged").getValue()!=null){
                            pref.setTotal2((String)dataSnapshot.child("Cost").getValue());
                            CustomNotification2("Congratulations!", "sendit  has given you a discount on your order. ");
                        }else {
                            if (dataSnapshot.child("message").getValue() != null) {
                                String _message = (String) dataSnapshot.child("message").getValue();
                                CustomNotification("Woohoo", "look forward to seeing you on "+ETR);
                                String[] pars = pref.getUniqueRide().split("\\.");
                                con = TextUtils.join("", pars);
                                mDatabase.child("sendit").child(con).child("message").removeValue();
                            } else {
                                CustomNotification("Woohoo", "look forward to seeing you on "+ETR);
                            }
                        }


                    }else if (_ask.contains("5") && !drawn3) {
                        drawn3=true;
                        if(dataSnapshot.child("message").getValue()!=null ){
                            String _message = (String) dataSnapshot.child("message").getValue();
                            CustomNotification("Order dispatched", _message);
                            String[] pars = pref.getUniqueRide().split("\\.");
                            con = TextUtils.join("", pars);
                            mDatabase.child("sendit").child(con).child("message").removeValue();
                        }else {
                            CustomNotification("Today is the day, see you soon", "Your order is put for delivery");
                        }


                    }else if (_ask.contains("6") && !drawn4) {
                        drawn4=true;
                        CustomNotification("Your order has been delivered", "Thank you for your order.  We look forward to senditing soon");
                        Intent i = new Intent(Canteen_Mainactivity.this, UserSuccess.class);
                        startActivity(i);
                        finish();
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                    }else if (_ask.contains("7") && !drawn5) {
                        drawn5=true;
                        String _reason = (String) dataSnapshot.child("reason").getValue();
                        openEditor(_reason);

                    }
                }
                }
            }
        }

        @Override
        public void onCancelled(DatabaseError databaseError) {

        }
    }

    private void CustomNotification2(String congratulations, String s) {
        if(pref.getResposibility()==1) {
            String[] pars = pref.getUniqueRide().split("\\.");
            con = TextUtils.join("", pars);
            mDatabase.child("sendit").child(con).child("pchanged").removeValue();
            NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
            notificationUtils.playNotificationSound();
            Intent resultIntent = new Intent(getApplicationContext(), GooglemapApp.class);
            pref.set_ride(3);
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            showNotificationMessage(getApplicationContext(), congratulations, s, "00:00:00", resultIntent);
        }
    }

    public String parseDateToETR(String time) {
        String inputPattern = "MM-dd-yyyyhh:mm aa";
        String outputPattern = "dd MMM yy hh:mm aa";
        SimpleDateFormat inputFormat = new SimpleDateFormat(inputPattern);
        SimpleDateFormat outputFormat = new SimpleDateFormat(outputPattern);

        Date date = null;
        String str = null;

        try {
            date = inputFormat.parse(time);
            str = outputFormat.format(date);
        } catch (ParseException e) {
            //e.printStackTrace();
            String inputPattern1 = "MM-dd-yyyy";
            String outputPattern1 = "dd MMM yy";
            SimpleDateFormat inputFormat1 = new SimpleDateFormat(inputPattern1);
            SimpleDateFormat outputFormat1 = new SimpleDateFormat(outputPattern1);

            Date date1 = null;

            try {
                date1 = inputFormat1.parse(time);
                str = outputFormat1.format(date1);
            } catch (ParseException e1) {
                e1.printStackTrace();
            }
        }
        return str;
    }

    private void CustomNotification3(String congratulations, String s) {
        if(pref.getResposibility()==1) {
            String[] pars = pref.getUniqueRide().split("\\.");
            con = TextUtils.join("", pars);
            NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
            notificationUtils.playNotificationSound();
            Intent resultIntent = new Intent(getApplicationContext(), PastRides.class);
            resultIntent.putExtra("unique", pref.getOrder());
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            showNotificationMessage(getApplicationContext(), congratulations, s, "00:00:00", resultIntent);
            launchHomeScreen();
        }
    }

    private void CustomNotification4(String congratulations, String s) {
        if(pref.getResposibility()==1) {
            String[] pars = pref.getUniqueRide().split("\\.");
            con = TextUtils.join("", pars);
            mDatabase.child("sendit").child(con).child("Verify").setValue(String.valueOf(4));
            NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
            notificationUtils.playNotificationSound();
            Intent resultIntent = new Intent(getApplicationContext(), GooglemapApp.class);
            resultIntent.putExtra("unique", pref.getOrder());
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            showNotificationMessage(getApplicationContext(), congratulations, s, "00:00:00", resultIntent);
            launchHomeScreen();
        }
    }
    private void CustomNotification5(String congratulations, String s) {
        if(pref.getResposibility()==1) {
            NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
            notificationUtils.playNotificationSound();
            Intent resultIntent = new Intent(getApplicationContext(), GooglemapApp.class);
            resultIntent.putExtra("unique", pref.getOrder());
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            showNotificationMessage(getApplicationContext(), congratulations, s, "00:00:00", resultIntent);
            launchHomeScreen();
        }
    }


    private void launchHomeScreen() {
        final ArrayList<String>mOrder=new ArrayList<>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_DETAILS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);
                            JSONArray Book_Ride_Now = jsonObj.getJSONArray("order");
                            if(Book_Ride_Now.length()!=0) {
                                for (int i = 0; i < Book_Ride_Now.length(); i++) {
                                    JSONObject c = Book_Ride_Now.getJSONObject(i);
                                    if (!c.isNull("order")) {
                                       mOrder.add(c.getString("order"));
                                    }
                                }
                            }
                            if(mOrder.size()>0){
                                pref.packagesharedPreferences(mOrder);
                                String order=android.text.TextUtils.join("_", mOrder);
                                String[] pars = pref.getUniqueRide().split("\\.");
                                con = TextUtils.join("", pars);
                                mDatabase.child("sendit").child(con).child("Order").setValue(order);
                                mDatabase.child("sendit").child(con).child("changed").removeValue();
                                pref.set_food_items(mOrder.size());
                            }
                        } catch (JSONException ex) {
                            ex.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                  VolleyLogerr(error);
            }
        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("_mId", _phoneNo);
                params.put("order", pref.getOrder());
                return params;
            }

        };
        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);




    }

    private void openEditor(String reason) {
        if (!Canteen_Mainactivity.this.isFinishing()) {
            AlertDialog.Builder alertbox = new AlertDialog.Builder(this);
            alertbox.setCancelable(false);
            LinearLayout ll_alert_layout = new LinearLayout(this);
            ll_alert_layout.setOrientation(LinearLayout.VERTICAL);
            final EditText ed_input = new EditText(this);
            ll_alert_layout.addView(ed_input);

            alertbox.setTitle("Your order is cancelled");

            //setting linear layout to alert dialog

            alertbox.setView(ll_alert_layout);

            if(reason!=null){
                ed_input.setText(reason);
                ed_input.setFocusableInTouchMode(false);
                CustomNotification("Order Cancelled",  reason);
            }else{
                ed_input.setText("Inconvinience regretted.");
                ed_input.setFocusableInTouchMode(false);
                CustomNotification("Order Cancelled",  "Inconvinience regretted.");
            }



            alertbox.setPositiveButton("OK",
                    new DialogInterface.OnClickListener() {

                        public void onClick(final DialogInterface arg0, int arg1) {
                            pref.set_food_items(0);
                            pref.set_food_money(0);
                            pref.packagesharedPreferences(null);
                            pref.setDelivery(0);
                            pref.setTotal(null);
                            pref.setTotal2(null);
                            String[] pars = pref.getUniqueRide().split("\\.");
                            con = TextUtils.join("", pars);
                            pref.setUniqueRide(null);
                            mDatabase.child("sendit").child(con).removeValue();
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());

                        }
                    });
            alertbox.show();
        }
    }

    public void CustomNotification(String title,String durationo) {
        if(pref.getResposibility()==1) {
            NotificationUtils notificationUtils = new NotificationUtils(getApplicationContext());
            notificationUtils.playNotificationSound();
            Intent resultIntent = new Intent(getApplicationContext(), GooglemapApp.class);
            pref.set_ride(3);
            resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            showNotificationMessage(getApplicationContext(), title, durationo, "00:00:00", resultIntent);
        }
    }



    private void showNotificationMessage(Context context, String title, String message, String timeStamp, Intent intent) {
        NotificationUtils notificationUtils = new NotificationUtils(context);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        notificationUtils.showNotificationMessage(title, message, timeStamp, intent);
    }


    private void getEats(){
        ImagesArray.clear();
        CanteenArray.clear();

        final ArrayList<String>mCategory=new ArrayList<String>();
        final ArrayList<Eats>mSelfie=new ArrayList<Eats>();
        final ArrayList<Eats>mMain=new ArrayList<Eats>();
        final ArrayList<Eats>mpopularad=new ArrayList<Eats>();
        final ArrayList<Eats>mNewS=new ArrayList<Eats>();
        final ArrayList<Eats>mNear=new ArrayList<Eats>();
        final ArrayList<Eats>mCloser=new ArrayList<Eats>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_MENU,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.w("volley", response);
                        MenuArray.clear();

                        try {
                            JSONObject jsonObj = new JSONObject(response);
                            JSONArray ads = jsonObj.getJSONArray("ads");

                            JSONArray submenu = jsonObj.getJSONArray("submenu");
                            JSONArray tezads = jsonObj.getJSONArray("tezads");



                            
                                if (ads.length() != 0) {
                                    viewPager.setVisibility(View.VISIBLE);
                                for (int i = 0; i < ads.length(); i++) {
                                    JSONObject c = ads.getJSONObject(i);
                                    if (!c.isNull("Category")) {
                                       mCategory.add(c.getString("Category"));
                                    }

                                }
                            }else{
                                    viewPager.setVisibility(View.GONE);
                                }

                            JSONArray selfie = jsonObj.getJSONArray("images");
                            for (int i = 0; i < selfie.length(); i++) {
                                JSONObject c = selfie.getJSONObject(i);
                                if (!c.isNull("Photo")) {
                                    Eats item = new Eats();
                                    item.setPhoto(c.getString("Photo"));
                                    item.setTitle(c.getString("Title"));
                                    item.setDescription(c.getString("Description"));
                                    mSelfie.add(item);
                                }
                            }






                            JSONArray main = jsonObj.getJSONArray("main");
                            for (int i = 0; i < main.length(); i++) {
                                JSONObject c = main.getJSONObject(i);
                                if (!c.isNull("Photo")) {
                                    Eats item = new Eats();
                                    item.setPhoto(c.getString("Photo"));
                                    item.setTitle(c.getString("Category"));
                                    item.setID(c.getInt("ID"));
                                    mMain.add(item);
                                }
                            }


                            if (tezads.length() != 0) {
                                for (int i = 0; i < tezads.length(); i++) {
                                    JSONObject c = tezads.getJSONObject(i);
                                    if (!c.isNull("Photo")) {
                                        AdArray.add(c.getString("Photo"));
                                    }

                                }
                            }


                            if (submenu.length() != 0) {
                                for (int i = 0; i < submenu.length(); i++) {
                                    JSONObject c = submenu.getJSONObject(i);
                                    if (!c.isNull("Name")) {
                                        Eats item = new Eats();
                                        item.setID(c.getInt("ID"));
                                        item.setName(c.getString("Name"));
                                        item.setPhoto(c.getString("Photo"));
                                        CanteenArray.add(item);
                                    }

                                }
                            }

                        } catch (final JSONException e) {
                            Log.e("HI", "Json parsing error: " + e.getMessage());


                        }
                         if (mCategory.size() > 0) {
                             Set<String> set = new HashSet<>(mCategory);
                             mCategory.clear();
                             mCategory.addAll(set);
                             viewPager.setVisibility(View.VISIBLE);
                             MainPrimaryAdapter sAdapter1 = new MainPrimaryAdapter(Canteen_Mainactivity.this, mCategory);
                             sAdapter1.notifyDataSetChanged();
                             sAdapter1.setPref(pref);
                             sAdapter1.setCoordinatorlayout(coordinatorLayout);
                             viewPager.setAdapter(sAdapter1);
                             LinearLayoutManager horizontalLayoutManagae = new LinearLayoutManager(Canteen_Mainactivity.this, RecyclerView.VERTICAL, false);
                             viewPager.setLayoutManager(horizontalLayoutManagae);
                             viewPager.setHasFixedSize(true);

                         }



                        if (CanteenArray.size() > 0) {
                            CanteenAdapter sAdapter = new CanteenAdapter(Canteen_Mainactivity.this, CanteenArray);
                            sAdapter.notifyDataSetChanged();
                            sAdapter.setPref(pref);
                            sAdapter.setPhoneNo(_phoneNo);
                            _moreRv.setAdapter(sAdapter);
                            _moreRv.setHasFixedSize(true);
                            StaggeredGridLayoutManager mLayoutManager = new StaggeredGridLayoutManager(getSpan2(), StaggeredGridLayoutManager.VERTICAL);
                            _moreRv.setLayoutManager(mLayoutManager);
                            _moreRv.setItemAnimator(new DefaultItemAnimator());
                            _moreRv.addOnItemTouchListener(
                                    new RecyclerTouchListener(Canteen_Mainactivity.this, _moreRv,
                                            new RecyclerTouchListener.OnTouchActionListener() {


                                                @Override
                                                public void onClick(View view, final int position) {
                                                    Log.w("gallery", String.valueOf(position));
                                                    if(position>=0) {
                                                        if (CanteenArray.size() != 0 && CanteenArray.get(position).getName(position) != null) {
                                                            Intent o = new Intent(Canteen_Mainactivity.this, Canteen_Details.class);
                                                            pref.setFrom1(2);
                                                            pref.setFrom2(CanteenArray.get(position).getID(position));
                                                            pref.setID1(2);
                                                            pref.setID3(CanteenArray.get(position).getID(position));
                                                            pref.setID2(CanteenArray.get(position).getID(position));
                                                            pref.setcName(null);
                                                            pref.setcName(CanteenArray.get(position).getName(position));
                                                            pref.setCancel1(CanteenArray.get(position).getPhoto(position));
                                                            startActivity(o);
                                                            finish();
                                                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                                        }
                                                    }
                                                }

                                                @Override
                                                public void onRightSwipe(View view, int position) {

                                                }

                                                @Override
                                                public void onLeftSwipe(View view, int position) {

                                                }
                                            }));
                        }



                        if(mSelfie.size()!=0){
                          //  Collections.shuffle(mSelfie);
                            SelfieAdapter sAdapter4 = new SelfieAdapter(Canteen_Mainactivity.this, mSelfie);
                            sAdapter4.notifyDataSetChanged();
                            sAdapter4.setHasStableIds(true);
                            _imageRV.setAdapter(sAdapter4);
                            _imageRV.setHasFixedSize(true);
                            LinearLayoutManager horizontalLayoutManagae = new LinearLayoutManager(Canteen_Mainactivity.this, RecyclerView.HORIZONTAL, false);
                            _imageRV.setLayoutManager(horizontalLayoutManagae);
                            _imageRV.setItemAnimator(new DefaultItemAnimator());

                        }

                        if(mMain.size()!=0){
                          //  Collections.shuffle(mMain);
                            MainRv sAdapter4 = new MainRv(Canteen_Mainactivity.this, mMain);
                            sAdapter4.notifyDataSetChanged();
                            sAdapter4.setHasStableIds(true);
                            sAdapter4.setPref(pref);
                            mainRv.setAdapter(sAdapter4);
                            mainRv.setHasFixedSize(true);
                            StaggeredGridLayoutManager mLayoutManager = new StaggeredGridLayoutManager(getSpan2(), StaggeredGridLayoutManager.VERTICAL);
                            mainRv.setLayoutManager(mLayoutManager);
                            mainRv.setItemAnimator(new DefaultItemAnimator());

                        }


                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLogerr(error);


            }

        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("_mId", "_phoneNo");
                return params;
            }

        };
        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);

    }

    private void VolleyLogerr(VolleyError error) {
        if (error instanceof TimeoutError || error instanceof NoConnectionError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_LONG)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof AuthFailureError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_LONG)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof ServerError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Server Error.Please try another time", Snackbar.LENGTH_LONG)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof NetworkError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network Error. Please try another time", Snackbar.LENGTH_LONG)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof ParseError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Data Error. Please try another time", Snackbar.LENGTH_LONG)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        }

    }


    public int getSpan() {
        int orientation = getScreenOrientation(getApplicationContext());
        if (isTV(getApplicationContext())) return 2;
        if (isTablet(getApplicationContext()))
            return orientation == Configuration.ORIENTATION_PORTRAIT ? 2 : 2;
        return orientation == Configuration.ORIENTATION_PORTRAIT ? 2: 2;
    }
    public int getSpan2() {
        int orientation = getScreenOrientation(getApplicationContext());
        if (isTV(getApplicationContext())) return 3;
        if (isTablet(getApplicationContext()))
            return orientation == Configuration.ORIENTATION_PORTRAIT ? 3 : 3;
        return orientation == Configuration.ORIENTATION_PORTRAIT ? 3: 3;
    }

    public static boolean isTV(Context context) {
        return ((UiModeManager) context
                .getSystemService(Context.UI_MODE_SERVICE))
                .getCurrentModeType() == Configuration.UI_MODE_TYPE_TELEVISION;
    }

    public static int getScreenOrientation(Context context) {
        return context.getResources().getDisplayMetrics().widthPixels <
                context.getResources().getDisplayMetrics().heightPixels ?
                Configuration.ORIENTATION_PORTRAIT : Configuration.ORIENTATION_LANDSCAPE;
    }

    public static boolean isTablet(Context context) {
        return (context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) >= Configuration.SCREENLAYOUT_SIZE_LARGE;
    }







    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //replaces the default 'Back' button action
        if(keyCode== KeyEvent.KEYCODE_BACK) {
            if (pref.get_food_money() != 0) {
                if (pref.getUniqueRide() == null) {
                    if (!Canteen_Mainactivity.this.isFinishing()) {
                        new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                                .setTitle("Are you Sure?")
                                .setMessage("You have items on the cart. Please complete your order.")
                                .setPositiveButton("Exit", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        pref.set_food_items(0);
                                        pref.set_food_money(0);
                                        pref.packagesharedPreferences(null);
                                        pref.setTotal(null);
                                        pref.setCost(null);
                                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                        finishAffinity();
                                        finish();
                                    }
                                })
                                .setNegativeButton("NO", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                    }
                                })
                                .show();
                    }
                } else {
                    if (!Canteen_Mainactivity.this.isFinishing()) {
                        new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                                .setTitle("Are you Sure?")
                                .setMessage("You have an order to be deliver by sendit . Keep track of your order. ")
                                .setPositiveButton("YES", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                        finishAffinity();
                                        finish();
                                    }
                                })
                                .setNegativeButton("NO", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                    }
                                })
                                .show();
                    }
                }
            } else {
                if (!Canteen_Mainactivity.this.isFinishing()) {
                    AlertDialog.Builder builder = new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                            .setIcon(R.mipmap.ic_launcher)
                            .setTitle("Are you sure to exit?")
                            .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                    finishAffinity();
                                    finish();
                                    dialog.cancel();
                                }
                            })
                            .setNegativeButton("No", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    dialog.cancel();
                                }
                            });
                    builder.show();
                }
            }
        }
        return true;
    }

    private void setUpNavigationView() {

        //Setting Navigation View Item Selected Listener to handle the bean click of the navigation menu
        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {


            // This method will trigger on bean Click of navigation menu
            @Override
            public boolean onNavigationItemSelected(MenuItem menuItem) {

                //Check to see which bean was being clicked and perform appropriate action
                switch (menuItem.getItemId()) {
                    //Replacing the main content with ContentFragment Which is our Inbox View;
                    case R.id.nav_home:
                        drawer.closeDrawers();
                        if (_phoneNo == null) {
                            Intent o = new Intent(Canteen_Mainactivity.this, ServiceOffer.class);
                            o.putExtra("from",1);
                            startActivity(o);

                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        } else {
                            Intent o1 = new Intent(Canteen_Mainactivity.this, Update_profile.class);
                            startActivity(o1);
                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        }
                        break;


                    case R.id.nav_about:
                        drawer.closeDrawers();
                        Intent o1 = new Intent(Canteen_Mainactivity.this, Wb1_access.class);
                        o1.putExtra("url","http://139.59.38.160/sendit/Website/about.html");
                        startActivity(o1);
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        finish();


                        break;

                    case R.id.nav_contact:
                        drawer.closeDrawers();

                            Intent ouc = new Intent(Canteen_Mainactivity.this, ContactUs.class);
                            startActivity(ouc);
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                        break;

                    case R.id.nav_reminder:
                        drawer.closeDrawers();
                        if (_phoneNo != null) {
                            Intent o = new Intent(Canteen_Mainactivity.this, Ride_later_tabs.class);
                            startActivity(o);
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);


                        } else {
                            Intent o = new Intent(Canteen_Mainactivity.this, ServiceOffer.class);
                            o.putExtra("from",1);
                            startActivity(o);
                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        }
                        break;

                    case R.id.nav_parcel:
                        drawer.closeDrawers();
                        if (_phoneNo != null) {
                            Intent o = new Intent(Canteen_Mainactivity.this, ParcelStatus.class);
                            startActivity(o);
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);


                        } else {
                            Intent o = new Intent(Canteen_Mainactivity.this, ServiceOffer.class);
                            o.putExtra("from",1);
                            startActivity(o);
                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        }
                        break;

                    case R.id.nav_notification:
                        drawer.closeDrawers();
                        if (_phoneNo != null) {
                            Intent o = new Intent(Canteen_Mainactivity.this, NotificationAll.class);
                            startActivity(o);
                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.slide_down1);


                        } else {
                            Intent o = new Intent(Canteen_Mainactivity.this, ServiceOffer.class);
                            o.putExtra("from",1);
                            startActivity(o);
                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        }
                        break;


                    case R.id.logout:
                        drawer.closeDrawers();
                        if (_phoneNo != null) {
                            if(pref.get_food_money()!=0 ){
                                if(pref.getUniqueRide()==null){
                                if (!Canteen_Mainactivity.this.isFinishing()) {
                                    new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                                            .setTitle("Are you Sure?")
                                            .setMessage("You have items on the cart. Your cart will be empty if you logout.")
                                            .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                                @Override
                                                public void onClick(DialogInterface dialog, int which) {
                                                    dialog.cancel();
                                                    logout();
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
                                }else{
                                    if (!Canteen_Mainactivity.this.isFinishing()) {
                                        new AlertDialog.Builder(Canteen_Mainactivity.this, R.style.AlertDialogTheme)
                                                .setTitle("Are you Sure?")
                                                .setMessage("You have an order to deliver by sendit . ")
                                                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                                    @Override
                                                    public void onClick(DialogInterface dialog, int which) {
                                                        dialog.cancel();
                                                        logout();
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
                                Snackbar snackbar1 = Snackbar
                                        .make(coordinatorLayout, "Are you Sure?", Snackbar.LENGTH_LONG)
                                        .setAction("Logout", new View.OnClickListener() {
                                            @Override
                                            public void onClick(View view) {
                                              logout();

                                            }
                                        });
                                snackbar1.setActionTextColor(Color.RED);
                                snackbar1.show();
                            }
                        }
                        break;

                    case R.id.login:
                        drawer.closeDrawers();
                        Intent i3 = new Intent(Canteen_Mainactivity.this, ServiceOffer.class);
                        i3.putExtra("from",1);
                        startActivity(i3);
                        finish();
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        break;


                    default:
                        drawer.openDrawer(Gravity.LEFT);
                        break;
                }

                //Checking if the bean is in checked state or not, if not make it in checked state
                if (menuItem.isChecked()) {
                    menuItem.setChecked(false);
                } else {
                    menuItem.setChecked(true);
                }
                menuItem.setChecked(true);
                return true;
            }
        });


         actionBarDrawerToggle = new ActionBarDrawerToggle(this, drawer, toolbar,   R.string.openDrawer,
                 R.string.closeDrawer) {

            @Override
            public void onDrawerClosed(View drawerView) {
                // Code here will be triggered once the drawer closes as we dont want anything to happen so we leave this blank
                super.onDrawerClosed(drawerView);
            }

            @Override
            public void onDrawerOpened(View drawerView) {
                // Code here will be triggered once the drawer open as we dont want anything to happen so we leave this blank
                super.onDrawerOpened(drawerView);
            }
        };
        actionBarDrawerToggle.setDrawerIndicatorEnabled(true);
        drawer.addDrawerListener(actionBarDrawerToggle);
        actionBarDrawerToggle.syncState();

    }

    private void logout() {
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.URL_LOGOUT,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.w("kk", response.toString());


                        String[] par = response.split("error");
                        if (par[1].contains("false")) {
                            pref.clearSession();
                            pref.createLogin(null, null);
                            pref.setResponsibility(0);
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
                            pref.setTotal(null);
                            pref.setTotal2(null);
                            pref.setadTetxt(null);
                            pref.setPayment(0);
                            pref.setUniqueRide(null);
                            Intent i3 = new Intent(Canteen_Mainactivity.this, Splash_screen.class);
                            startActivity(i3);
                            finish();
                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        }else{
                           ViewDialogFailed alert = new ViewDialogFailed();
                            alert.showDialog(Canteen_Mainactivity.this, "Please check the information provided!", true);
                        }


                    }


                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLogerr(error);
            }

        }) {
            @Override
            protected Map<String, String> getParams() {
                // Posting parameters to login url
                Map<String, String> params = new HashMap<String, String>();
                params.put("mobile",_phoneNo);
                return params;
            }

        };

        // Añade la peticion a la cola
        AppController.getInstance().addToRequestQueue(eventoReq);


    }


    public class ViewDialogFailed {

        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                final Dialog dialog1 = new Dialog(activity);
                dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog1.setCancelable(false);

                dialog1.setContentView(R.layout.custom_dialog_failed);
                dialog1.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                dialog1.getWindow().getAttributes().windowAnimations = R.style.DialogAnimation;
                TextView text = dialog1.findViewById(R.id.text_dialog);
                text.setText(msg);

                Button dialogButton = dialog1.findViewById(R.id.btn_dialog);

                dialogButton.setText("Ok");
                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                        dialog1.dismiss();
                    }
                });

                dialog1.show();
            }
        }
    }




    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        // TODO Auto-generated method stub
        super.onConfigurationChanged(newConfig);
        actionBarDrawerToggle.onConfigurationChanged(newConfig);
    }

    @Override
    protected void onPostCreate(Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        super.onPostCreate(savedInstanceState);
        actionBarDrawerToggle.syncState();
    }

}






