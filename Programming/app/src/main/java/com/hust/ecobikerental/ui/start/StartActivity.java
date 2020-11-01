package com.hust.ecobikerental.ui.start;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.hust.ecobikerental.R;
import com.hust.ecobikerental.ui.splash.SplashActivity;

public class StartActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_start);

        ((Button)findViewById(R.id.btn_start)).setOnClickListener((View.OnClickListener) view -> {
            startActivity(new Intent(StartActivity.this, SplashActivity.class));
        });
    }
}