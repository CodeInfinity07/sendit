package com.parag.ShillongCab.Activites.Ride_Later;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.google.android.material.tabs.TabLayout;
import com.parag.ShillongCab.Activites.Main_Page.GooglemapApp;
import com.parag.ShillongCab.R;

import java.util.ArrayList;
import java.util.List;

public class Tabs_past_future_ride extends AppCompatActivity {

    private Toolbar toolbar;
    private TabLayout tabLayout;
    private ViewPager viewPager;
    private double My_lat=0,My_long=0;
    private Bundle bundle;
    private int Pager=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.ride_later_tab);

        toolbar = findViewById(R.id.toolbar_later_tabs);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        viewPager = findViewById(R.id.viewpager_tabs);

        tabLayout = findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(viewPager);
        Intent i = getIntent();
        My_lat = i.getDoubleExtra("mylat", 0);
        My_long = i.getDoubleExtra("mylong", 0);
        Pager=i.getIntExtra("pager",0);

        bundle = new Bundle();
        bundle.putDouble("my_lat", My_lat);
        bundle.putDouble("my_long", My_long);
        setupViewPager(viewPager,bundle);

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Tabs_past_future_ride.this, GooglemapApp.class);
                i.putExtra("my_lat", My_lat);
                i.putExtra("my_long", My_long);
                startActivity(i);
                finish();

            }
        });

        if(Pager!=0){
            viewPager.setCurrentItem(1);
        }

    }

    private void setupViewPager(ViewPager viewPager,Bundle bundle) {
        ViewPagerAdapter adapter = new ViewPagerAdapter(getSupportFragmentManager());
        PastFragment fragobj = new PastFragment();
        fragobj.setArguments(bundle);
        adapter.addFragment(fragobj, "Past");
        com.parag.ShillongCab.Activites.Ride_Later.Future_fragment fragObj1=new com.parag.ShillongCab.Activites.Ride_Later.Future_fragment();
        fragObj1.setArguments(bundle);
        adapter.addFragment(fragObj1,"Upcoming");
        viewPager.setAdapter(adapter);
    }

    class ViewPagerAdapter extends FragmentPagerAdapter {
        private final List<Fragment> mFragmentList = new ArrayList<>();
        private final List<String> mFragmentTitleList = new ArrayList<>();

        public ViewPagerAdapter(FragmentManager manager) {
            super(manager);
        }

        @Override
        public Fragment getItem(int position) {
            return mFragmentList.get(position);
        }

        @Override
        public int getCount() {
            return mFragmentList.size();
        }

        public void addFragment(Fragment fragment, String title) {
            mFragmentList.add(fragment);
            mFragmentTitleList.add(title);
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return mFragmentTitleList.get(position);
        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent i=new Intent(Tabs_past_future_ride.this, GooglemapApp.class);
        i.putExtra("my_lat", My_lat);
        i.putExtra("my_long", My_long);
        startActivity(i);
        finish();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_white, menu);
        return true;

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            case R.id.action_refresh1:
                recreate();

            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
