package com.liteafrica.sendit.Adapters;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.google.android.gms.maps.model.LatLng;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Details;
import com.liteafrica.sendit.LruBitmapCache;
import com.liteafrica.sendit.Model.Eats;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class NearAdapter extends RecyclerView.Adapter<NearAdapter.ViewHolder>  {

    // The items to display in your RecyclerView
    private ArrayList<Eats> mItems;
    protected List<Eats> list;
    private LayoutInflater mshit;

    private Context mContext;
    private int Name_p;
    private String User;
    private String rView;
    private ArrayList<Eats> mModel;
    private LatLng latLng;
    private int _from=0;
    private DecimalFormat dft = new DecimalFormat("0.00");
    private PrefManager pref;
    private int _deals=0;
    private CoordinatorLayout coordinatorLayout;


    public NearAdapter(Context acontext, ArrayList<Eats> mItems) {
        //mshit = LayoutInflater.from(acontext);
        this.mItems = mItems;
        this.mContext = acontext;



    }



    @Override
    public long getItemId(int position) {

        return super.getItemId(position);
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    public void setLatLong(LatLng latLng1) {
        latLng=latLng1;
    }

    public void setFrom(int from) {
        _from=from;
    }

    public void setPref(PrefManager pref1) {
        pref=pref1;
    }

    public void setDeals(int from) {
        _deals=from;
    }

    public void setCoordinate(CoordinatorLayout coordinatorLayout1) {
        coordinatorLayout=coordinatorLayout1;
    }


    public class ViewHolder extends RecyclerView.ViewHolder {

        private NetworkImageView images_p;
        private TextView _name,_secondarytext,address,discount;
        private Button booknow;
        private RelativeLayout _L1;
        private RatingBar ratingBar;
        private TextView discount_1;
        private Button button2_minus1;



        public ViewHolder(View itemView) {
            super(itemView);

            images_p = itemView.findViewById(R.id.img_profilo);
            _name= (TextView) itemView.findViewById(R.id.primary_text);
            _secondarytext= (TextView) itemView.findViewById(R.id.secondary_text);
            address= (TextView) itemView.findViewById(R.id.address);
            booknow=itemView.findViewById(R.id.booknow);
            _L1=itemView.findViewById(R.id._r1);
            ratingBar=itemView.findViewById(R.id.ratingBar);
            discount=itemView.findViewById(R.id.discount);
            button2_minus1=itemView.findViewById(R.id.button2_minus1);
        }


    }

    @Override
    public NearAdapter.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        View v;

             v = LayoutInflater.from(viewGroup.getContext())
                    .inflate(R.layout.nearrv, viewGroup, false);

        return new NearAdapter.ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(final NearAdapter.ViewHolder viewHolder, final int position) {
        final Eats movie = mItems.get(position);



        if (movie.getPhoto(position) != null) {
            String url =movie.getPhoto(position).replaceAll(" ", "%20");
            if(TextUtils.isEmpty(url)){
                url=movie.getcPhoto(position).replaceAll(" ", "%20");
            }
            ImageLoader imageLoader = LruBitmapCache.getInstance(mContext)
                    .getImageLoader();
            imageLoader.get(url, ImageLoader.getImageListener(viewHolder.images_p,
                    R.mipmap.ic_launcher, R.mipmap
                            .ic_launcher));
            viewHolder.images_p.setImageUrl(url, imageLoader);

            if (movie.getName(position) != null && !TextUtils.isEmpty(movie.getName(position))) {
                viewHolder._name.setText(movie.getName(position));
            }
            if (movie.getAddress(position) != null && !TextUtils.isEmpty(movie.getAddress(position))) {
                viewHolder.address.setText(movie.getAddress(position));
            }

                if (Name_p == 0) {
                        double dist2 = com.google.maps.android.SphericalUtil.computeDistanceBetween(new LatLng(movie.getLatitude(position), movie.getLonitude(position)), latLng)/ 1000;

                        viewHolder._secondarytext.setText(dft.format(dist2) + " Km");

                } else {
                    viewHolder._secondarytext.setVisibility(View.GONE);
                }
            if(_deals==1) {
                viewHolder.discount_1.setVisibility(View.VISIBLE);
                DecimalFormat df= new DecimalFormat("0");
                viewHolder.discount_1.setText(df.format(movie.getDiscount(position)) + "%\noff");
            }
            if (movie.getDiscount(position) != 0 ) {
                viewHolder.discount.setText(String.valueOf(movie.getDiscount(position)) + "% off");
            }else{
                viewHolder.discount.setVisibility(View.GONE);
            }

             viewHolder.ratingBar.setRating(Float.parseFloat(String.valueOf(movie.getRating(position))));




             viewHolder.button2_minus1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                    pref.set_cID(movie.getID(position));
                    pref.setName(movie.getName(position));
                    pref.setFrom1(2);
                    pref.setFrom2(movie.getID(position));
                    pref.setID1(2);
                    pref.setID3(movie.getID(position));
                    pref.setID2(movie.getID(position));
                    Intent o = new Intent(mContext, Canteen_Details.class);
                    mContext.startActivity(o);
                    ((Activity) mContext).finish();
                    ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });

        }
    }






    @Override
    public int getItemCount() {
        return mItems.size();
    }


}

