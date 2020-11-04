package com.hust.ecobikerental.ui.bike;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.widget.CompositePageTransformer;
import androidx.viewpager2.widget.MarginPageTransformer;
import androidx.viewpager2.widget.ViewPager2;

import com.google.android.material.tabs.TabLayout;
import com.hust.ecobikerental.R;
import com.hust.ecobikerental.data.model.others.Image;
import com.tbuonomo.viewpagerdotsindicator.WormDotsIndicator;

import java.util.ArrayList;
import java.util.List;

public class BikeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bike);

        initViewPager();
        initTabLayout();
    }
    void initViewPager(){
        ViewPager2 viewPager2 = findViewById(R.id.viewPagerImage);
        WormDotsIndicator dotsIndicator = findViewById(R.id.dots_indicator);

        //add list
        List<Image> introduceList = new ArrayList<>();
        introduceList.add(new Image("https://salt.tikicdn.com/cache/w444/ts/product/c1/c2/f8/98686794a3a4ff91494f2c9524727535.jpg"));
        introduceList.add(new Image("https://salt.tikicdn.com/cache/w444/ts/product/c6/9e/83/fd15398288b36091fa713b70d6f945e4.png"));
        introduceList.add(new Image("https://salt.tikicdn.com/cache/w444/ts/product/ac/1c/7a/327b00248c55ba08d0bb482b6242d554.png"));
        introduceList.add(new Image("https://salt.tikicdn.com/cache/w444/ts/product/21/dc/ad/81f9cdc48f247e9d006883ca0e5afbed.png"));
        introduceList.add(new Image("https://salt.tikicdn.com/cache/w444/ts/product/28/78/a5/6f2e1681de46c2c14e66d79a7a67865b.png"));
        introduceList.add(new Image("https://salt.tikicdn.com/cache/w1200/ts/product/5d/d9/dd/7a53cbf431da3c6f961645489112bdcd.png"));

        ImageAdapter adapter = new ImageAdapter(introduceList);
        viewPager2.setAdapter(adapter);

        viewPager2.setClipToPadding(false);
        viewPager2.setClipChildren(false);
        viewPager2.setOffscreenPageLimit(3);
        viewPager2.getChildAt(0).setOverScrollMode(RecyclerView.OVER_SCROLL_NEVER);

        CompositePageTransformer compositePageTransformer = new CompositePageTransformer();
        compositePageTransformer.addTransformer(new MarginPageTransformer(16));

        viewPager2.setPageTransformer(compositePageTransformer);


        dotsIndicator.setViewPager2(viewPager2);
    }

    void initTabLayout(){
        TabLayout tabLayout= findViewById(R.id.tabLayout);
        ViewPager2 viewPager= findViewById(R.id.viewPager);

        tabLayout.addTab(tabLayout.newTab().setText("Mô tả"));
        tabLayout.addTab(tabLayout.newTab().setText("Chi tiết"));
        tabLayout.addTab(tabLayout.newTab().setText("Đánh giá"));
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);

        final MyAdapter adapter = new MyAdapter(this, this, tabLayout.getTabCount());
        viewPager.setAdapter(adapter);


    }
}
