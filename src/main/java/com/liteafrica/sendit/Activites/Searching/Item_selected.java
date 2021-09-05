package com.garima.garima.Searching;

import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;

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
import com.garima.garima.Activities.Mainactivity;
import com.garima.garima.Adapters.MainAdapter;
import com.garima.garima.Booking.CheckOut;
import com.garima.garima.Model.main;
import com.garima.garima.R;
import com.garima.garima.helper.AppController;
import com.garima.garima.helper.Config_URL;
import com.garima.garima.helper.PrefManager;
import com.google.android.material.snackbar.Snackbar;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static com.garima.garima.Activities.Mainactivity.getScreenOrientation;


/**
 * Created by parag on 18/02/18.
 */

public class Item_selected extends AppCompatActivity implements View.OnClickListener {

    private static final String TAG = Item_selected.class.getSimpleName();

    private ProgressBar progressBar;
    private PrefManager pref;
    private String _PhoneNo;
    private Toolbar toolbar;
    private EditText mAutocompleteView;
    private RecyclerView laterRv;
    private CoordinatorLayout coordinatorLayout;
    private ListView lv;
    private ArrayAdapter<String> adapter;
    private LinearLayout L4, _added;
    private TextView _moneyValue, _itemValue;
    private Button _checkout;
    private int _from = 0;
    private int _commodity = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        setContentView(R.layout.item_select);
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _PhoneNo = user.get(PrefManager.KEY_MOBILE);
        toolbar = findViewById(R.id.toolbar_place);
        progressBar = findViewById(R.id.progressBardrop);
        lv = findViewById(R.id.listView);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(true);
        mAutocompleteView = findViewById(R.id.autocomplete_places);
        _moneyValue = findViewById(R.id._moneyValue);
        _itemValue = findViewById(R.id._itemValue);
        _added = findViewById(R.id._added);
        _added.setVisibility(View.GONE);
        laterRv = findViewById(R.id.placeRv);
        laterRv.setNestedScrollingEnabled(false);
        _checkout = findViewById(R.id.checkout);
        _checkout.setOnClickListener(this);
        coordinatorLayout = findViewById(R.id.itemCor);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Item_selected.this, Mainactivity.class);
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
                i.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION);
                startActivity(i);
                finish();
            }
        });



    }


    @Override
    protected void onResume() {
        super.onResume();
        Intent o = getIntent();
        _from = o.getIntExtra("from", 0);
        _commodity = o.getIntExtra("commodity", 0);
        final ArrayList<main> CanteenArray = new ArrayList<main>();
        final ArrayList<String> mName = new ArrayList<String>();
        if (_commodity == 0) {
            StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.GET_ALL,
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Log.w("mainlayout", response);
                            mName.clear();
                            try {
                                JSONObject jsonObj = new JSONObject(response);
                                JSONArray items = jsonObj.getJSONArray("items");

                                if (_from == 0) {
                                    if (items.length() != 0) {
                                        for (int i = 0; i < items.length(); i++) {
                                            JSONObject c = items.getJSONObject(i);
                                            if (!c.isNull("Name")) {
                                                main item = new main();
                                                item.setID(c.getInt("ID"));
                                                item.setName(c.getString("Name"));
                                                mName.add(c.getString("Name"));
                                                mName.add(c.getString("Category"));
                                                item.setPhoto(c.getString("Photo"));
                                                item.setPrice(c.getDouble("Price"));
                                                item.setCategory(c.getString("Category"));
                                                item.setDiscount(c.getDouble("Discount"));
                                                item.setFinal_Price(c.getDouble("Final_Price"));
                                                CanteenArray.add(item);
                                            }

                                        }
                                    }
                                } else if (_from == 2) {
                                    JSONArray dealItem = jsonObj.getJSONArray("dealItem");
                                    if (dealItem.length() != 0) {
                                        for (int i = 0; i < dealItem.length(); i++) {
                                            JSONObject c = dealItem.getJSONObject(i);
                                            if (!c.isNull("Name")) {
                                                main item = new main();
                                                item.setID(c.getInt("ID"));
                                                mName.add(c.getString("Name"));
                                                mName.add(c.getString("Category"));
                                                item.setName(c.getString("Name"));
                                                item.setPhoto(c.getString("Photo"));
                                                item.setPrice(c.getDouble("Price"));
                                                item.setCategory(c.getString("Category"));
                                                item.setDiscount(c.getDouble("Discount"));
                                                item.setFinal_Price(c.getDouble("Final_Price"));
                                                CanteenArray.add(item);
                                            }

                                        }
                                    }
                                } else if (_from == 1) {
                                    JSONArray newItem = jsonObj.getJSONArray("newItem");
                                    if (newItem.length() != 0) {
                                        for (int i = 0; i < newItem.length(); i++) {
                                            JSONObject c = newItem.getJSONObject(i);
                                            if (!c.isNull("Name")) {
                                                main item = new main();
                                                item.setID(c.getInt("ID"));
                                                mName.add(c.getString("Name"));
                                                mName.add(c.getString("Category"));
                                                item.setName(c.getString("Name"));
                                                item.setPhoto(c.getString("Photo"));
                                                item.setPrice(c.getDouble("Price"));
                                                item.setCategory(c.getString("Category"));
                                                item.setDiscount(c.getDouble("Discount"));
                                                item.setFinal_Price(c.getDouble("Final_Price"));
                                                CanteenArray.add(item);
                                            }

                                        }
                                    }
                                } else if (_from == 3) {

                                    if (items.length() != 0) {
                                        for (int i = 0; i < items.length(); i++) {
                                            JSONObject c = items.getJSONObject(i);
                                            if (!c.isNull("Name")) {
                                                main item = new main();
                                                item.setID(c.getInt("ID"));
                                                mName.add(c.getString("Name"));
                                                mName.add(c.getString("Category"));
                                                item.setName(c.getString("Name"));
                                                item.setPhoto(c.getString("Photo"));
                                                item.setPrice(c.getDouble("Price"));
                                                item.setCategory(c.getString("Category"));
                                                item.setDiscount(c.getDouble("Discount"));
                                                item.setFinal_Price(c.getDouble("Final_Price"));
                                                CanteenArray.add(item);
                                            }

                                        }
                                    }
                                } else if (_from == 4) {
                                    JSONArray popular = jsonObj.getJSONArray("popular");
                                    if (popular.length() != 0) {
                                        for (int i = 0; i < popular.length(); i++) {
                                            JSONObject c = popular.getJSONObject(i);
                                            if (!c.isNull("Name")) {
                                                main item = new main();
                                                mName.add(c.getString("Name"));
                                                mName.add(c.getString("Category"));
                                                item.setID(c.getInt("ID"));
                                                item.setName(c.getString("Name"));
                                                item.setCategory(c.getString("Category"));
                                                item.setPhoto(c.getString("Photo"));
                                                item.setPrice(c.getDouble("Price"));
                                                item.setDiscount(c.getDouble("Discount"));
                                                item.setFinal_Price(c.getDouble("Final_Price"));
                                                CanteenArray.add(item);
                                            }

                                        }
                                    }
                                } else if (_from == 5) {
                                    JSONArray popular = jsonObj.getJSONArray("recommend");
                                    if (popular.length() != 0) {
                                        for (int i = 0; i < popular.length(); i++) {
                                            JSONObject c = popular.getJSONObject(i);
                                            if (!c.isNull("Name")) {
                                                main item = new main();
                                                mName.add(c.getString("Name"));
                                                mName.add(c.getString("Category"));
                                                item.setID(c.getInt("ID"));
                                                item.setName(c.getString("Name"));
                                                item.setCategory(c.getString("Category"));
                                                item.setPhoto(c.getString("Photo"));
                                                item.setPrice(c.getDouble("Price"));
                                                item.setDiscount(c.getDouble("Discount"));
                                                item.setFinal_Price(c.getDouble("Final_Price"));
                                                CanteenArray.add(item);
                                            }

                                        }
                                    }
                                }


                            } catch (final JSONException e) {
                                Log.e("HI", "Json parsing error: " + e.getMessage());
                            }


                            progressBar.setVisibility(View.GONE);


                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    volleyError(error);
                }

            }) {
                @Override
                protected Map<String, String> getParams() {
                    Map<String, String> params = new HashMap<String, String>();
                    params.put("_mId", "");
                    return params;
                }

            };
            AppController.getInstance().addToRequestQueue(eventoReq);
        } else {
            StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.GET_ALL_PRODUCTS,
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {

                            Log.w("mainlayout", response);
                                mName.clear();
                            try {
                                JSONObject jsonObj = new JSONObject(response);
                                JSONArray commodity = jsonObj.getJSONArray("commodities");
                                if (commodity.length() != 0) {
                                    for (int i = 0; i < commodity.length(); i++) {
                                        JSONObject c = commodity.getJSONObject(i);
                                        if (!c.isNull("Name")) {
                                            main item = new main();
                                            mName.add(c.getString("Name"));
                                            mName.add(c.getString("Category"));
                                            item.setID(c.getInt("ID"));
                                            item.setName(c.getString("Name"));
                                            item.setCategory(c.getString("Category"));
                                            item.setPhoto(c.getString("Photo"));
                                            item.setPrice(c.getDouble("Price"));
                                            item.setDiscount(c.getDouble("Discount"));
                                            item.setFinal_Price(c.getDouble("Final_Price"));
                                            CanteenArray.add(item);
                                        }

                                    }
                                }


                            } catch (final JSONException e) {
                                Log.e("HI", "Json parsing error: " + e.getMessage());
                            }

                            progressBar.setVisibility(View.GONE);
                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    volleyError(error);
                }

            }) {
                @Override
                protected Map<String, String> getParams() {
                    Map<String, String> params = new HashMap<String, String>();
                    params.put("from", "");
                    params.put("commodity", String.valueOf(_commodity));
                    return params;
                }

            };
            AppController.getInstance().addToRequestQueue(eventoReq);

        }

        if (mName.size() != 0) {
            Set<String> set = new HashSet<>(mName);
            mName.clear();
            mName.addAll(set);
        }


        adapter = new ArrayAdapter<String>(Item_selected.this, R.layout.list_item, R.id.product_name, mName);


        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                final ArrayList<main> filteredModelList = new ArrayList<>();


                for (int i = 0; i < CanteenArray.size(); i++) {
                    main model = CanteenArray.get(i);
                    final String text = model.getName(i).toLowerCase();
                    String value = (String) parent.getItemAtPosition(position);
                    if (text.contains(value.toLowerCase())) {
                        filteredModelList.add(model);
                    } else {
                        final String text1 = model.getCategory(i).toLowerCase();
                        String value1 = (String) parent.getItemAtPosition(position);
                        if (text1.contains(value1.toLowerCase())) {
                            filteredModelList.add(model);
                        }
                    }

                }

                MainAdapter hadapter = new MainAdapter(Item_selected.this, filteredModelList);
                hadapter.notifyDataSetChanged();
                hadapter.setPref(pref);
                hadapter.setLinearLayout_item(_added);
                hadapter.setValues(_moneyValue, _itemValue);
                hadapter.setButton(_checkout);
                laterRv.setItemAnimator(new DefaultItemAnimator());
                laterRv.setAdapter(hadapter);
                laterRv.setItemViewCacheSize(10);
                laterRv.setHasFixedSize(true);
                StaggeredGridLayoutManager mLay =
                        new StaggeredGridLayoutManager(getSpan(), StaggeredGridLayoutManager.VERTICAL);
                laterRv.setLayoutManager(mLay);
                lv.setVisibility(View.GONE);
                laterRv.setVisibility(View.VISIBLE);
            }
        });
        mAutocompleteView.addTextChangedListener(new TextWatcher() {

            @Override
            public void onTextChanged(CharSequence cs, int arg1, int arg2, int arg3) {
                adapter.getFilter().filter(cs);
                lv.setAdapter(adapter);
                lv.setVisibility(View.VISIBLE);
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }

            @Override
            public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
            }


        });

    }

    private void volleyError(VolleyError error) {
        VolleyLog.d("uuu", "Error: " + error.getMessage());
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


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_white, menu);
        return true;

    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if (item.getItemId() == R.id.action_refresh1) {
            recreate();
        }
        return super.onOptionsItemSelected(item);
    }

    public int getSpan() {
        int orientation = getScreenOrientation(getApplicationContext());
        return orientation == Configuration.ORIENTATION_PORTRAIT ? 2 : 2;
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            Intent o = new Intent(Item_selected.this, Mainactivity.class);
            startActivity(o);
            finish();
            overridePendingTransition(R.anim.slide_out2, R.anim.slide_in2);

        }
        return true;
    }


    @Override
    public void onClick(View view) {
        if (view.getId() == R.id.checkout) {
            Intent o = new Intent(Item_selected.this, CheckOut.class);
            startActivity(o);
            finish();
            overridePendingTransition(R.anim.slide_out2, R.anim.slide_in2);
        }
    }
}
