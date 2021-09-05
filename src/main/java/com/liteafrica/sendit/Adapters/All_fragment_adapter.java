package com.liteafrica.sendit.Adapters;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;
import com.google.android.material.snackbar.Snackbar;
import com.liteafrica.sendit.AppController;
import com.liteafrica.sendit.Config_URL;
import com.liteafrica.sendit.Model._menu;
import com.liteafrica.sendit.PrefManager;
import com.liteafrica.sendit.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static com.liteafrica.sendit.Activites.Canteen.Canteen_Mainactivity.getScreenOrientation;

/**
 * Created by parag on 20/04/17.
 */
public class All_fragment_adapter extends RecyclerView.Adapter<All_fragment_adapter.ViewHolder> {

    private LayoutInflater ashit;
    private ArrayList<String> mService;
    private PrefManager pref;
    private TextView _iValue;
    private int _ID=0;
    private LinearLayout L1;
    private Context mContext;
    private CoordinatorLayout coordinatorLayout;
    private LinearLayout layoutBottomSheet;
    private EditText Search_2;
    private Button cancel;
    private RecyclerView salonrv;
    private RecyclerView moreRv;
    private ProgressBar progressBar;

    public All_fragment_adapter(Context acontext, ArrayList<String> mService){
        this.mService=mService;
        this.mContext=acontext;



    }
    @Override
    public All_fragment_adapter.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.all_fragment_first_rv, viewGroup, false);
        ViewHolder viewHolder = new All_fragment_adapter.ViewHolder(v);

        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull final ViewHolder viewHolder, final int position) {

        viewHolder.hadapter1.setNestedScrollingEnabled(true);
        viewHolder.Name.setText( mService.get(position));
        viewHolder.hadapter1.setNestedScrollingEnabled(false);
        pref.setCancel2(mService.get(position));
        go(mContext,mService.get(position),viewHolder.hadapter1);

    }



    @Override
    public int getItemCount() {
        return mService == null ? 0 : mService.size();
    }



    public void setCoordinatorlayout(CoordinatorLayout coordinatorLayout1) {
        coordinatorLayout=coordinatorLayout1;
    }

    public void setFrom(int i) {
        if(i==1){
         //   pref.setID3(pref.getFrom2());
        }
    }

    public void setSearch(EditText search_3) {
        Search_2=search_3;
    }

    public void setCancel(Button cancel1) {
        cancel=cancel1;
    }

    public void setSecondRv(RecyclerView salonrv1) {
        salonrv=salonrv1;
    }

    public void setFirstRv(RecyclerView moreRv1) {
        moreRv=moreRv1;
    }

    public void setprogress(ProgressBar progressBar1) {
        progressBar=progressBar1;
    }


    public class ViewHolder extends RecyclerView.ViewHolder {


        private EditText Name,Pin;
        private RecyclerView hadapter1;

        public ViewHolder(View itemView) {
            super(itemView);
            Name = (EditText) itemView.findViewById(R.id.my_service_all);
            hadapter1= (RecyclerView) itemView.findViewById(R.id.all_fragment_rv2);


        }

    }



    public int getSpan() {
        int orientation = getScreenOrientation(mContext);
        return orientation == Configuration.ORIENTATION_PORTRAIT ? 2 : 2;
    }


    public void setPref(PrefManager pref1) {
        pref = pref1;
    }

    public void setValues(TextView itemValue) {
        _iValue = itemValue;
    }

    private void go(final Context mContext, final String itemmenu, final RecyclerView hadapter1) {

        final ArrayList<_menu>mItems=new ArrayList<_menu>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.GET_FOODSS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.e("submenu", response);
                        try {

                            JSONObject jsonObj = new JSONObject(response);
                            JSONArray Eat = jsonObj.getJSONArray("second");
                            if (Eat.length() != 0) {
                                for (int i = 0; i < Eat.length(); i++) {
                                    JSONObject c = Eat.getJSONObject(i);
                                    if (!c.isNull("Name")) {
                                        _menu item = new _menu();
                                        item.setID(c.getInt("ID"));
                                        item.setPhoto(c.getString("Photo"));
                                        item.setName(c.getString("Name"));
                                        item.setDiscount(c.getDouble("Discount"));
                                        item.setSubsubmenu(c.getString("Subsubmenu"));
                                        item.setMenu(c.getString("Menu"));
                                        item.setPrice(c.getDouble("senditPrice")-c.getDouble("Discount"));
                                        item.setDetails(c.getString("Description"));
                                        item.seteTEZ_Price(c.getDouble("senditPrice"));
                                        item.setClosing_time(c.getString("PrimaryCategory"));
                                        item.setStock(c.getInt("Unit"));
                                        item.setIsOutOfStock(c.getInt("isOutOfStock"));
                                        item.setIDCanteen(c.getInt("IDCanteen"));
                                        mItems.add(item);
                                    }
                                }

                            }

                         


                        } catch (final JSONException e) {
                            Log.e("HI", "Json parsing error: " + e.getMessage());


                        }


                        secondadapter hadapter = new secondadapter(mContext,mItems);
                        LinearLayoutManager mHorizontal = new LinearLayoutManager(mContext, LinearLayoutManager.VERTICAL, false);
                        hadapter.notifyDataSetChanged();
                        hadapter.setPref(pref);
                        hadapter.setSearch(Search_2);
                        hadapter.setSecondRv(salonrv);
                        hadapter.setFirstRv(moreRv);
                        hadapter.setValues(_iValue);
                        hadapter.setCancel(cancel);
                        hadapter.setprogress(progressBar);
                        moreRv.setVisibility(View.VISIBLE);
                        hadapter1.setVisibility(View.VISIBLE);
                        hadapter1.setItemAnimator(new DefaultItemAnimator());
                        hadapter1.setAdapter(hadapter);
                        hadapter1.setLayoutManager(mHorizontal);

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
                params.put("submenu", itemmenu);
                params.put("cid", String.valueOf(pref.get_cID()));
                return params;
            }

        };
        AppController.getInstance().addToRequestQueue(eventoReq);

    }



}

