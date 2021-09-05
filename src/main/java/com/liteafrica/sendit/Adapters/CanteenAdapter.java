package com.liteafrica.sendit.Adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.liteafrica.sendit.Model.Eats;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;

import java.util.ArrayList;
import java.util.Date;

public class CanteenAdapter extends RecyclerView.Adapter<CanteenAdapter.MyViewHolder> {

    private Context mContext;
    private ArrayList<Eats> albumList;
    public  String Op_time,Cl_time;
    private String Mn_order;
    private PrefManager pref;
    private Date timeToCompare;
    private boolean _closed=false;
    private Date beforeTime;
    private int _time=0;
    private String Mn_time;
    private String _phoneNo;
    private ImageLoader imageLoader;
    public void setPref(PrefManager pref1) {
        pref=pref1;
    }

    public void setTime(int i) {
        _time=i;
    }

    public void setPhoneNo(String phoneNo) {
        _phoneNo=phoneNo;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        private TextView _homeservice;



        public MyViewHolder(View view) {
            super(view);
            _homeservice = view.findViewById(R.id.primary_text);
        }
    }


    public CanteenAdapter(Context mContext, ArrayList<Eats> albumList) {
        this.mContext = mContext;
        this.albumList = albumList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.secondcard, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, final int position) {
        _closed=false;
        final Eats album = albumList.get(position);
        holder._homeservice.setText(album.getName(position));



            }





    @Override
    public int getItemCount() {
        return albumList.size();
    }



}