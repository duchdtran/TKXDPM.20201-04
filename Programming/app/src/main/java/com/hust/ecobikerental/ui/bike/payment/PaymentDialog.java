package com.hust.ecobikerental.ui.bike.payment;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.Nullable;

import com.google.android.material.bottomsheet.BottomSheetDialogFragment;
import com.hust.ecobikerental.R;

public class PaymentDialog extends BottomSheetDialogFragment {
    private BottomSheetListener mListener;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.payment_dialog, container, false);
        View addPayment = v.findViewById(R.id.add_payment);
        View confirmPayment = v.findViewById(R.id.confirm_payment);
        addPayment.setOnClickListener(v1 -> {
            mListener.onButtonClicked("Button 1 clicked");
            dismiss();
        });
        confirmPayment.setOnClickListener(v12 -> {
            mListener.onButtonClicked("Button 2 clicked");
            dismiss();
        });
        return v;
    }
    public interface BottomSheetListener {
        void onButtonClicked(String text);
    }
    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        try {
            mListener = (BottomSheetListener) context;
        } catch (ClassCastException e) {
            throw new ClassCastException(context.toString()
                    + " must implement BottomSheetListener");
        }
    }
}