package com.hust.ecobikerental.ui.scanqr;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;

import com.chaos.view.PinView;
import com.google.android.material.bottomsheet.BottomSheetDialogFragment;
import com.hust.ecobikerental.R;
import com.hust.ecobikerental.ui.bike.payment.PaymentDialog;

public class InputQRCodeDialog extends BottomSheetDialogFragment {
    private InputQRCodeDialog.BottomSheetListener mListener;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.dialog_qr_code, container, false);
        return v;
    }
    public interface BottomSheetListener {
        void onButtonClicked(String text);
    }
    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        try {
            mListener = (InputQRCodeDialog.BottomSheetListener) context;
        } catch (ClassCastException e) {
            throw new ClassCastException(context.toString()
                    + " must implement BottomSheetListener");
        }
    }
}
