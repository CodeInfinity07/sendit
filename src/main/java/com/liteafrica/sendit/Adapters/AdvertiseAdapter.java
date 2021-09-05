package com.liteafrica.sendit.Adapters;

import android.content.Context;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.liteafrica.sendit.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class AdvertiseAdapter extends RecyclerView.Adapter<AdvertiseAdapter.MyViewHolder> {

    private Context mContext;
    private ArrayList<String> albumList;



    public class MyViewHolder extends RecyclerView.ViewHolder {

        public TextView title;
        public ImageView thumbnail, overdelete;


        public MyViewHolder(View view) {
            super(view);
            thumbnail = (ImageView) view.findViewById(R.id.thumbnail);
        }
    }


    public AdvertiseAdapter(Context mContext, ArrayList<String> albumList) {
        this.mContext = mContext;
        this.albumList = albumList;
    }

    @Override
    public AdvertiseAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.adonlyrv, parent, false);

        return new AdvertiseAdapter.MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final AdvertiseAdapter.MyViewHolder holder, final int position) {

        Picasso.Builder builder = new Picasso.Builder(mContext);
        builder.listener(new Picasso.Listener() {
            @Override
            public void onImageLoadFailed(Picasso picasso, Uri uri, Exception exception) {
                exception.printStackTrace();
            }
        });
        builder.build().load(albumList.get(position)).into(holder.thumbnail);



    }


    @Override
    public int getItemCount() {
        return albumList.size();
    }
}