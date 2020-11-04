package com.hust.ecobikerental.ui.bike;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.hust.ecobikerental.R;
import com.hust.ecobikerental.data.model.others.Image;
import com.makeramen.roundedimageview.RoundedImageView;

import java.util.List;

public class ImageAdapter extends RecyclerView.Adapter<ImageAdapter.IntroduceViewHolder> {

    private List<Image> introduceList;
    private Context context;

    public ImageAdapter(List<Image> introduceList) {
        this.introduceList = introduceList;
    }

    @NonNull
    @Override
    public IntroduceViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        context = parent.getContext();
        return new IntroduceViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.layout_image, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull IntroduceViewHolder holder, int position) {
        holder.setImage(introduceList.get(position));
    }

    @Override
    public int getItemCount() {
        return introduceList.size();
    }

    class IntroduceViewHolder extends RecyclerView.ViewHolder{

        private RoundedImageView imageView;
        public IntroduceViewHolder(@NonNull View itemView) {
            super(itemView);
            imageView = itemView.findViewById(R.id.image_slide);
        }
        public void setImage(Image introduceDto) {
            Glide.with(context).load(introduceDto.getImage()).into(imageView);
        }
    }
}
