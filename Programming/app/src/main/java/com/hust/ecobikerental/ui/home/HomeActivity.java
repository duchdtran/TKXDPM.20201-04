package com.hust.ecobikerental.ui.home;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.hust.ecobikerental.R;
import com.hust.ecobikerental.ui.bike.BikeActivity;
import com.hust.ecobikerental.ui.scanqr.ScanQRCodeActivity;

public class HomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        findViewById(R.id.btn_scan).setOnClickListener(view -> startActivity(new Intent(HomeActivity.this, ScanQRCodeActivity.class)));

        findViewById(R.id.btn_view_bike).setOnClickListener(view -> startActivity(new Intent(HomeActivity.this, BikeActivity.class)));
    }
}