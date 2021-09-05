package com.liteafrica.sendit.delivery;

import android.Manifest;
import android.app.AlarmManager;
import android.app.Dialog;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Matrix;
import android.location.Location;
import android.media.MediaPlayer;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.DialogFragment;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.github.silvestrpredko.dotprogressbar.DotProgressBar;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResolvableApiException;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResponse;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.LocationSettingsStatusCodes;
import com.google.android.gms.location.SettingsClient;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.SquareCap;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.snackbar.Snackbar;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Mainactivity;
import com.liteafrica.sendit.Activites.Canteen.SendImageforDelivery;
import com.liteafrica.sendit.Activites.Ride_Later.Ride_later_tabs;
import com.liteafrica.sendit.Activites.Splash_screen;
import com.liteafrica.sendit.Activites.Success;
import com.liteafrica.sendit.Activites.Update_profile;
import com.liteafrica.sendit.Alarm.AlarmNotificationService;
import com.liteafrica.sendit.Alarm.AlarmReceiver;
import com.liteafrica.sendit.Alarm.AlarmSoundService;
import com.liteafrica.sendit.AppController;
import com.liteafrica.sendit.BuildConfig;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.FCM.NotificationUtils;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.liteafrica.sendit.Requests.Tabs_past_future_ride;
import com.liteafrica.sendit.Utils.DirectionsJSONParser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.URL;
import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

import static com.google.android.gms.maps.model.JointType.ROUND;


public class DrivermapApp extends AppCompatActivity implements
        OnMapReadyCallback, GoogleApiClient.ConnectionCallbacks,
        GoogleApiClient.OnConnectionFailedListener, View.OnClickListener,MediaPlayer.OnPreparedListener {

    private static final int ALARM_REQUEST_CODE = 1009;
    private GoogleApiClient mGoogleApiClient;
    private ArrayList<LatLng> markerPoints;
    private static final String TAG = DrivermapApp.class.getSimpleName();
    private String Unique_id;
    private CoordinatorLayout coordinatorLayout;
    private ImageView Edit_profile,_callImage;
    private Toolbar toolbar;
    private TextView noOwner;
    private String _PhoneNo;
    private PrefManager pref;
    private String USER;
    private int navItemIndex = 0;
    private GoogleMap googleMap;
    double My_lat, My_long;
    private SupportMapFragment mapFragment;
    private ProgressBar progressBar;
    private final int REQUEST_LOCATION = 200;
    private PendingResult<LocationSettingsResult> result;
    private LocationSettingsRequest.Builder builder;
    private static final int REQUEST_RESOLVE_ERROR = 1001;
    // Unique tag for the error dialog fragment
    private static final String DIALOG_ERROR = "dialog_error";
    private boolean mResolvingError = false;
    private boolean mLocationPermissionGranted;
    private static final int REQUEST_PERMISSIONS_REQUEST_CODE = 34;
    private static final int REQUEST_CHECK_SETTINGS = 0x1;
    private FusedLocationProviderClient mFusedLocationClient;
    private SettingsClient mSettingsClient;
    private LocationRequest mLocationRequest;
    private LocationSettingsRequest mLocationSettingsRequest;
    private LocationCallback mLocationCallback;
    private Location mCurrentLocation;
    private Boolean mRequestingLocationUpdates;
    private boolean isInternetPresent;
    private ImageView myLocationButton;
    private String Driver_name, Driver_image;
    private Marker marker;
    private LinearLayout Ride_later,Ride_now,pickup;
    private DatabaseReference mDatabase;
    private boolean clicK=false;
    private int OTP;
    private String Driver_phone;
    private BroadcastReceiver mRegistrationBroadcastReceiver;
    private String User_from,User_to;
    private double from_lat=0,from_long=0,to_lat=0,to_long=0;
    private Button Confirm_ride;
    private LinearLayout Rl;
    private LinearLayout Lr;
    private DotProgressBar Amb;
    private boolean Start_ride=false;
    private boolean first=false;
    private boolean again=false;
    private String filePath="";
    private Boolean ask=false,wait=false,go=false,stop=false,Accepted=false;
    private String con;
    private Button Stop_ride;
    private PolylineOptions lineOptions = null;
    private Polyline polylineFinal;
    private boolean animate=false;
    private LatLng To_latLong,From_latlong;
    private boolean offline=false;
    private Marker markerUser;
    private Matrix matrix;
    private String vehicle_No;
    private Marker markerd;
    private Animation animslideD,animslideU;
    private double Distance=0;
    private String Cost;
    private String Coupon_code="";
    private double Coupon_value=0;
    private boolean got=false;
    private int Minimum_fare=0,Hourly_fare=0;
    DecimalFormat dft=new DecimalFormat("0.000000");
    DecimalFormat dfto=new DecimalFormat("0.00");
    private String mobileIp;
    private boolean Minimum_Balance=false;
    private float bearing=0;
    private double Distance_travel=0;
    private String User_mobile;
    private RelativeLayout layoutBottomSheet;
    BottomSheetBehavior sheetBehavior;
    private boolean got_ride=false;
    private boolean drawn=false;
    private boolean drawn1=false;
    private boolean drawn2=false;
    private boolean drawn3=false;
    private boolean _vehicle_No=false,License_No=false,_car=false;
    private boolean _Rc_No=false;
    private boolean _image=false;
    private boolean _off1=false;
    private boolean _off2=false;
    private double User_To_lat = 0, User_To_long = 0;
    private PendingIntent pendingIntent;
    private RelativeLayout rMap;
    private Marker markerf;
    private boolean car=false;
    private boolean _get=false;
    private boolean _cancl=false;
    private TextView _account_balance;
    private boolean doubleBackToExitPressedOnce=false;
    private ImageView myTrackButton;
    private TextView txt1,txt2,text_otp,text_dialog;
    private Animation animBlink;
    private Button Call_driver;
    private LinearLayout _l1;
    private String _Name;
    private Button Got_location;
    private FirebaseDataListener_got flistner;
    private LinearLayout ordernos;
    private TextView nooforders;
    private boolean _played;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _PhoneNo = user.get(PrefManager.KEY_MOBILE);
        _Name = user.get(PrefManager.KEY_NAME);
        checkPermissions();
        setContentView(R.layout.drivermap);


        ordernos = findViewById(R.id.ordernos);
        nooforders =findViewById(R.id.noofordersonline);

        ordernos.setOnClickListener(this);


        Rl=findViewById(R.id.ride_detail);
        _l1=findViewById(R.id._l1);
        rMap=findViewById(R.id.rmap);
        Confirm_ride=findViewById(R.id.confirm_ride);
        Lr=findViewById(R.id.linearLayout);
        Amb=findViewById(R.id.dot_progress_bar_amb);
        Stop_ride=findViewById(R.id.stop_ride);
        Stop_ride.setOnClickListener(this);
        Got_location=findViewById(R.id.get_there);
        Got_location.setOnClickListener(this);
        coordinatorLayout = findViewById(R.id
                .cor_home_main);
        myTrackButton = findViewById(R.id.myTrackButton);
        myTrackButton.setOnClickListener(this);
        txt1 = findViewById(R.id.s);
        txt2 = findViewById(R.id.d);
        toolbar = findViewById(R.id.toolbar_main);
        noOwner=findViewById(R.id.textnoOwner);
        animBlink = AnimationUtils.loadAnimation(getApplicationContext(),
                R.anim.blink);


        Call_driver = findViewById(R.id.call_driver);
        _callImage=findViewById(R.id._callImage);
        _callImage.setAnimation(animBlink);

            Call_driver.setVisibility(View.VISIBLE);
            _callImage.setVisibility(View.VISIBLE);


        Call_driver.setOnClickListener(this);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        //setUpNavigationView();
        progressBar = findViewById(R.id.progressBar3_map);
        myLocationButton = findViewById(R.id.myLocationCustomButton);
        mRequestingLocationUpdates = false;
        mFusedLocationClient = LocationServices.getFusedLocationProviderClient(this);
        mSettingsClient = LocationServices.getSettingsClient(this);
        buildLocationSettingsRequest();
        rebuildGoogleApiClient();
        mapFragment = (SupportMapFragment) getSupportFragmentManager().findFragmentById(R.id.map);

        mapFragment.getMapAsync(DrivermapApp.this);
        if (mGoogleApiClient != null && mGoogleApiClient.isConnected()) {
            onConnected(null);
        }

        Ride_later=findViewById(R.id.ride_later);
        Ride_now=findViewById(R.id.ride_now);
        pickup=findViewById(R.id.pickup);
        pickup.setOnClickListener(this);

        myLocationButton.setOnClickListener(this);
        Ride_later.setOnClickListener(this);
        Ride_now.setOnClickListener(this);
        Confirm_ride.setOnClickListener(this);

        mDatabase = FirebaseDatabase.getInstance().getReference();

        animslideD = AnimationUtils.loadAnimation(getApplicationContext(),
                R.anim.slide_down1);
        animslideU = AnimationUtils.loadAnimation(getApplicationContext(),
                R.anim.slide_up1);
        mobileIp = get_PhoneNoIPAddress();
        if(TextUtils.isEmpty(mobileIp)){
            mobileIp= getWifiIPAddress();
        }


        layoutBottomSheet = findViewById(R.id.bottom_sheet_3);
        sheetBehavior = BottomSheetBehavior.from(layoutBottomSheet);
        sheetBehavior.setBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() {
            @Override
            public void onStateChanged(@NonNull View bottomSheet, int newState) {
                switch (newState) {
                    case BottomSheetBehavior.STATE_HIDDEN:
                        sheetBehavior.setState(BottomSheetBehavior.STATE_EXPANDED);
                        break;
                    case BottomSheetBehavior.STATE_EXPANDED: {

                    }
                    break;
                    case BottomSheetBehavior.STATE_COLLAPSED: {
                       toggleBottomSheet();
                    }
                    break;
                    case BottomSheetBehavior.STATE_DRAGGING:
                        break;
                    case BottomSheetBehavior.STATE_SETTLING:
                        break;
                }
            }

            @Override
            public void onSlide(@NonNull View bottomSheet, float slideOffset) {

            }
        });

      text_dialog=findViewById(R.id.text_dialog);
      text_otp=findViewById(R.id.text_otp);



        flistner=new FirebaseDataListener_got();




        mRegistrationBroadcastReceiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                if (intent.getAction().equals(Config_URL.PUSH_NOTIFICATION)) {
                    RegisterAlarmBroadcast();
                }
            }
        };


        Intent alarmIntent = new Intent(DrivermapApp.this, AlarmReceiver.class);
        pendingIntent = PendingIntent.getBroadcast(DrivermapApp.this, ALARM_REQUEST_CODE, alarmIntent, 0);
        if (pendingIntent != null) {
            stopAlarmManager();
        }

    }
    public void stopAlarmManager() {

        AlarmManager manager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
        manager.cancel(pendingIntent);
        stopService(new Intent(DrivermapApp.this, AlarmSoundService.class));
        NotificationManager notificationManager = (NotificationManager) this
                .getSystemService(Context.NOTIFICATION_SERVICE);
        notificationManager.cancel(AlarmNotificationService.NOTIFICATION_ID);

    }




    public static String get_PhoneNoIPAddress() {
        try {
            List<NetworkInterface> interfaces = Collections.list(NetworkInterface.getNetworkInterfaces());
            for (NetworkInterface intf : interfaces) {
                List<InetAddress> addrs = Collections.list(intf.getInetAddresses());
                for (InetAddress addr : addrs) {
                    if (!addr.isLoopbackAddress()) {
                        return  addr.getHostAddress();
                    }
                }
            }
        } catch (Exception ex) { } // for now eat exceptions
        return null;
    }

    public String getWifiIPAddress() {
        WifiManager wifiMgr = (WifiManager) getApplicationContext().getSystemService(WIFI_SERVICE);
        WifiInfo wifiInfo = wifiMgr.getConnectionInfo();
        int ip = wifiInfo.getIpAddress();
        return  Formatter.formatIpAddress(ip);
    }





    protected LocationRequest createLocationRequest() {
        mLocationRequest = new LocationRequest();
        mLocationRequest.setInterval(2000);
        mLocationRequest.setFastestInterval(10000);
        mLocationRequest.setSmallestDisplacement(0.1f);
        mLocationRequest.setPriority(LocationRequest.PRIORITY_BALANCED_POWER_ACCURACY);
        return mLocationRequest;
    }

    private void buildLocationSettingsRequest() {
        LocationSettingsRequest.Builder builder = new LocationSettingsRequest.Builder();
        builder.addLocationRequest(mLocationRequest);
        mLocationSettingsRequest = builder.build();
    }

    protected synchronized void rebuildGoogleApiClient() {
       mGoogleApiClient = new GoogleApiClient.Builder(this)
                .enableAutoManage(this /* FragmentActivity */,
                        0 /* googleApiClientId used when auto-managing multiple googleApiClients */,
                        this /* OnConnectionFailedListener */)
                .addConnectionCallbacks(this /* ConnectionCallbacks */)
                // Register a connection listener that will notify on disconnect (including ones
                // caused by calling disconnect on the GoogleApiClient).
                .addOnConnectionFailedListener(new GoogleApiClient.OnConnectionFailedListener() {
                    @Override
                    public void onConnectionFailed(ConnectionResult connectionResult) {
                        googleApiClientConnectionStateChange(true);
                    }
                })


                .addApi(LocationServices.API)
                // TODO(developer): Specify any additional API Scopes or APIs you need here.
                // The GoogleApiClient will ensure these APIs are available, and the Scopes
                // are approved before invoking the onConnected callbacks.
                .build();
        mGoogleApiClient.connect();
    }

    private void googleApiClientConnectionStateChange(final boolean connected) {
        final Context appContext = this.getApplicationContext();

        // TODO(developer): Kill AsyncTasks, or threads using the GoogleApiClient.

        // Display Toast that isn't dependent on the current activity (in case of a rotation).

    }

    @Override
    public void onConnectionSuspended(int cause) {
        // Indicate API calls to Google Play services APIs should be halted.
        googleApiClientConnectionStateChange(false);
        mGoogleApiClient.connect();
    }

    @Override
    public void onConnectionFailed(ConnectionResult result) {
        if (mResolvingError) {

        } else if (result.hasResolution()) {
            try {
                mResolvingError = true;
                result.startResolutionForResult(this, REQUEST_RESOLVE_ERROR);
            } catch (IntentSender.SendIntentException e) {
                // There was an error with the resolution intent. Try again.
                mGoogleApiClient.connect();
            }
        } else {
            // Show dialog using GoogleApiAvailability.getErrorDialog()
            showErrorDialog(result.getErrorCode());
            mResolvingError = true;
        }
    }

    private void showErrorDialog(int errorCode) {
        // Create a fragment for the error dialog
        ErrorDialogFragment dialogFragment = new ErrorDialogFragment();
        // Pass the error that should be displayed
        Bundle args = new Bundle();
        args.putInt(DIALOG_ERROR, errorCode);
        dialogFragment.setArguments(args);
        if(!DrivermapApp.this.isFinishing()) {
            dialogFragment.show(getSupportFragmentManager(), "errordialog");
        }
    }



    public static class ErrorDialogFragment extends DialogFragment {
        public ErrorDialogFragment() {
        }

        @NonNull
        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            // Get the error code and retrieve the appropriate dialog
            int errorCode = this.getArguments().getInt(DIALOG_ERROR);
            return GoogleApiAvailability.getInstance().getErrorDialog(
                    this.getActivity(), errorCode, REQUEST_RESOLVE_ERROR);
        }

        @Override
        public void onDismiss(DialogInterface dialog) {

            dialog.cancel();
        }
    }

    @Override
    public void onConnected(Bundle bundle) {
        mLocationRequest = createLocationRequest();
        builder = new LocationSettingsRequest.Builder().addLocationRequest(mLocationRequest);
        Task<LocationSettingsResponse> task = LocationServices.getSettingsClient(this).checkLocationSettings(builder.build());
        task.addOnCompleteListener(new OnCompleteListener<LocationSettingsResponse>() {
            @Override
            public void onComplete(@NonNull Task<LocationSettingsResponse> task) {
                try {
                    LocationSettingsResponse response = task.getResult(ApiException.class);
                    // All location settings are satisfied. The client can initialize location
                    // requests here.
                    startLocationUpdat();
                } catch (ApiException exception) {
                    switch (exception.getStatusCode()) {
                        case LocationSettingsStatusCodes.RESOLUTION_REQUIRED:
                            // Location settings are not satisfied. But could be fixed by showing the
                            // user a dialog.
                            try {
                                // Cast to a resolvable exception.
                                ResolvableApiException resolvable = (ResolvableApiException) exception;
                                // Show the dialog by calling startResolutionForResult(),
                                // and check the result in onActivityResult().
                                resolvable.startResolutionForResult(DrivermapApp.this, REQUEST_CHECK_SETTINGS);
                                break;
                            } catch (IntentSender.SendIntentException e) {
                                // Ignore the error.
                            } catch (ClassCastException e) {
                                // Ignore, should be an impossible error.
                            }
                            break;
                        case LocationSettingsStatusCodes.SETTINGS_CHANGE_UNAVAILABLE:
                            // Location settings are not satisfied. However, we have no way to fix the
                            // settings so we won't show the dialog.

                            break;
                    }
                }}
        });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String permissions[], @NonNull int[] grantResults) {
        mLocationPermissionGranted = false;
        switch (requestCode) {
            case REQUEST_LOCATION: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    mLocationPermissionGranted = true;
                }
            }
            break;
            case REQUEST_PERMISSIONS_REQUEST_CODE: {
                if (grantResults.length <= 0) {
                    Log.i(TAG, "User interaction was cancelled.");
                } else if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                        startLocationUpdat();

                } else {
                    showSnackbar(R.string.permission_denied_explanation,
                            R.string.settings, new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    // Build intent that displays the App settings screen.
                                    Intent intent = new Intent();
                                    intent.setAction(
                                            Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                                    Uri uri = Uri.fromParts("package",
                                            BuildConfig.APPLICATION_ID, null);
                                    intent.setData(uri);
                                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                    startActivity(intent);
                                }
                            });
                }
            }
            break;
        }


    }



    private void startLocationUpdat() {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            return;
        }
        if(mFusedLocationClient!=null ) {
            mFusedLocationClient.requestLocationUpdates(createLocationRequest(), new LocationCallback() {
                        @Override
                        public void onLocationResult(LocationResult locationResult) {
                            List<Location> locationList = locationResult.getLocations();
                            if (locationList.size() > 0) {
                                Location location = locationList.get(locationList.size() - 1);
                                Log.i("MapsActivity", "Location: " + location.getLatitude() + " " + location.getLongitude());
                                mCurrentLocation = location;
                                updateLocationUI();

                            }
                        }
                    },
                    Looper.myLooper());

        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        if (mGoogleApiClient != null) {
            mGoogleApiClient.connect();
        }
        if (checkPermissions()) {
                startLocationUpdat();

        } else {
            requestPermissions();
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
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

            if(pref.getCon()!=null){
                txt1.setText("Delivery");
            }
        getOrders();
        LocalBroadcastManager.getInstance(this).registerReceiver(mRegistrationBroadcastReceiver,
                new IntentFilter(Config_URL.REGISTRATION_COMPLETE));
        LocalBroadcastManager.getInstance(this).registerReceiver(mRegistrationBroadcastReceiver,
                new IntentFilter(Config_URL.PUSH_NOTIFICATION));
        NotificationUtils.clearNotifications(getApplicationContext());
    }

    private void getOrders() {
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_DETAILS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);

                            JSONArray Book_Ride_Now = jsonObj.getJSONArray("Book_Ride_Now");

                            if(Book_Ride_Now.length()!=0) {
                                for (int i = 0; i < Book_Ride_Now.length(); i++) {
                                    JSONObject c = Book_Ride_Now.getJSONObject(i);
                                    if (!c.isNull("Unique_Ride_Code") && !c.getString("Unique_Ride_Code").contains("null") ) {
                                        pref.setNoOfOrders(Book_Ride_Now.length());
                                        nooforders.setText(String.valueOf(Book_Ride_Now.length()));
                                    }

                                }
                            }




                        } catch (JSONException ex) {
                            ex.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

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
                params.put("_mId", _PhoneNo);
                return params;
            }

        };
        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);

    }


    public String getLastTen(String str) {

        return str.length() <= 10 ? str : str.substring(str.length() - 10);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {

            case R.id.ordernos:
                if (_PhoneNo != null) {
                    Intent i = new Intent(DrivermapApp.this, Tabs_past_future_ride.class);
                    startActivity(i);
                    finish();
                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                }
                break;

            case R.id.pickup:
                if (_PhoneNo != null) {
                    Intent i = new Intent(DrivermapApp.this, Tabs_past_future_ride.class);
                    startActivity(i);
                    finish();
                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                }
                break;

            case R.id.call_driver:
                if (User_mobile != null) {
                    String phn=getLastTen(User_mobile);
                    Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + phn));
                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    startActivity(intent);
                }
                break;
            case R.id.ride_later:

                if (_PhoneNo != null) {
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("Offline").setValue("YES");
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("OnRide").setValue("NO");
                    offline=true;
                    Ride_later.setBackgroundResource(R.color.colorPrimaryDark);
                    Ride_now.setBackgroundResource(R.color.black);
                    toolbar.setBackgroundResource(R.color.black);
                    ordernos.setBackgroundResource(R.drawable.black_round);
                    ordernos.setEnabled(false);
                    noOwner.setVisibility(View.VISIBLE);
                    noOwner.setText("You are offline now!");

                    pref.setOffline(1);
                    if(marker!=null) {
                        marker.setVisible(false);
                    }
                    _off1=false;
                    _off2=false;
                }
                break;
            case R.id.ride_now:
                offline=false;
                pref.setOffline(0);
                Ride_now.setBackgroundResource(R.color.colorPrimaryDark);
                toolbar.setBackgroundResource(R.color.colorPrimaryDark);
                Ride_later.setBackgroundResource(R.color.black);
                ordernos.setBackgroundResource(R.drawable.right_background);
                ordernos.setEnabled(true);
                noOwner.setVisibility(View.GONE);
                noOwner.setText("You are offline now!");

                if(_PhoneNo!=null) {
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("First_Latitude").setValue(dft.format(My_lat));
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("First_Longitude").setValue(dft.format(My_long));
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("Driver_Phone_no").setValue(_PhoneNo);
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("Offline").setValue("NO");
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("OnRide").setValue("NO");
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("Name").setValue(_Name);

                    Calendar c = Calendar.getInstance();
                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                    String formattedDate = df.format(c.getTime());
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("Driver_Online_Date").setValue(formattedDate);
                    if(googleMap!=null) {
                        if (marker != null) {
                            marker.setVisible(true);
                            marker.setPosition(new LatLng(My_lat, My_long));
                            marker.setAnchor(0.5f, 0.5f);
                        }else {

                                marker = googleMap.addMarker(new MarkerOptions()
                                        .position(new LatLng(My_lat, My_long))
                                        .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_bike)));
                                marker.setVisible(true);
                                marker.setAnchor(0.5f, 0.5f);

                        }
                    }
                    Myloc();
                   _off1=false;
                    _off2=false;
                }

                break;

            case R.id.myTrackButton:

                    if(pref.getDropLat()!=null) {
                        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://maps.google.com/maps?" +
                                "saddr=" + My_lat + "," + My_long + "&daddr=" + Double.parseDouble(pref.getDropLat()) + "," + Double.parseDouble(pref.getDropLong()) + "&sensor=false&units=metric&mode=driving"));
                        intent.setClassName("com.google.android.apps.maps", "com.google.android.maps.MapsActivity");
                        startActivity(intent);
                    }

                break;

            case R.id.myLocationCustomButton:
                if (My_lat != 0) {
                    CameraPosition position = new CameraPosition.Builder()
                            .target(new LatLng(My_lat, My_long)) // Sets the new camera position
                            .zoom(18) // Sets the zoom
                            .bearing(360) // Rotate the camera
                            // Set the camera tilt
                            .build(); // Crea
                    DrivermapApp.this.googleMap.animateCamera(CameraUpdateFactory
                            .newCameraPosition(position));
                }
                break;

            case R.id.confirm_ride:

                  new PostStartData().execute();

                break;
            case R.id.get_there:

                mDatabase.child("sendit").child(pref.getCon()).child("ask").setValue(String.valueOf(4));
                Stop_ride.setVisibility(View.VISIBLE);
                Got_location.setVisibility(View.GONE);
                break;
            case R.id.stop_ride:

                    if (pref.getCon() != null) {
                        stop=true;
                        open_stop();
                    }

                break;
        }

    }

    private void open_stop() {
        Amb.setAnimation(animslideD);
        Amb.setVisibility(View.GONE);
        go=false;
        wait=false;
        stop=true;
        if (pref.getCon() != null ) {
            mDatabase.child("sendit").child(pref.getCon()).removeEventListener(flistner);
            Intent i = new Intent(DrivermapApp.this, Success.class);
            startActivity(i);
            finish();
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
        } else {
            Snackbar.make(coordinatorLayout, "Error!Please try again", Snackbar.LENGTH_LONG).show();

        }

    }





    private void Myloc() {
        if(googleMap!=null) {
            CameraPosition googlePlex;
            googlePlex = CameraPosition.builder()
                    .target(new LatLng(My_lat, My_long))
                    .zoom(18) // Sets the zoom
                    .bearing(bearing) // Rotate the camera
                    .build(); // Crea
            googleMap.animateCamera(CameraUpdateFactory.newCameraPosition(googlePlex));
        }
    }


    private class PostStartData  extends AsyncTask<Void, Integer, String> {


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
                        .addFormDataPart("User", User_mobile)
                        .addFormDataPart("OTP", String.valueOf(OTP))
                        .addFormDataPart("IP", mobileIp)
                        .build();

                Request request = new Request.Builder()
                        .url(Config_URL.START_RIDE)
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
                if (markerUser != null) {
                    markerUser.setVisible(false);
                }
                mDatabase.child("sendit").child(pref.getCon()).child("ask").setValue("5");
                mDatabase.child("sendit").child(pref.getCon()).child("Image").setValue(pref.getProfile());
                got=false;
                wait=false;
                Start_ride=false;
                go=true;
                toggleBottomSheet();

            }
        }
    }




    private boolean checkPermissions() {
        int permissionState = ActivityCompat.checkSelfPermission(this,
                Manifest.permission.ACCESS_FINE_LOCATION);
        return permissionState == PackageManager.PERMISSION_GRANTED;
    }

    private void requestPermissions() {
        boolean shouldProvideRationale =
                ActivityCompat.shouldShowRequestPermissionRationale(this,
                        Manifest.permission.ACCESS_FINE_LOCATION);

        // Provide an additional rationale to the user. This would happen if the user denied the
        // request previously, but didn't check the "Don't ask again" checkbox.
        if (shouldProvideRationale) {
            Log.i(TAG, "Displaying permission rationale to provide additional context.");
            showSnackbar(R.string.permission_rationale,
                    android.R.string.ok, new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            // Request permission
                            ActivityCompat.requestPermissions(DrivermapApp.this,
                                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                                    REQUEST_PERMISSIONS_REQUEST_CODE);
                        }
                    });
        } else {
            Log.i(TAG, "Requesting permission");
            // Request permission. It's possible this can be auto answered if device policy
            // sets the permission in a given state or the user denied the permission
            // previously and checked "Never ask again".
            ActivityCompat.requestPermissions(DrivermapApp.this,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    REQUEST_PERMISSIONS_REQUEST_CODE);
        }
    }

    private void showSnackbar(final int mainTextStringId, final int actionStringId,
                              View.OnClickListener listener) {
        Snackbar.make(
                findViewById(android.R.id.content),
                getString(mainTextStringId),
                Snackbar.LENGTH_INDEFINITE)
                .setAction(getString(actionStringId), listener).show();
    }





    private void updateLocationUI() {
        if(googleMap!=null) {
            if (mCurrentLocation != null && !offline) {
                My_lat = mCurrentLocation.getLatitude();
                My_long = mCurrentLocation.getLongitude();


                if (!animate) {

                    mDatabase.child("Driver_Online").child(_PhoneNo).child("First_Latitude").setValue(dft.format(My_lat));
                    mDatabase.child("Driver_Online").child(_PhoneNo).child("First_Longitude").setValue(dft.format(My_long));


                    if (pref.getCon() != null) {
                        if (marker != null) {
                            if (marker.getPosition().longitude != 0) {
                                if (com.google.maps.android.SphericalUtil.computeDistanceBetween(marker.getPosition(), new LatLng(My_lat, My_long)) > 20) {
                                    mDatabase.child("sendit").child(pref.getCon()).child("Driver_First_Latitude").setValue(dft.format(My_lat));
                                    mDatabase.child("sendit").child(pref.getCon()).child("Driver_First_Longitude").setValue(dft.format(My_long));
                                    animate = true;
                                    animateCarMove(marker, marker.getPosition(), new LatLng(My_lat, My_long));
                                }
                            } else {
                                marker.setPosition(new LatLng(My_lat, My_long));
                                Myloc();
                            }
                        } else {

                                marker = googleMap.addMarker(new MarkerOptions()
                                        .position(new LatLng(My_lat, My_long))
                                        .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_bike)));
                                marker.setAnchor(0.5f, 0.5f);

                        }

                        if(!wait || go){
                            Myloc();
                        }


                    } else  {
                        if (!offline) {
                            if (marker != null) {
                                if (marker.getPosition().longitude != 0) {
                                    if (com.google.maps.android.SphericalUtil.computeDistanceBetween(marker.getPosition(), new LatLng(My_lat, My_long)) > 20) {
                                        animate = true;
                                        animateCarMove(marker, marker.getPosition(), new LatLng(My_lat, My_long));
                                    }
                                } else {
                                    marker.setPosition(new LatLng(My_lat, My_long));
                                }
                            } else {

                                    marker = googleMap.addMarker(new MarkerOptions()
                                            .position(new LatLng(My_lat, My_long))
                                            .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_bike)));
                                    marker.setAnchor(0.5f, 0.5f);


                            }

                            marker.setVisible(true);

                        }
                        Myloc();
                    }


                }
            }else{
                startLocationUpdat();
            }
        }
    }


    private class FirebaseDataListener implements ValueEventListener {
     @Override
        public void onDataChange(DataSnapshot dataSnapshot) {

             if (dataSnapshot.getChildrenCount() != 0) {


                     if(!got && !wait && !go) {
                         if (dataSnapshot.child("Offline").getValue() != null ) {
                             String off = (String) dataSnapshot.child("Offline").getValue();
                             if (off.contains("NO")) {
                                 if (!_off1) {
                                     _off1 = true;
                                     Ride_now.setBackgroundResource(R.color.colorPrimaryDark);
                                     Ride_later.setBackgroundResource(R.color.black);
                                     ordernos.setBackgroundResource(R.drawable.right_background);
                                     ordernos.setEnabled(true);
                                     offline = false;
                                 }
                                 if (dataSnapshot.child("Ride").getValue() != null ) {
                                     String ride = (String) dataSnapshot.child("Ride").getValue();
                                     pref.setCon(ride);
                                     mDatabase.child("sendit").child(ride).addValueEventListener(new FirebaseDataListener_got());

                                 }else{
                                     if(pref.getDriverPhone()!=null) {
                                         mDatabase.child("sendit").addValueEventListener(new FirebaseDataListener_before_ride());
                                     }
                                 }

                             } else {
                                 if (!offline) {
                                     Ride_later.setBackgroundResource(R.color.black);
                                     Ride_now.setBackgroundResource(R.color.colorPrimaryDark);
                                     ordernos.setBackgroundResource(R.drawable.black_round);
                                     ordernos.setEnabled(false);
                                     offline = true;
                                     if (marker != null) {
                                         marker.setVisible(false);
                                     }
                                     noOwner.setVisibility(View.VISIBLE);
                                     noOwner.setText("You are offline now!");

                                 }
                             }
                         }
                     }

         }
        }

        @Override
        public void onCancelled(DatabaseError databaseError) {

        }
    }

    private class FirebaseDataListener_before_ride implements ValueEventListener {

        @Override
        public void onDataChange(DataSnapshot dataSnapshot) {


            long count = dataSnapshot.getChildrenCount();
            if (count != 0) {
                Map<String, Object> objectMap = null;

                objectMap = (HashMap<String, Object>)
                        dataSnapshot.getValue();
                assert objectMap != null;

                for (Object obj : objectMap.values()) {
                    if (obj instanceof Map) {

                        Map<String, Object> mapObj = (Map<String, Object>) obj;
                        if (mapObj.get("DriverMobile") != null ) {
                            String DriverMobile = mapObj.get("DriverMobile").toString();
                            if(DriverMobile.contains(pref.getDriverPhone()) && !drawn){
                                drawn=true;
                                getOrders();
                            }
                        }


                    }
                }
            }
        }

        @Override
        public void onCancelled(DatabaseError databaseError) {

        }
    }

    private void RegisterAlarmBroadcast() {
        _played=true;
        triggerAlarmManager(System.currentTimeMillis());
        getOrders();
    }

    public void onPrepared(MediaPlayer player) {
        player.start();
    }

    public void triggerAlarmManager(long alarmTriggerTime) {
        AlarmManager manager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);//get instance of alarm manager
        manager.set(AlarmManager.RTC_WAKEUP, (alarmTriggerTime), pendingIntent);
        //sst alarm manager with entered timer by converting into milliseconds
    }

    private class FirebaseDataListener_got implements ValueEventListener {


        private String _ask;
        private String From_Address;

        @Override
        public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
            if ( googleMap!=null ) {
               //Toast.makeText(getApplicationContext(),"1",Toast.LENGTH_SHORT).show();
                       if (dataSnapshot.getChildrenCount() != 0) {
                           _ask = (String) dataSnapshot.child("ask").getValue();

                           if (_ask != null) {
                               if (dataSnapshot.child("Book_To_Latitude").getValue() != null &&
                                       dataSnapshot.child("Book_To_Longitude").getValue() != null) {
                                   User_To_lat = Double.parseDouble(String.valueOf(dataSnapshot.child("Book_To_Latitude").getValue()));
                                   User_To_long = Double.parseDouble(String.valueOf(dataSnapshot.child("Book_To_Longitude").getValue()));
                                   pref.setDropLat(String.valueOf(User_To_lat));
                                   pref.setDropLong(String.valueOf(User_To_long));

                               }

                               if (dataSnapshot.child("Cost").getValue() != null) {

                                       Cost = String.valueOf(dataSnapshot.child("Cost").getValue());
                                       pref.setCost(String.valueOf(dataSnapshot.child("Cost").getValue()));

                               }

                               if (dataSnapshot.child("From_Address").getValue() != null) {
                                   if (From_Address == null) {
                                       From_Address =String.valueOf(dataSnapshot.child("From_Address").getValue());
                                       text_dialog.setText("Address :-" + From_Address);
                                   }
                               }
                               if(User_mobile==null) {
                                   User_mobile = String.valueOf(dataSnapshot.child("UserMobile").getValue());
                                   pref.setUserMobile(User_mobile);
                               }
                               if (dataSnapshot.child("OTP").getValue() != null) {
                                   if (OTP == 0) {
                                       OTP = Integer.parseInt(String.valueOf(dataSnapshot.child("OTP").getValue()));
                                       text_otp.setText("ORDER ID :-" + String.valueOf(OTP));
                                       pref.setOrder(String.valueOf(OTP));
                                   }
                                   if (dataSnapshot.child("ask").getValue() != null) {
                                       _ask = String.valueOf(dataSnapshot.child("ask").getValue());

                                   }

                                   if (_ask == null) {
                                       wait = false;
                                       go = false;
                                       stop = false;
                                       got = false;

                                   } else {


                                       if (_ask != null && _ask.contains("4") && !got) {
                                           wait = false;
                                           got = false;
                                           go = false;
                                         //  toggleBottomSheet();

                                       }
                                       if (_ask != null && _ask.contains("5")) {
                                           wait = false;
                                           got = false;
                                           go = true;
                                           stop = false;
                                           Start_ride = true;
                                           nooforders.setText("1");
                                           toggleBottomSheet();
                                       }
                                       if (_ask != null && _ask.contains("6")) {
                                           wait = false;
                                           go = false;
                                           stop = false;
                                           if(pref.getCon()!=null) {
                                               mDatabase.child("sendit").child(pref.getCon()).removeEventListener(flistner);
                                               Intent i = new Intent(DrivermapApp.this, Success.class);
                                               startActivity(i);
                                               finish();
                                               overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                           }
                                       }
                                   }

                                   if (User_mobile == null) {
                                       mDatabase.child("sendit").child(pref.getCon()).removeValue();
                                       finish();
                                       overridePendingTransition(0, 0);
                                       startActivity(getIntent());
                                       overridePendingTransition(0, 0);
                                   }
                               }
                           }
                       }
            }
        }
        @Override
        public void onCancelled(@NonNull DatabaseError databaseError) {

        }
    }


    public void toggleBottomSheet() {

        if (sheetBehavior.getState() != BottomSheetBehavior.STATE_EXPANDED) {
            sheetBehavior.setState(BottomSheetBehavior.STATE_EXPANDED);
            sheetBehavior.setPeekHeight(0);
            sheetBehavior.setHideable(true);
            layoutBottomSheet.setVisibility(View.VISIBLE);
        }




            if(wait && !drawn1){
                drawn1=true;
                Lr.setAnimation(animslideD);
                Lr.setVisibility(View.GONE);
                Rl.setAnimation(animslideU);
                Rl.setVisibility(View.VISIBLE);
                Confirm_ride.setAnimation(animslideU);
                Confirm_ride.setText(R.string.startrace);
                Confirm_ride.setVisibility(View.VISIBLE);
                myTrackButton.setVisibility(View.VISIBLE);
                Stop_ride.setVisibility(View.GONE);
                Amb.setVisibility(View.GONE);
                Confirm_ride.setClickable(true);
                if (marker != null) {
                    marker.setVisible(true);
                    marker.setPosition(new LatLng(My_lat, My_long));
                    marker.setAnchor(0.5f, 0.5f);
                } else {

                        marker = googleMap.addMarker(new MarkerOptions()
                                .position(new LatLng(My_lat, My_long))
                                .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_bike)));
                        marker.setAnchor(0.5f, 0.5f);


                }
                if (markerUser != null) {
                    markerUser.setPosition(new LatLng(User_To_lat, User_To_long));
                    markerUser.setVisible(true);

                } else {
                    markerUser = googleMap.addMarker(new MarkerOptions()
                            .position(new LatLng(User_To_lat, User_To_long))
                            .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_person)));

                }
                ArrayList<Marker> markerAll = new ArrayList<Marker>();
                markerAll.add(marker);
                markerAll.add(markerUser);
                Myloc();
                SetZoomGot(marker.getPosition(), markerUser.getPosition());
            }
            if(go && !drawn3){
                drawn3=true;
                Rl.setAnimation(animslideU);
                Rl.setVisibility(View.VISIBLE);
                Confirm_ride.setAnimation(animslideD);
                Confirm_ride.setVisibility(View.GONE);
                Stop_ride.setAnimation(animslideU);
                Stop_ride.setVisibility(View.VISIBLE);
                Amb.setVisibility(View.GONE);
                Lr.setVisibility(View.GONE);
                pickup.setVisibility(View.GONE);
                myTrackButton.setVisibility(View.VISIBLE);
                myLocationButton.setVisibility(View.GONE);
                if(googleMap!=null) {
                    googleMap.setTrafficEnabled(true);
                }
                if (markerUser != null) {
                    markerUser.setVisible(false);
                }

                _car=true;
                car=false;
                draw();

            }
        if(got && !drawn2){
            drawn2=true;

        }

    }

    private void draw() {
        if( googleMap!=null && pref.getCon()!=null ) {

            if (marker != null) {
                marker.setPosition(new LatLng(My_lat,My_long));
                marker.setAnchor(0.5f,0.5f);

            } else {

                    marker = googleMap.addMarker(new MarkerOptions()
                            .position(new LatLng(My_lat,My_long))
                            .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_bike)));
                    marker.setAnchor(0.5f,0.5f);
                    marker.setTag("");
                    marker.setTitle("");


            }
            if (markerd != null) {
                markerd.setPosition(new LatLng(User_To_lat,User_To_long));
                markerd.setAnchor(0.5f,0.5f);

            } else {
                markerd = googleMap.addMarker(new MarkerOptions()
                        .position(new LatLng(User_To_lat,User_To_long))
                        .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_person)));
                markerd.setAnchor(0.5f,0.5f);
                markerd.setTag("");
                markerd.setTitle("");
            }
            //Myloc();
            if(!car && User_To_lat!=0 ) {
                car=true;
                SetZoomGot(marker.getPosition(), markerd.getPosition());
            }
        }
    }


    public void SetZoomGot(final LatLng markeruser1, final LatLng markerCar1) {
        if (googleMap != null) {
            if (markeruser1 != null && markerCar1 != null) {
                markerPoints = new ArrayList<LatLng>();
                markerPoints.clear();
                markerPoints.add(markeruser1);
                markerPoints.add(markerCar1);
                if (markerPoints.size() == 2) {
                    LatLng origin = markerPoints.get(0);
                    LatLng dest = markerPoints.get(1);
                    String url = getDirectionsUrl(origin, dest);
                    new DownloadTask().execute(url);
                }

            }
        } else {
            mapFragment.getMapAsync(DrivermapApp.this);

        }
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();

    }



    public void onMapReady(final GoogleMap map) {

        if (map == null) {
            //Ride_now.setEnabled(false);
            if(!DrivermapApp.this.isFinishing()) {
                new AlertDialog.Builder(DrivermapApp.this,R.style.AlertDialogTheme)
                        .setIcon(R.mipmap.ic_launcher)
                        .setTitle("Cannot load Google Map")
                        .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.cancel();
                            }
                        })
                        .show();
            }
        } else {
            coordinatorLayout.setVisibility(View.VISIBLE);
            googleMap = map;
            googleMap.setMinZoomPreference(16f);
            googleMap.setMaxZoomPreference(18f);
            googleMap.getUiSettings().setMyLocationButtonEnabled(false);
            googleMap.getUiSettings().setCompassEnabled(true);
            if (My_lat == 0) {
                if(pref.getPickLat()!=null ) {
                    My_lat= Double.parseDouble(pref.getPickLat());
                    My_long= Double.parseDouble(pref.getPickLong());

                }

            }else{
                startLocationUpdat();
            }

            googleMap.setOnMapLoadedCallback(new GoogleMap.OnMapLoadedCallback() {
                @Override
                public void onMapLoaded() {
                    if (_PhoneNo != null) {

                        if (pref.getCon() != null) {
                            if (pref.getPickLat() != null) {
                                markerPoints = new ArrayList<LatLng>();
                                markerPoints.clear();
                                markerPoints.add(new LatLng(My_lat, My_long));
                                markerPoints.add(new LatLng(User_To_lat, User_To_long));

                                if (markerPoints.size() == 2) {
                                    LatLng origin = markerPoints.get(0);
                                    LatLng dest = markerPoints.get(1);
                                    String url = getDirectionsUrl(origin, dest);
                                    new DownloadTask().execute(url);

                                }
                            }
                            mDatabase.child("sendit").child(pref.getCon()).addValueEventListener(flistner);

                        } else {
                            Lr.setAnimation(animslideU);
                            Lr.setVisibility(View.VISIBLE);
                            noOwner.setAnimation(animslideD);
                            noOwner.setVisibility(View.GONE);

                            mDatabase.child("Driver_Online").child(_PhoneNo).child("Driver_Vehicle_no").setValue(pref.getVehicleNo());
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("First_Latitude").setValue(dft.format(My_lat));
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("First_Longitude").setValue(dft.format(My_long));
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("Driver_Phone_no").setValue(_PhoneNo);
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("Driver_Photo").setValue(pref.getProfile());
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("Offline").setValue("NO");
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("OnRide").setValue("NO");
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("Name").setValue(pref.getName());
                            Calendar c = Calendar.getInstance();
                            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                            String formattedDate = df.format(c.getTime());
                            mDatabase.child("Driver_Online").child(_PhoneNo).child("Driver_Online_Date").setValue(formattedDate);
                            if (marker != null) {
                                marker.setVisible(true);
                                marker.setPosition(new LatLng(My_lat, My_long));
                                marker.setAnchor(0.5f, 0.5f);
                            }else {


                                    marker = googleMap.addMarker(new MarkerOptions()
                                            .position(new LatLng(My_lat, My_long))
                                            .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_bike)));
                                    marker.setVisible(true);
                                    marker.setAnchor(0.5f, 0.5f);

                            }
                            Myloc();

                        }

                            mDatabase.child("Driver_Online").child(_PhoneNo).addValueEventListener(new FirebaseDataListener());

                    }

                }


            });
        }
    }


    @Override
    public void onBackPressed() {

        if (doubleBackToExitPressedOnce) {
            finish();
        } else {
            Toast.makeText(getApplicationContext(), "Press Back again to Exit.", Toast.LENGTH_SHORT).show();

            doubleBackToExitPressedOnce = true;
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    doubleBackToExitPressedOnce = false;

                }
            }, 1000);

        }

    }



    private String getDirectionsUrl(LatLng origin, LatLng dest) {
        String str_origin = "origin=" + origin.latitude + "," + origin.longitude;
        String str_dest = "destination=" + dest.latitude + "," + dest.longitude;
        String sensor = "sensor=false";
        String parameters = str_origin + "&" + str_dest + "&" + sensor;
        String output = "json";
        return "https://maps.googleapis.com/maps/api/directions/" + output + "?" + parameters +"&key="+Config_URL.APIKEY;

    }




    private class DownloadTask extends AsyncTask<String, Void, String> {

        // Downloading data in non-ui thread
        @Override
        protected String doInBackground(String... url) {

            // For storing data from web service
            String data = "";

            try{
                // Fetching the data from web service
                data = downloadUrl(url[0]);
            }catch(Exception e){
                Log.d("Background Task",e.toString());
            }
            return data;
        }

        // Executes in UI thread, after the execution of
        // doInBackground()
        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);

            ParserTask parserTask = new ParserTask();

            // Invokes the thread for parsing the JSON data
            parserTask.execute(result);
        }
    }

    /** A method to download json data from url */
    private String downloadUrl(String strUrl) throws IOException {
        String data = "";
        InputStream iStream = null;
        HttpURLConnection urlConnection = null;
        try{
            URL url = new URL(strUrl);

            // Creating an http connection to communicate with url
            urlConnection = (HttpURLConnection) url.openConnection();

            // Connecting to url
            urlConnection.connect();

            // Reading data from url
            iStream = urlConnection.getInputStream();

            BufferedReader br = new BufferedReader(new InputStreamReader(iStream));

            StringBuffer sb  = new StringBuffer();

            String line = "";
            while( ( line = br.readLine())  != null){
                sb.append(line);
            }

            data = sb.toString();

            br.close();

        }catch(Exception e){
            Log.d("Exception ", e.toString());
        }finally{
            if (iStream != null) {
                iStream.close();
            }
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
        }
        return data;
    }

    private class ParserTask extends AsyncTask<String, Integer, List<List<HashMap<String, String>>>> {


        private double distance = 0;
        private double Total_cost = 0;

        // Parsing the data in non-ui thread
        @Override
        protected List<List<HashMap<String, String>>> doInBackground(String... jsonData) {

            JSONObject jObject;
            List<List<HashMap<String, String>>> routes = null;

            try {
                jObject = new JSONObject(jsonData[0]);
                DirectionsJSONParser parser = new DirectionsJSONParser();

                // Starts parsing data
                routes = parser.parse(jObject);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return routes;
        }

        // Executes in UI thread, after the parsing process
        @Override
        protected void onPostExecute(List<List<HashMap<String, String>>> result) {
            ArrayList<LatLng> points = null;
            MarkerOptions markerOptions = new MarkerOptions();
            String duration = "";
            Random rand = new Random();
            LatLngBounds.Builder builder1 = new LatLngBounds.Builder();
            for (int i = 0; i < result.size(); i++) {
                points = new ArrayList<LatLng>();
                lineOptions = new PolylineOptions();

                // Fetching i-th route
                List<HashMap<String, String>> path = result.get(i);

                // Fetching all the points in i-th route
                for (int j = 0; j < path.size(); j++) {
                    HashMap<String, String> point = path.get(j);

                    if (j == 0) {    // Get distance from the list
                        String pars = point.get("distance");
                        String[] pars1 = pars.split(" ");
                        String[] pars2 = pars1[0].split("\\.");
                        distance = Double.parseDouble(pars2[0]);

                        continue;
                    } else if (j == 1) { // Get duration from the list
                        duration = point.get("duration");
                        if (wait || got) {
                            if (marker != null) {
                                //marker.showInfoWindow();
                                marker.setTitle(duration);
                            }
                        }
                        continue;
                    }

                    double lat = Double.parseDouble(point.get("lat"));
                    double lng = Double.parseDouble(point.get("lng"));
                    LatLng position = new LatLng(lat, lng);

                    points.add(position);
                    builder1.include(position);
                }


                lineOptions.addAll(points);
                lineOptions.width(18);
                lineOptions.startCap(new SquareCap());
                lineOptions.endCap(new SquareCap());
                lineOptions.jointType(ROUND);
                lineOptions.color(Color.argb(255, rand.nextInt(256), rand.nextInt(256), rand.nextInt(256)));

            }
            if (lineOptions != null) {
                LatLngBounds bounds1 = builder1.build();
                polylineFinal = googleMap.addPolyline(lineOptions);
                int width = getResources().getDisplayMetrics().widthPixels;
                int height = getResources().getDisplayMetrics().heightPixels;
                int padding = (int) (width * 0.20); // offset from edges of the map 10% of screen
                CameraUpdate cu = CameraUpdateFactory.newLatLngBounds(bounds1, width, height, padding);
                googleMap.animateCamera(cu);
            }

            if(!_car && wait &&  googleMap!=null && pref.getCon()!=null ) {
                _car=true;

                if (markerd != null) {
                    markerd.setPosition(new LatLng(User_To_lat,User_To_long));
                    markerd.setAnchor(0.5f,0.5f);

                } else {

                    markerd = googleMap.addMarker(new MarkerOptions()
                            .position(new LatLng(User_To_lat,User_To_long))
                            .icon(BitmapDescriptorFactory.fromResource(R.mipmap.ic_pin_green)));
                    markerd.setAnchor(0.5f,0.5f);
                    markerd.setTag("");
                    markerd.setTitle("");

                }
            }

        }
        }


        private void animateCarMove(final Marker anmarker, final LatLng beginLatLng, final LatLng endLatLng) {
            final Handler handler = new Handler();
            animate = true;
            final long startTime = SystemClock.uptimeMillis();
            final Interpolator interpolator = new LinearInterpolator();
            float angleDeg1 = (float) (com.google.maps.android.SphericalUtil.computeHeading(beginLatLng, endLatLng));
            anmarker.setRotation(angleDeg1);
            handler.post(new Runnable() {


                @Override
                public void run() {
                    long elapsed = SystemClock.uptimeMillis() - startTime;
                    float t = interpolator.getInterpolation((float) elapsed / 3000);
                    double lat = (endLatLng.latitude - beginLatLng.latitude) * t + beginLatLng.latitude;
                    double lngDelta = endLatLng.longitude - beginLatLng.longitude;

                    if (Math.abs(lngDelta) > 180) {
                        lngDelta -= Math.signum(lngDelta) * 360;
                    }
                    double lng = lngDelta * t + beginLatLng.longitude;
                    anmarker.setPosition(new LatLng(lat, lng));
                    anmarker.setAnchor(0.5f, 0.5f);
                    if (t < 1.0) {
                        handler.postDelayed(this, 16);
                    } else {
                        animate = false;
                          }

                }
            });
        }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_save, menu);
        return true;

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            case R.id.action_save:
                pref.clearSession();
                pref.createLogin(null,null);
                pref.setResponsibility(0);
                pref.packagesharedPreferences(null);
                pref.set_food_money(0);
                pref.setTotal(null);
                pref.setTotal2(null);
                pref.setUniqueRide(null);
                pref.packagesharedPreferences(null);
                pref.set_food_items(0);
                pref.set_food_money(0);
                pref.set_ride(0);
                pref.set_cID(0);
                pref.setPickAt1(null);
                pref.setDropAt1(null);
                pref.set_food_money(0);
                pref.set_food_items(0);
                pref.setPickLat1(null);
                pref.setPickLong1(null);
                pref.setNoOfOrders(0);
                pref.setUserMobile(null);
                pref.setOrder(null);
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
                Intent i = new Intent(DrivermapApp.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
