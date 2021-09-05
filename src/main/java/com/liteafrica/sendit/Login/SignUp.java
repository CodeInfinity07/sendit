package com.liteafrica.sendit.Login;

import android.Manifest;
import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatEditText;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.ActionCodeSettings;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthOptions;
import com.google.firebase.auth.PhoneAuthProvider;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Details;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Mainactivity;
import com.liteafrica.sendit.Activites.Canteen.PopulateShops;
import com.liteafrica.sendit.Activites.Canteen.ProductDetailsPage;
import com.liteafrica.sendit.Activites.Canteen.SendImageforDelivery;
import com.liteafrica.sendit.Activites.Canteen.SingleProduct;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.Activites.Ride_Later.ContactUs;
import com.liteafrica.sendit.Activites.Ride_Later.Ride_later_tabs;
import com.liteafrica.sendit.Activites.Searching.Item_selected;
import com.liteafrica.sendit.Activites.Splash_screen;
import com.liteafrica.sendit.BuildConfig;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.liteafrica.sendit.Requests.Tabs_past_future_ride;
import com.liteafrica.sendit.delivery.DrivermapApp;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

public class SignUp extends AppCompatActivity implements View.OnClickListener {
    private static final String TAG = SignUp.class.getSimpleName();
    private static final int MY_PERMISSIONS_REQUEST_USE_CAMERA = 1001;
    private static final int REQUEST_EXTERNAL_STORAGE = 1002;
    private static final int IMAGE_ = 1003;
    private PrefManager pref;
    private String _phoneNo;
    private CoordinatorLayout coordinatorLayout;
    private RelativeLayout afterAnimationView;
    private Button signup,forgot_pwd;
    private AppCompatEditText input_user_name,input_user_password,input_user_mobile;
    private boolean Again;
    private Bitmap bitmap;
    private boolean permissionsAllowd;
    private int REQUEST_CAMERA = 0, SELECT_FILE = 1;
    private String filePath;
    private ProgressBar progressBar;
    private int _role=0;
    private Bitmap bm;
    private String salonmobileno;
    private boolean valid;
    private Dialog dialogWait;
    private FirebaseAuth mAuth;
    private PhoneAuthProvider.OnVerificationStateChangedCallbacks mCallbacks;
    private TextInputLayout _m0;
    private ActionCodeSettings actionCodeSettings;
    private ProgressDialog mProgressDialog;
    private boolean _clicked;
    private int _coming;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.signup);
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _phoneNo = user.get(PrefManager.KEY_MOBILE);
        coordinatorLayout = findViewById(R.id
                .cor_home_main);
        progressBar=findViewById(R.id.progress_signup);
        forgot_pwd=findViewById(R.id.forgot_pwd);
        signup=findViewById(R.id.signup);
        forgot_pwd.setOnClickListener(this);
        signup.setOnClickListener(this);
        input_user_name=findViewById(R.id.input_user_name);
        input_user_password=findViewById(R.id.input_user_password);
        input_user_mobile=findViewById(R.id.input_user_mobile);
        _m0=findViewById(R.id.mo);
        mAuth= FirebaseAuth.getInstance();

        mCallbacks = new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {

            @Override
            public void onVerificationCompleted(PhoneAuthCredential credential) {
                Log.d(TAG, "onVerificationCompleted:" + credential);
                signInWithPhoneAuthCredential(credential);
            }

            @Override
            public void onVerificationFailed(FirebaseException e) {
                Log.w(TAG, "onVerificationFailed", e);
                ViewDialogVerify alert = new ViewDialogVerify();
                alert.showDialog(SignUp.this, "Verification failed. Please check mobile no.",false);

            }

            @Override
            public void onCodeSent(@NonNull String verificationId,
                                   @NonNull PhoneAuthProvider.ForceResendingToken token) {
                Log.d(TAG, "onCodeSent:" + verificationId);
                open_otp(verificationId);
            }
        };

        actionCodeSettings =
                ActionCodeSettings.newBuilder()
                        // URL you want to redirect back to. The domain (www.example.com) for this
                        // URL must be whitelisted in the Firebase Console.
                        .setUrl("https://senditapp.page.link/download")
                        .setHandleCodeInApp(true)
                        .setAndroidPackageName(
                                "com.liteafrica.sendit",
                                true, /* installIfNotAvailable */
                                "19"    /* minimumVersion */)
                        .build();
    }


    @Override
    protected void onResume() {
        super.onResume();

        Intent i=getIntent();
        _coming=i.getIntExtra("from",0);

        input_user_mobile.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {


            }

            @Override
            public void onTextChanged(CharSequence s, int start,
                                      int before, int count) {
                if(s.toString().length()==10){
                    salonmobileno = "+27" + input_user_mobile.getText().toString();
                    //input_user_mobile.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_phone, 0, R.mipmap.ic_cor, 0);
                    input_user_password.requestFocus();


                }
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });



    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){


            case R.id.signup:


                    if( !TextUtils.isEmpty(input_user_mobile.getText().toString())){
                        if(!TextUtils.isEmpty(input_user_name.getText().toString())){
                            if(!TextUtils.isEmpty(input_user_password.getText().toString())){
                                if(input_user_password.getText().toString().length()>=8){
                                    valid=true;
                                }else{
                                    Toast.makeText(getApplicationContext(),"Password must be 8 charecter length",Toast.LENGTH_SHORT).show();
                                    input_user_password.requestFocus();
                                }
                            }else{
                                Toast.makeText(getApplicationContext(),"Please input password",Toast.LENGTH_SHORT).show();
                                input_user_password.requestFocus();
                            }
                        }else{
                            Toast.makeText(getApplicationContext(),"Please input name",Toast.LENGTH_SHORT).show();
                            input_user_name.requestFocus();
                        }
                    }else{
                        Toast.makeText(getApplicationContext(),"Please input  mobile no",Toast.LENGTH_SHORT).show();
                        input_user_mobile.requestFocus();
                    }

                if(valid) {
                        if((input_user_mobile.getText().toString().length()>=10)) {
                            salonmobileno = "+27" + input_user_mobile.getText().toString();
                            PhoneAuthOptions options =
                                    PhoneAuthOptions.newBuilder(mAuth)
                                            .setPhoneNumber(salonmobileno)       // Phone number to verify
                                            .setTimeout(60L, TimeUnit.SECONDS) // Timeout and unit
                                            .setActivity(this)                 // Activity (for callback binding)
                                            .setCallbacks(mCallbacks)          // OnVerificationStateChangedCallbacks
                                            .build();
                            PhoneAuthProvider.verifyPhoneNumber(options);
                            ViewDialogVerifyWait Firstalert = new ViewDialogVerifyWait();
                            Firstalert.showDialog(SignUp.this, "Verifying phone no. Please wait...", true);
                        }

                }
                break;
            case R.id.forgot_pwd:
                Intent o = new Intent(SignUp.this, SmsActivity.class);
                o.putExtra("from",_coming);
                startActivity(o);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                break;
            default:
                break;
        }
    }

    private void signInWithPhoneAuthCredential(PhoneAuthCredential credential) {

        mAuth.signInWithCredential(credential)
                .addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        Log.d(TAG, "task.isSuccessful" + String.valueOf(task.isSuccessful()));
                        if (task.isSuccessful()) {
                            new PostDataTOServer().execute();
                        } else {
                            // Sign in failed, display a message and update the UI
                            Log.w(TAG, "signInWithCredential:failure", task.getException());
                            if (task.getException() instanceof FirebaseAuthInvalidCredentialsException) {
                                ViewDialogVerify alert = new ViewDialogVerify();
                                alert.showDialog(SignUp.this, "Verification failed. Please check mobile no.",false);

                            }
                        }
                    }
                });
    }

    private void open_otp(final String verificationId) {
        if(!SignUp.this.isFinishing()) {
            final Dialog dialog = new Dialog(SignUp.this, R.style.ThemeTransparent);
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
                                .addOnCompleteListener(SignUp.this, new OnCompleteListener<AuthResult>() {
                                    @Override
                                    public void onComplete(@NonNull Task<AuthResult> task) {
                                        if (task.isSuccessful()) {
                                            dialog.dismiss();
                                            ViewDialogVerify alert = new ViewDialogVerify();
                                            alert.showDialog(SignUp.this, "Verified mobile no. Please proceed.",true);
                                        } else {
                                            if (task.getException() instanceof FirebaseAuthInvalidCredentialsException) {

                                                ViewDialogVerify alert = new ViewDialogVerify();
                                                alert.showDialog(SignUp.this, "Verification failed. Please check mobile no.",false);
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
                  //  signup.setEnabled(false);
                }

                dialogButton.setText("Ok");
                if(dialogWait!=null) {
                    dialogWait.dismiss();
                }
                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        new PostDataTOServer().execute();
                        dialog1.dismiss();
                    }
                });

                dialog1.show();


            }
        }
    }
    public class ViewDialogVerifyWait {

        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                dialogWait = new Dialog(activity);
                dialogWait.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialogWait.setCancelable(true);
                dialogWait.setContentView(R.layout.custom_dialog_verify);
                WebView _webview = dialogWait.findViewById(R.id.webView);
                _webview.setBackgroundColor(Color.TRANSPARENT); //for gif without background
                _webview.loadUrl("file:///android_asset/verify.gif");
                _webview.getSettings().setLoadsImagesAutomatically(true);
                _webview.getSettings().setLoadWithOverviewMode(true);
                _webview.getSettings().setUseWideViewPort(true);
                TextView text = dialogWait.findViewById(R.id.text_dialog);
                text.setText(msg);

                Button dialogButton = dialogWait.findViewById(R.id.btn_dialog);

                if(noDate){
                    dialogButton.setVisibility(View.VISIBLE);
                }else {
                    dialogButton.setVisibility(View.GONE);
                  //  signup.setEnabled(false);
                }

                dialogButton.setText("Ok");

                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if(pref.getID3()!=0){
                            new PostDataTOServer().execute();
                        }
                        dialogWait.dismiss();
                    }
                });
                if(noDate) {
                    dialogWait.show();
                }else {
                    dialogWait.dismiss();
                }


            }
        }
    }



    private class PostDataTOServer  extends AsyncTask<Void, Integer, String> {


        private boolean success;
        private File destination;
        private String fileImage;
        private MultipartBody requestBody;


        @Override
        protected void onPreExecute() {

            super.onPreExecute();
            if (!SignUp.this.isFinishing() ) {
                if(dialogWait!=null){
                    dialogWait.dismiss();
                }
                if (mProgressDialog == null) {
                    mProgressDialog = new ProgressDialog(SignUp.this, R.style.Theme_AppCompat_DayNight_Dialog_MinWidth);
                    mProgressDialog.setIcon(R.mipmap.ic_launcher);
                    mProgressDialog.setCancelable(false);
                    mProgressDialog.setTitle("Storing information.");
                    mProgressDialog.setMessage("please wait...");
                    mProgressDialog.setIndeterminate(false);
                    mProgressDialog.show();
                }


            }


            if(TextUtils.isEmpty(input_user_mobile.getText().toString())){
                input_user_mobile.setText("NA");
            }

        }

        protected String doInBackground(Void... args) {
            return uploadFile();
        }

        private String uploadFile() {
            // TODO Auto-generated method stub
            String res = null;
            final MediaType MEDIA_TYPE_PNG = MediaType.parse("image/*");

            try {

                    requestBody = new MultipartBody.Builder()
                            .setType(MultipartBody.FORM)
                            .addFormDataPart("mobile", input_user_mobile.getText().toString())
                            .addFormDataPart("username", input_user_name.getText().toString().toUpperCase())
                            .addFormDataPart("password", input_user_password.getText().toString().toUpperCase())
                            .addFormDataPart("image", "")
                            .build();

                Request request = new Request.Builder()
                        .url(Config_URL.URL_SIGNUP)
                        .post(requestBody)
                        .build();
                OkHttpClient client = new OkHttpClient.Builder()
                        .connectTimeout(120, TimeUnit.SECONDS)
                        .writeTimeout(120, TimeUnit.SECONDS)
                        .readTimeout(120, TimeUnit.SECONDS)
                        .build();
                okhttp3.Response response = client.newCall(request).execute();
                res = response.body().string();
                String[] par = res.split("error");
                if (par[1].contains("false")) {
                    String[] pars_ = par[1].split("false,");
                    JSONObject jObj = new JSONObject("{".concat(pars_[1]));
                    JSONObject user = jObj.getJSONObject("user");
                        pref.setResponsibility(user.getInt("role"));
                        pref.setDriverPhone(input_user_mobile.getText().toString());
                        success = par[1].contains("false");
                        pref.createLogin(user.getString("ID"), user.getString("Name"));


                }

                Log.e("TAG", "Response : " + res);

                return res;

            } catch (UnknownHostException | UnsupportedEncodingException e) {
                Log.e("TAG", "Error: " + e.getLocalizedMessage());
            } catch (Exception e) {
                Log.e("TAG", "Other Error: " + e.getLocalizedMessage());
                if(e.getLocalizedMessage()!=null && e.getLocalizedMessage().contains("timeout")){
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Slow connection.", Snackbar.LENGTH_LONG)
                            .setAction("Retry", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    new PostDataTOServer().execute();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                }
            }


            return res;

        }

        protected void onPostExecute(String file_url) {

            if (mProgressDialog != null) {
                mProgressDialog.dismiss();
            }

            if (success) {
                ViewDialogFailedSuccess alert = new ViewDialogFailedSuccess();
                alert.showDialog(SignUp.this, "Succesfully stored information.",false);

            }else{
                ViewDialogFailed alert = new ViewDialogFailed();
                alert.showDialog(SignUp.this, "Failed to store information! Please try another time.",true);
            }

        }


    }

    public class ViewDialogFailed {

        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                final Dialog dialog1 = new Dialog(activity);
                dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog1.setCancelable(true);

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
                dialog1.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                dialog1.getWindow().getAttributes().windowAnimations = R.style.DialogAnimation;
                TextView text = dialog1.findViewById(R.id.text_dialog);
                text.setText(msg);


                Button dialogButton = dialog1.findViewById(R.id.btn_dialog);



                dialogButton.setText("Ok");

                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {


                           getInfo();
                        dialog1.dismiss();
                    }
                });

                dialog1.show();


            }
        }
    }

    private void getInfo() {
        if(pref.getResposibility()==2) {
            Intent i = new Intent(SignUp.this, DrivermapApp.class);
            startActivity(i);
            finish();

        }else if(pref.getResposibility()==3) {
            Intent i = new Intent(SignUp.this, Tabs_past_future_ride.class);
            startActivity(i);
            finish();

        }else{
            Intent i = null;
            if(_coming==1){
                i = new Intent(SignUp.this, Canteen_Mainactivity.class);
            }else if(_coming==2){
                i = new Intent(SignUp.this, Canteen_Details.class);
            }else if(_coming==3){
                i = new Intent(SignUp.this, PopulateShops.class);
            }else if(_coming==4){
                i = new Intent(SignUp.this, ProductDetailsPage.class);
            }else if(_coming==5){
                i = new Intent(SignUp.this, SendImageforDelivery.class);
            }else if(_coming==6){
                i = new Intent(SignUp.this, SingleProduct.class);
            }else if(_coming==7){
                i = new Intent(SignUp.this, GooglemapApp.class);
            }else if(_coming==8){
                i = new Intent(SignUp.this, ContactUs.class);
            }else if(_coming==9){
                i = new Intent(SignUp.this, Ride_later_tabs.class);
            }else if(_coming==10){
                i = new Intent(SignUp.this, Item_selected.class);
            }else{
                i = new Intent(SignUp.this, Canteen_Mainactivity.class);
            }
            startActivity(i);
            finish();
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
        }

    }





    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //replaces the default 'Back' button action
        if(keyCode== KeyEvent.KEYCODE_BACK)   {

                    Intent o = new Intent(SignUp.this, ServiceOffer.class);
                    o.putExtra("from",_coming);
                    startActivity(o);
                    finish();
                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);


        }
        return true;
    }


    @Override
    protected void onStop() {
        super.onStop();
        if (mProgressDialog != null) {
            mProgressDialog.dismiss();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (mProgressDialog != null) {
            mProgressDialog.dismiss();
        }
    }
}
