package com.liteafrica.sendit.Adapters;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.appcompat.app.AlertDialog;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Details;
import com.liteafrica.sendit.Activites.Canteen.SingleProduct;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.LruBitmapCache;
import com.liteafrica.sendit.Model.Eats;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Set;


/**
 * Created by parag on 22/09/16.
 */
public class Image_Adapter extends RecyclerView.Adapter<Image_Adapter.ViewHolder> {

    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm aa", Locale.US);
    SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
    // The items to display in your RecyclerView
    private ArrayList<Eats> mItems;
    private Context mContext;
    private String Mobile;
    private double My_lat = 0, My_long = 0;
    private CoordinatorLayout coordinatorLayout;
    private PrefManager pref;
    private TextView _iValue;
    private int itemSelected=0;
    private double _orderValue=0;
    private DecimalFormat df = new DecimalFormat("0.00");
    private ArrayList<String>_foods=new ArrayList<String>();
    private TextView orders;

    public Image_Adapter(Context aContext, ArrayList<Eats> mItems) {
        this.mItems = mItems;
        this.mContext = aContext;

    }


    @Override
    public long getItemId(int position) {
        return super.getItemId(position);
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }



    public void setPref(PrefManager pref1) {
        pref = pref1;
    }


    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.welcome_slide1, viewGroup, false);
        ViewHolder viewHolder = new ViewHolder(v);

        return viewHolder;
    }

    public void setCoordinatorlayout(CoordinatorLayout coordinatorLayout1) {
        coordinatorLayout=coordinatorLayout1;
    }


    @Override
    public void onBindViewHolder(final ViewHolder viewHolder, final int position) {
        final Eats album_pos = mItems.get(position);



        if (album_pos.getPhoto(position) != null) {
            String url = album_pos.getPhoto(position).replaceAll(" ", "%20");
            if (TextUtils.isEmpty(url)) {
                url = album_pos.getcPhoto(position).replaceAll(" ", "%20");
            }
            ImageLoader imageLoader = LruBitmapCache.getInstance(mContext)
                    .getImageLoader();
            imageLoader.get(url, ImageLoader.getImageListener(viewHolder._image1,
                    R.mipmap.ic_launcher, R.mipmap
                            .ic_launcher));
            viewHolder._image1.setImageUrl(url, imageLoader);
        }

            viewHolder.primary_name.setText(album_pos.getName(position));





        viewHolder.button2_minus1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pref.set_cID(album_pos.getID(position));
                pref.setName(album_pos.getName(position));
                Intent o = new Intent(mContext, Canteen_Details.class);
                mContext.startActivity(o);
                ((Activity) mContext).finish();
                ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });



    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }



    public class ViewHolder extends RecyclerView.ViewHolder {


        private TextView primary_name;
        private NetworkImageView _image1;
        private Button button2_minus1;
        private RelativeLayout _r1;
        

        public ViewHolder(View itemView) {
            super(itemView);


             _image1 =itemView.findViewById(R.id.wlcm1);
             button2_minus1=itemView.findViewById(R.id.button2_minus1);
            primary_name =itemView.findViewById(R.id.primary_name);
            _r1=itemView.findViewById(R.id._r1);
        }

    }


}





