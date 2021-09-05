package com.liteafrica.sendit.Adapters;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.google.android.gms.maps.model.LatLng;
import com.liteafrica.sendit.Activites.Canteen.Canteen_Details;
import com.liteafrica.sendit.Activites.Canteen.SingleProduct;
import com.liteafrica.sendit.Activites.Main_Page.GooglemapApp;
import com.liteafrica.sendit.LruBitmapCache;
import com.liteafrica.sendit.Model.Eats;
import com.liteafrica.sendit.Model._menu;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Set;

public class secondadapter extends RecyclerView.Adapter<secondadapter.ViewHolder> {

    private ArrayList<_menu> mPostItems;
    private Context mContext;
    private PrefManager pref;
    private TextView _iValue;
    private int itemSelected=0;
    private double _orderValue=0;
    private DecimalFormat df = new DecimalFormat("0.00");
    private ArrayList<String>_foods=new ArrayList<String>();
    private EditText Search_2;
    private RecyclerView salonrv;
    private Button cancel;
    private RecyclerView moreRv;
    private String search;
    private ProgressBar progressBar;


    public secondadapter(Context mContext,ArrayList<_menu> postItems) {
        this.mContext = mContext;
        this.mPostItems = postItems;

    }

    public void setprogress(ProgressBar progressBar1) {
        progressBar=progressBar1;
    }

    public void setFirstRv(RecyclerView moreRv1) {
        moreRv=moreRv1;
    }

    public void setCancel(Button cancel1) {
        cancel=cancel1;
    }
    public void setSecondRv(RecyclerView salonrv1) {
        salonrv=salonrv1;
    }

    @Override
    public secondadapter.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.new_horizontal_recyle, viewGroup, false);
        ViewHolder viewHolder = new secondadapter.ViewHolder(v);

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull final ViewHolder holder, final int position) {

        final _menu album = mPostItems.get(position);
        holder.Name.setText(album.getName(position));


        if(position==mPostItems.size()-1){
            progressBar.setVisibility(View.GONE);
           // moreRv.setVisibility(View.VISIBLE);
        }

        holder.rrr.setVisibility(View.VISIBLE);
        holder.outofstock.setVisibility(View.GONE);
        String url;
        if(!TextUtils.isEmpty(album.getPhoto(position))) {
     url = album.getPhoto(position).replaceAll(" ", "%20");
            Picasso.Builder builder = new Picasso.Builder(mContext);
            builder.listener(new Picasso.Listener() {
                @Override
                public void onImageLoadFailed(Picasso picasso, Uri uri, Exception exception) {
                    exception.printStackTrace();
                }
            });
            builder.build().load(url).into(holder._Photo);
}

        holder._Photo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent o = new Intent(mContext, SingleProduct.class);
                pref.setPref2(1);
                pref.setID5(album.getID(position));
                mContext.startActivity(o);
                ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });
           // holder.button2_plus.setVisibility(View.GONE);

            if (pref.get_packagesharedPreferences() != null) {
                Set<String> set = pref.get_packagesharedPreferences();
                _foods.clear();
                _foods.addAll(set);
                for (String s : set) {
                    String[] pars = s.split("\\_");
                    if (Integer.parseInt(pars[0]) == mPostItems.get(position).getID(position)) {
                        holder.rrr.setAnimation(AnimationUtils.loadAnimation(mContext,
                                R.anim.slide_up1));
                        holder.rrr.setVisibility(View.VISIBLE);
                        holder._noItem.setText(pars[1]);
                        break;
                    }
                }
            }

            if (pref.get_food_items() != 0) {
                _iValue.setText(String.valueOf(pref.get_food_items()));
                _orderValue = pref.get_food_money();
                pref.set_food_money((float) _orderValue);
                pref.setTotal(String.valueOf(_orderValue));
              //  _mValue.setText("R" + df.format(pref.get_food_money()));

            } else {
                pref.set_food_money(0);
            }


        //progressBar.setVisibility(View.GONE);

        if (mPostItems.get(position).getDiscount(position) != 0) {
            holder.Discount.setText("R" + df.format(album.getDiscount(position)) + " off");
            double dis = album.geteTEZ_Price(position);
            holder.DiscountP.setText("R" + df.format((dis)));
        } else {
            holder.Discount.setVisibility(View.GONE);
            holder.V1.setVisibility(View.GONE);
            holder.I1.setVisibility(View.GONE);
        }


        if (album.getDetails(position) != null) {
            holder._details.setText(album.getDetails(position));
        } else {
            holder._details.setVisibility(View.GONE);

        }

        if (album.getPrice(position) != 0) {
            holder.Price.setText(String.valueOf("R" + df.format(album.getPrice(position))));

        } else {
            holder.Price.setVisibility(View.GONE);

        }




        holder._add.setOnClickListener(new View.OnClickListener() {



            @Override
            public void onClick(View v) {
                if (pref.getStart() == 0) {
                    boolean _again = false;
                    int Rate_ = Integer.parseInt(holder._noItem.getText().toString());
                        Rate_ = 1 + Rate_;
                        _orderValue = pref.get_food_money() + mPostItems.get(position).getPrice(position);
                        pref.set_food_money((float) _orderValue);
                        pref.setTotal(String.valueOf(_orderValue));
                        holder._noItem.setText(String.valueOf(Rate_));
                        if (pref.get_packagesharedPreferences() != null) {
                            Set<String> set = pref.get_packagesharedPreferences();
                            _foods.clear();
                            _foods.addAll(set);
                        }
                        for (int i = 0; i < _foods.size(); i++) {
                            String[] pars = _foods.get(i).split("\\_");
                            if (mPostItems.get(position).getID(position) == Integer.parseInt(pars[0])) {
                                String s = pars[0];
                                _foods.remove(i);
                                _again = true;
                                _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * mPostItems.get(position).getPrice(position)) + "_" + mPostItems.get(position).getName(position) + "_" + String.valueOf(mPostItems.get(position).getIDCanteen(position)));
                            }

                        }
                        if (!_again) {
                            itemSelected = pref.get_food_items();
                            itemSelected = itemSelected + 1;
                            pref.set_food_items(itemSelected);
                            _foods.add(String.valueOf(mPostItems.get(position).getID(position) + "_" + 1 + "_" + String.valueOf(mPostItems.get(position).getPrice(position)) + "_" + mPostItems.get(position).getName(position)) + "_" + String.valueOf(mPostItems.get(position).getIDCanteen(position)));
                        }
                        pref.packagesharedPreferences(_foods);
                        _iValue.setText(String.valueOf(pref.get_food_items()));



                }else {
                    if (!((Activity) mContext).isFinishing()) {
                        new AlertDialog.Builder(mContext, R.style.AlertDialogTheme)
                                .setTitle("Your order is already in process")
                                .setMessage("Please check the status of your order")
                                .setPositiveButton("Check", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(mContext, GooglemapApp.class);

                                        ((Activity) mContext).startActivity(o);
                                        ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
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
        });
        holder._minus.setOnClickListener(new View.OnClickListener() {


            @Override
            public void onClick(View v) {
                if (pref.getStart() == 0) {
                    int Rate_ = Integer.parseInt(holder._noItem.getText().toString());
                    if (Rate_ > 0) {
                        Rate_ = Rate_ - 1;
                        holder._noItem.setText(String.valueOf(Rate_));
                        _orderValue = pref.get_food_money() - mPostItems.get(position).getPrice(position);
                        pref.set_food_money((float) _orderValue);
                        pref.setTotal(String.valueOf(_orderValue));
                        if (pref.get_packagesharedPreferences() != null) {
                            Set<String> set = pref.get_packagesharedPreferences();
                            _foods.clear();
                            _foods.addAll(set);
                        }
                        for (int i = 0; i < _foods.size(); i++) {
                            String[] pars = _foods.get(i).split("\\_");
                            if (mPostItems.get(position).getID(position) == Integer.parseInt(pars[0])) {
                                String s = pars[0];
                                _foods.remove(i);
                                _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * mPostItems.get(position).getPrice(position)) + "_" + mPostItems.get(position).getName(position) + "_" + String.valueOf(mPostItems.get(position).getIDCanteen(position)));

                            }

                        }
                        pref.packagesharedPreferences(_foods);
                    }

                    if (Rate_ == 0) {
                        holder._noItem.setText("0");
                        for (int i = 0; i < _foods.size(); i++) {
                            String[] pars = _foods.get(i).split("\\_");
                            if (mPostItems.get(position).getID(position) == Integer.parseInt(pars[0])) {
                                _foods.remove(i);

                                itemSelected = pref.get_food_items();
                                itemSelected = itemSelected - 1;
                                pref.set_food_items(itemSelected);
                                _iValue.setText(String.valueOf(pref.get_food_items()));
                            }

                        }
                        pref.packagesharedPreferences(_foods);
                        if (itemSelected == 0) {
                            pref.packagesharedPreferences(null);
                            pref.set_food_money(0);
                            pref.set_food_items(0);
                            pref.setTotal(null);
                            pref.setTotal2(null);
                        }
                    }

                }else {
                    if (!((Activity) mContext).isFinishing()) {
                        new AlertDialog.Builder(mContext, R.style.AlertDialogTheme)
                                .setTitle("Your order is already in process")
                                .setMessage("Please check the status of your order")
                                .setPositiveButton("Check", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(mContext, GooglemapApp.class);

                                        ((Activity) mContext).startActivity(o);
                                        ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
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
        });

        holder._noItem.addTextChangedListener(new TextWatcher() {

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {

            }

            @Override
            public void beforeTextChanged(CharSequence s, int start, int count,
                                          int after) {
                TranslateAnimation animObj = new TranslateAnimation(0, 0, 0, holder._noItem.getHeight());
                animObj.setDuration(1000);
                holder._noItem.startAnimation(animObj);

            }
        });


        Search_2.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence cs, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start,
                                      int before, int count) {



            }

            @Override
            public void afterTextChanged(Editable editable) {
                String s=editable.toString();

                if (s.length() >= 1 ) {

                    final ArrayList<_menu> filteredModelList = new ArrayList<>();
                    cancel.setVisibility(View.VISIBLE);
                    for (int i = 0; i < mPostItems.size(); i++) {
                        _menu model = mPostItems.get(i);
                        final String text = model.getName(i).toLowerCase();
                        if (text.contains(String.valueOf(s).toLowerCase())) {
                            filteredModelList.add(model);
                        }
                    }
                    if (filteredModelList.size() != 0) {
                        moreRv.setVisibility(View.GONE);
                        salonrv.setVisibility(View.VISIBLE);
                        secondadapter hadapter = new secondadapter(mContext,filteredModelList);
                        LinearLayoutManager mHorizontal = new LinearLayoutManager(mContext, LinearLayoutManager.VERTICAL, false);
                        hadapter.notifyDataSetChanged();
                        hadapter.setPref(pref);
                        hadapter.setSearch(Search_2);
                        hadapter.setSecondRv(salonrv);
                        hadapter.setFirstRv(moreRv);
                        hadapter.setValues(_iValue);
                        hadapter.setCancel(cancel);
                        salonrv.setVisibility(View.VISIBLE);
                        salonrv.setItemAnimator(new DefaultItemAnimator());
                        salonrv.setAdapter(hadapter);
                        salonrv.setLayoutManager(mHorizontal);

                    }
                } else {
                    moreRv.setVisibility(View.VISIBLE);
                    salonrv.setVisibility(View.GONE);
                }
            }
        });
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }


    @Override
    public int getItemCount() {
        return mPostItems.size();
    }



    public class ViewHolder extends RecyclerView.ViewHolder {

        private final ImageView _Photo;
        private TextView Count,Name;
        private TextView Price,Discount,DiscountP,_details,outofstock;
        private LinearLayout rrr;
        private ImageButton _minus,_add;
        private EditText _noItem;
        private View V1;
        private ImageView I1;

        public ViewHolder(View itemView) {
            super(itemView);
            Discount = (TextView) itemView.findViewById(R.id.discount_1);
            DiscountP = (TextView) itemView.findViewById(R.id.discountprice_1);
            Name = (TextView) itemView.findViewById(R.id._name1);
            Price = itemView.findViewById(R.id.price_1);
            _Photo = itemView.findViewById(R.id.service_pic);
            rrr = itemView.findViewById(R.id._rrr1);
            _minus = itemView.findViewById(R.id.button2_minus1);
            _add = itemView.findViewById(R.id.button2_add1);
            _noItem = itemView.findViewById(R.id.rate_km1);
            _details=itemView.findViewById(R.id._details1);
            outofstock=itemView.findViewById(R.id.outofstock);
            V1=itemView.findViewById(R.id.V1);
            I1=itemView.findViewById(R.id.I1);
        }

    }






    public void setPref(PrefManager pref1) {
        pref = pref1;
    }



    public void setValues(TextView itemValue) {
        _iValue = itemValue;
    }


    public void setSearch(EditText search_3) {
        Search_2=search_3;
    }



    private void setNon(double v) {
        itemSelected = pref.get_food_items();
        itemSelected = itemSelected - 1;
        pref.set_food_items(itemSelected);
        _iValue.setText(String.valueOf(pref.get_food_items()));
        _orderValue = pref.get_food_money() - v;
        pref.set_food_money((float) _orderValue);
      //  _mValue.setText("R" + df.format(pref.get_food_money()));

    }

    private void setPrice(double v) {
        itemSelected = pref.get_food_items();
        itemSelected = itemSelected + 1;
        pref.set_food_items(itemSelected);
        _iValue.setText(String.valueOf(pref.get_food_items()));
        _orderValue = pref.get_food_money() + v;
        pref.set_food_money((float) _orderValue);
       // _mValue.setText("R" + df.format(pref.get_food_money()));
    }

}
