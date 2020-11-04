package com.hust.ecobikerental.ui.bike;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.viewpager2.adapter.FragmentStateAdapter;

import com.hust.ecobikerental.ui.bike.description.DescriptionFragment;
import com.hust.ecobikerental.ui.bike.reviews.ReviewsFragment;
import com.hust.ecobikerental.ui.bike.specifications.SpecificationsFragment;

public class MyAdapter extends FragmentStateAdapter {

    private Context myContext;
    int totalTabs;

    public MyAdapter(Context context, @NonNull FragmentActivity fragmentActivity, int totalTabs) {
        super(fragmentActivity);
        myContext = context;
        this.totalTabs = totalTabs;
    }


    @NonNull
    @Override
    public Fragment createFragment(int position) {
        switch (position) {
            case 0:
                DescriptionFragment homeFragment = new DescriptionFragment();
                return homeFragment;
            case 1:
                SpecificationsFragment sportFragment = new SpecificationsFragment();
                return sportFragment;
            case 2:
                ReviewsFragment movieFragment = new ReviewsFragment();
                return movieFragment;
            default:
                return null;
        }
    }

    @Override
    public int getItemCount() {
        return totalTabs;
    }
}