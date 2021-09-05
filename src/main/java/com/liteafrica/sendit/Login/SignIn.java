package com.liteafrica.sendit.Login;

import android.app.Activity;
import android.app.Dialog;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.util.Patterns;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatEditText;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.app.NotificationCompat;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.snackbar.Snackbar;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.ActionCodeSettings;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Details;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Mainactivity;
import com.liteafrica.sendit.Activites.Canteen.PopulateShops;
import com.liteafrica.sendit.Activites.Canteen.ProductDetailsPage;
import com.liteafrica.sendit.Activites.Canteen.SendImageforDelivery;
import com.liteafrica.sendit.Activites.Canteen.SingleProduct;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.Activites.Main_Page.UserSuccess;
import com.liteafrica.sendit.Activites.Ride_Later.ContactUs;
import com.liteafrica.sendit.Activites.Ride_Later.Ride_later_tabs;
import com.liteafrica.sendit.Activites.Searching.Item_selected;
import com.liteafrica.sendit.Activites.Splash_screen;
import com.liteafrica.sendit.Activites.Success;
import com.liteafrica.sendit.AppController;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.liteafrica.sendit.Requests.Tabs_past_future_ride;
import com.liteafrica.sendit.delivery.DrivermapApp;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class SignIn extends AppCompatActivity implements View.OnClickListener {
    private static final String TAG = SignIn.class.getSimpleName();
    private static final int MY_PERMISSIONS_REQUEST_USE_CAMERA = 1001;
    private static final int REQUEST_EXTERNAL_STORAGE = 1002;
    private static final int IMAGE_ = 1003;
    private PrefManager pref;
    private String _phoneNo;
    private CoordinatorLayout coordinatorLayout;
    private RelativeLayout afterAnimationView;
    private Button signup,forgot_pwd;
    private AppCompatEditText input_user_password,input_user_mobile;
    private String filePath;
    private ProgressBar progressBar;
    private Bitmap bm;
    private String salonmobileno;
    private boolean valid;
    private Dialog dialogWait;
    private FirebaseAuth mAuth;
    private PhoneAuthProvider.OnVerificationStateChangedCallbacks mCallbacks;
    private ActionCodeSettings actionCodeSettings;
    private int _from=0;
    private String User_image,User_name;
    private int version_=3,imp=1;
    private int version_1=0,_imp_1=1;
    private boolean _got;
    private DatabaseReference mDatabase;
    private boolean _second;
    private int _coming;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.signin);
        mDatabase = FirebaseDatabase.getInstance().getReference();
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _phoneNo = user.get(PrefManager.KEY_MOBILE);
        coordinatorLayout = findViewById(R.id
                .cor_home_main);
        progressBar=findViewById(R.id.progress_signup);
        forgot_pwd=findViewById(R.id.forgot_pwd);
        signup=findViewById(R.id.signup);
        forgot_pwd.setOnClickListener(SignIn.this);
        signup.setOnClickListener(this);
        input_user_password=findViewById(R.id.input_user_password);
        input_user_mobile=findViewById(R.id.input_user_mobile);


        mAuth= FirebaseAuth.getInstance();

        mCallbacks = new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {

            @Override
            public void onVerificationCompleted(PhoneAuthCredential credential) {
                // This callback will be invoked in two situations:
                // 1 - Instant verification. In some cases the phone number can be instantly
                //     verified without needing to send or enter a verification code.
                // 2 - Auto-retrieval. On some devices Google Play services can automatically
                //     detect the incoming verification SMS and perform verification without
                //     user action.
                Log.d(TAG, "onVerificationCompleted:" + credential);

                signInWithPhoneAuthCredential(credential);
            }

            @Override
            public void onVerificationFailed(FirebaseException e) {
                // This callback is invoked in an invalid request for verification is made,
                // for instance if the the phone number format is not valid.
                Log.w(TAG, "onVerificationFailed", e);

               ViewDialogVerify alert = new ViewDialogVerify();
                alert.showDialog(SignIn.this, "Verification failed. Please check mobile no.",false);

            }

            @Override
            public void onCodeSent(@NonNull String verificationId,
                                   @NonNull PhoneAuthProvider.ForceResendingToken token) {
                // The SMS verification code has been sent to the provided phone number, we
                // now need to ask the user to enter the code and then construct a credential
                // by combining the code with a verification ID.
                Log.d(TAG, "onCodeSent:" + verificationId);

                open_otp(verificationId);
            }
        };

        actionCodeSettings =
                ActionCodeSettings.newBuilder()
                        // URL you want to redirect back to. The domain (www.example.com) for this
                        // URL must be whitelisted in the Firebase Console.
                        .setUrl("https://groomme.page.link/download")
                        // This must be true
                        .setHandleCodeInApp(true)
                        .setAndroidPackageName(
                                "com.zanrite.groomme",
                                true, /* installIfNotAvailable */
                                "19"    /* minimumVersion */)
                        .build();
    }


    @Override
    protected void onResume() {
        super.onResume();
        Intent i=getIntent();
        _coming=i.getIntExtra("from",0);


    Intent intent = getIntent();
    _from=intent.getIntExtra("from",0);

        input_user_mobile.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(final CharSequence s, int start,
                                      int before, int count) {
                if(pref.getID3()==0) {

                    if (s.toString().length() >= 10) {
                        if (TextUtils.isDigitsOnly(s)) {
                            if (isValidPhoneNumber(input_user_mobile.getText().toString())) {
                            //    input_user_mobile.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_phone, 0, R.mipmap.ic_cor, 0);
                                input_user_password.requestFocus();
                            }
                        }
                    }
                }
            }

            @Override
            public void afterTextChanged(final Editable editable) {

            }
        });
    }


    public static boolean isValidEmail(CharSequence target) {
        return (!TextUtils.isEmpty(target) && Patterns.EMAIL_ADDRESS.matcher(target).matches());
    }

    private static boolean isValidPhoneNumber(String phone) {
        boolean check=false;
        if(!Pattern.matches("[a-zA-Z]+", phone)) {
            String[] str2 =phone.split("");
            int j=0;
            for (String s : str2) {
                if (!TextUtils.isEmpty(s)) {
                    j++;
                }
            }
            check = j == 10 || j == 13;
        }
        return check;

    }


    @Override
    public void onClick(View view) {
        switch (view.getId()){
          

            case R.id.signup:
                
                    if(!TextUtils.isEmpty(input_user_mobile.getText().toString())){
                            if(!TextUtils.isEmpty(input_user_password.getText().toString())){
                            valid=true;
                            }else{
                                Toast.makeText(getApplicationContext(),"Please input password",Toast.LENGTH_SHORT).show();
                                input_user_password.requestFocus();
                            }
                       
                    }else{
                        Toast.makeText(getApplicationContext(),"Please input  mobile no",Toast.LENGTH_SHORT).show();
                        input_user_mobile.requestFocus();
                    }

                if(valid) {
                        if(TextUtils.isDigitsOnly(input_user_mobile.getText().toString())) {
                            checkEmail();

                        }

                }
                break;
            case R.id.forgot_pwd:
                Intent o = new Intent(SignIn.this, SmsActivity.class);
                o.putExtra("from", 1);
                startActivity(o);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                break;
            default:
                break;
        }
    }

    private void checkEmail() {
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.URL_SIGNIN,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.w("kk", response.toString());


                        try {

                            String[] par = response.split("error");
                            if (par[1].contains("false")) {
                                String[] pars_ = par[1].split("false,");
                                JSONObject jObj = new JSONObject("{".concat(pars_[1]));
                                JSONObject user = jObj.getJSONObject("user");
                                if (user.getInt("role") == 1 || user.getInt("role") == 2|| user.getInt("role") == 3) {
                                    pref.setDriverPhone(input_user_mobile.getText().toString());
                                    pref.setResponsibility(user.getInt("role"));
                                    pref.createLogin(user.getString("ID"), user.getString("Name"));
                                    ViewDialogFailedSuccess alert = new ViewDialogFailedSuccess();
                                    alert.showDialog(SignIn.this, "Success! Welcome to SendIt ", false);
                                } else {
                                    ViewDialogFailed alert = new ViewDialogFailed();
                                    alert.showDialog(SignIn.this, "No user found with the information!", true);
                                }
                            }else{
                                ViewDialogFailed alert = new ViewDialogFailed();
                                alert.showDialog(SignIn.this, "Please check the information provided!", true);
                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }



                    }


                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                vollyError(error);
            }

        }) {
            @Override
            protected Map<String, String> getParams() {
                // Posting parameters to login url
                Map<String, String> params = new HashMap<String, String>();
                params.put("role",String.valueOf(0));
                params.put("mobile",input_user_mobile.getText().toString());
                params.put("password", input_user_password.getText().toString());
                return params;
            }

        };

        // Añade la peticion a la cola
        AppController.getInstance().addToRequestQueue(eventoReq);

    }

    private void signInWithPhoneAuthCredential(PhoneAuthCredential credential) {

        mAuth.signInWithCredential(credential)
                .addOnCompleteListener(SignIn.this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        Log.d(TAG, "task.isSuccessful" + String.valueOf(task.isSuccessful()));
                        if (task.isSuccessful()) {
                            ViewDialogVerify alert = new ViewDialogVerify();
                            alert.showDialog(SignIn.this, "Verified mobile no. Please proceed.",true);

                            // ...
                        } else {
                            // Sign in failed, display a message and update the UI
                            Log.w(TAG, "signInWithCredential:failure", task.getException());
                            if (task.getException() instanceof FirebaseAuthInvalidCredentialsException) {
                                ViewDialogVerify alert = new ViewDialogVerify();
                                alert.showDialog(SignIn.this, "Verification failed. Please check mobile no.",false);

                            }
                        }
                    }
                });
    }

    private void open_otp(final String verificationId) {
        if(!SignIn.this.isFinishing()) {
            final Dialog dialog = new Dialog(SignIn.this, R.style.ThemeTransparent);
            if(dialogWait!=null){
                dialogWait.dismiss();
            }

            dialog.setContentView(R.layout.custom_dialog_otp);
            final EditText Otp = dialog.findViewById(R.id.inputOtp_ride);
            Button Start = dialog.findViewById(R.id.btn_dialog);
            WebView _webview = dialog.findViewById(R.id.webView);
            _webview.setBackgroundColor(Color.TRANSPARENT); //for gif without background
            _webview.loadUrl("file:///android_asset/verify.gif");
            _webview.getSettings().setLoadsImagesAutomatically(true);
            _webview.getSettings().setLoadWithOverviewMode(true);
            _webview.getSettings().setUseWideViewPort(true);
            dialog.setCancelable(true);

            Start.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    if (TextUtils.isEmpty(Otp.getText().toString())) {
                        Toast.makeText(getApplicationContext(), "Please input OTP", Toast.LENGTH_SHORT).show();
                    }else {
                        PhoneAuthCredential credential = PhoneAuthProvider.getCredential(verificationId, Otp.getText().toString());
                        mAuth.signInWithCredential(credential)
                                .addOnCompleteListener(SignIn.this, new OnCompleteListener<AuthResult>() {
                                    @Override
                                    public void onComplete(@NonNull Task<AuthResult> task) {
                                        if (task.isSuccessful()) {
                                            dialog.dismiss();
                                            ViewDialogVerify alert = new ViewDialogVerify();
                                            alert.showDialog(SignIn.this, "Verified mobile no. Please proceed.",true);
                                        } else {
                                            if (task.getException() instanceof FirebaseAuthInvalidCredentialsException) {

                                                ViewDialogVerify alert = new ViewDialogVerify();
                                                alert.showDialog(SignIn.this, "Verification failed. Please check mobile no.",false);
                                            }
                                        }
                                    }
                                });

                    }
                    dialog.cancel();
                }
            });


            dialog.show();
        }

    }

    public class ViewDialogVerify {

        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                final Dialog dialog1 = new Dialog(activity);
                dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog1.setCancelable(true);
                dialog1.setContentView(R.layout.custom_dialog_verify);
                WebView _webview = dialog1.findViewById(R.id.webView);
                _webview.setBackgroundColor(Color.TRANSPARENT); //for gif without background
                _webview.loadUrl("file:///android_asset/verify.gif");
                _webview.getSettings().setLoadsImagesAutomatically(true);
                _webview.getSettings().setLoadWithOverviewMode(true);
                _webview.getSettings().setUseWideViewPort(true);
                TextView text = dialog1.findViewById(R.id.text_dialog);
                text.setText(msg);

                Button dialogButton = dialog1.findViewById(R.id.btn_dialog);

                if(noDate){
                    dialogButton.setVisibility(View.VISIBLE);
                }else {
                    dialogButton.setVisibility(View.GONE);
                }

                dialogButton.setText("Ok");
                if(dialogWait!=null) {
                    dialogWait.dismiss();
                }
                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                       checkEmail();
                        dialog1.dismiss();
                    }
                });

                dialog1.show();


            }
        }
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

    public class ViewDialogFailedSuccess {

        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                final Dialog dialog1 = new Dialog(activity);
                dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog1.setCancelable(false);
                dialog1.setContentView(R.layout.custom_dialog_success);
                TextView text = dialog1.findViewById(R.id.text_dialog);
                text.setText(msg);

                Button dialogButton = dialog1.findViewById(R.id.btn_dialog);



                dialogButton.setText("Ok");

                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                       launchHomeScreen();
                        dialog1.dismiss();
                    }
                });

                dialog1.show();


            }
        }
    }

    private void launchHomeScreen() {
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _phoneNo = user.get(PrefManager.KEY_MOBILE);
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.GET_DETAILS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);

                            JSONArray Book_Ride_Now = jsonObj.getJSONArray("Book_Ride_Now");





                            JSONArray version = jsonObj.getJSONArray("version");

                            for (int i = 0; i < version.length(); i++) {
                                JSONObject c = version.getJSONObject(i);

                                if (!c.isNull("Version")) {
                                    _got=true;
                                    version_1=c.getInt("Version");
                                    _imp_1=c.getInt("Importance");
                                }
                            }
                            JSONArray shops = jsonObj.getJSONArray("shops");
                            for (int i = 0; i < shops.length(); i++) {
                                JSONObject c = shops.getJSONObject(i);

                                if (!c.isNull("Latitude")) {
                                    pref.setPickLat(c.getString("Latitude"));
                                    pref.setPickLong(c.getString("Longitude"));
                                }
                            }

                            JSONArray login = jsonObj.getJSONArray("login");
                            for (int i = 0; i < login.length(); i++) {
                                JSONObject c = login.getJSONObject(i);
                                if (!c.isNull("Phone_No")) {
                                    User_image = c.getString("Photo");
                                    User_name = c.getString("Name");


                                }
                            }





                            Book_Ride_Now = jsonObj.getJSONArray("Book_Ride_Now");


                            if(Book_Ride_Now.length()!=0) {
                                for (int i = 0; i < Book_Ride_Now.length(); i++) {
                                    JSONObject c = Book_Ride_Now.getJSONObject(i);
                                    if (!c.isNull("Unique_Ride_Code") && !c.getString("Unique_Ride_Code").contains("null") ) {
                                        pref.setNoOfOrders(Book_Ride_Now.length());
                                        pref.setUniqueRide(c.getString("Unique_Ride_Code"));
                                        pref.setDelivery(1);
                                        pref.setOrder(c.getString("OTP"));
                                        pref.setTotal(c.getString("Cost"));
                                        pref.set_food_items(c.getInt("CountNoofItems"));
                                        pref.setPayment(c.getInt("PaymentMode"));

                                    }else {
                                        erase();
                                    }

                                }
                            }else{
                                erase();

                            }


                        } catch (JSONException ex) {
                            ex.printStackTrace();
                        }

                        go_trough();
                        progressBar.setVisibility(View.GONE);


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
                params.put("_mId", _phoneNo);
                return params;
            }

        };
        AppController.getInstance().addToRequestQueue(eventoReq);




    }

    private void erase() {
        pref.setUniqueRide(null);
        pref.packagesharedPreferences(null);
        pref.set_food_items(0);
        pref.set_food_money(0);
        pref.set_ride(0);
        pref.set_cID(0);
        pref.setPickAt1(null);
        pref.setDropAt1(null);
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
        pref.setStart(0);
        go_trough();
    }
    private void go_trough() {
        if(_got) {
            if (_imp_1 != imp) {
                if (!SignIn.this.isFinishing()) {
                    new AlertDialog.Builder(SignIn.this, R.style.AlertDialogTheme)
                            .setIcon(R.mipmap.ic_launcher)
                            .setTitle("Update Sendit")
                            .setMessage("A new version of Sendit is available!")
                            .setPositiveButton("Update", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    String url = "https://play.google.com/store/apps/details?id=" + getPackageName();
                                    Intent i = new Intent(Intent.ACTION_VIEW);
                                    i.setData(Uri.parse(url));
                                    startActivity(i);
                                    dialog.cancel();
                                }
                            })
                            .show();
                }
            } else {

                if (version_1 != version_) {
                    if (!SignIn.this.isFinishing()) {
                        new AlertDialog.Builder(SignIn.this, R.style.AlertDialogTheme)
                                .setTitle("Its time to update Sendit")
                                .setMessage("A new version of sendit is available!")
                                .setPositiveButton("Update", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        String url = "https://play.google.com/store/apps/details?id=" + getPackageName();
                                        Intent i = new Intent(Intent.ACTION_VIEW);
                                        i.setData(Uri.parse(url));
                                        startActivity(i);
                                        dialog.cancel();
                                    }
                                })
                                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {

                                        launchHomeScreen();

                                        dialog.cancel();
                                    }
                                })
                                .show();
                    }
                } else {
                    go_again();
                }
            }

        }else{
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Server Error. Please try another time", Snackbar.LENGTH_INDEFINITE)
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

    private void go_again() {
        if (User_image != null && !TextUtils.isEmpty(User_image)) {
            pref.setProfile(User_image);
        }


        if (User_name != null && !TextUtils.isEmpty(User_name)) {
            pref.setName(User_name);
        }


        if (pref.getUniqueRide()!=null) {
            if (!pref.getUniqueRide().equals("0")) {
                String[] pars = pref.getUniqueRide().split("\\.");
                String con = TextUtils.join("", pars);
                mDatabase.child("sendit").child(con).addValueEventListener(new FirebaseDataListener_after_ride());
            }else{
                finalGo();
            }

        } else {
           finalGo();
        }


    }

    private void finalGo() {
        Intent i = null;
        if(pref.getResposibility()==2) {
             i = new Intent(SignIn.this, DrivermapApp.class);

        }else if(pref.getResposibility()==3) {
             i = new Intent(SignIn.this, Tabs_past_future_ride.class);

        }else{

            if(_coming==1){
                i = new Intent(SignIn.this, Canteen_Mainactivity.class);
            }else if(_coming==2){
                i = new Intent(SignIn.this, Canteen_Details.class);
            }else if(_coming==3){
                i = new Intent(SignIn.this, PopulateShops.class);
            }else if(_coming==4){
                i = new Intent(SignIn.this, ProductDetailsPage.class);
            }else if(_coming==5){
                i = new Intent(SignIn.this, SendImageforDelivery.class);
            }else if(_coming==6){
                i = new Intent(SignIn.this, SingleProduct.class);
            }else if(_coming==7){
                i = new Intent(SignIn.this, GooglemapApp.class);
            }else if(_coming==8){
                i = new Intent(SignIn.this, ContactUs.class);
            }else if(_coming==9){
                i = new Intent(SignIn.this, Ride_later_tabs.class);
            }else if(_coming==10){
                i = new Intent(SignIn.this, Item_selected.class);
            }else{
                i = new Intent(SignIn.this, Canteen_Mainactivity.class);
            }

        }
        startActivity(i);
        finish();
        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
    }


    private class FirebaseDataListener_after_ride implements ValueEventListener {
        private String Cost;
        private String _paid;

        @Override
        public void onDataChange(DataSnapshot dataSnapshot) {
            _paid=(String) dataSnapshot.child("USERDONE").getValue();
            Cost=(String) dataSnapshot.child("COST").getValue();
            if (_paid != null) {
                if (!_paid.contains("DONE")) {
                    if(pref.getResposibility()==1) {
                        Intent i = new Intent(SignIn.this, UserSuccess.class);
                        startActivity(i);
                        finish();
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }else  if(pref.getResposibility()==2) {
                        Intent i = new Intent(SignIn.this, Success.class);
                        startActivity(i);
                        finish();
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }
                }
            }else{
                if(pref.getResposibility()==1) {
                    if (!_second) {
                        _second = true;
                        ArrayList<String> _foods1 = new ArrayList<String>();
                        String _foods = (String) dataSnapshot.child("Order").getValue();
                        if(_foods!=null) {
                            String[] pars = _foods.split("\\,");
                            if (pref.get_packagesharedPreferences().size() == 0) {
                                _foods1.clear();
                                for (int i = 0; i < pars.length; i++) {
                                    _foods1.add(pars[i]);
                                }
                                pref.packagesharedPreferences(_foods1);
                            }
                            pref.set_food_items(pars.length);
                            if (dataSnapshot.child("Payment").getValue() != null) {
                                String _payment = (String) dataSnapshot.child("Payment").getValue();
                                pref.setPayment(Integer.parseInt(_payment));
                            }
                        }
                        Intent i = new Intent(SignIn.this, GooglemapApp.class);
                        pref.set_ride(1);
                        startActivity(i);
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }
                }else  if(pref.getResposibility()==2) {
                    Intent i = new Intent(SignIn.this, DrivermapApp.class);
                    startActivity(i);
                    finish();
                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                }else  if(pref.getResposibility()==3) {
                    Intent i = new Intent(SignIn.this, Tabs_past_future_ride.class);
                    startActivity(i);
                    finish();
                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                }
            }
        }

        @Override
        public void onCancelled(DatabaseError databaseError) {

        }
    }


    private void vollyError(VolleyError error) {
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
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //replaces the default 'Back' button action
        if(keyCode== KeyEvent.KEYCODE_BACK)   {
            Intent o = new Intent(SignIn.this, ServiceOffer.class);
            startActivity(o);
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            finish();
        }
        return true;
    }


}
