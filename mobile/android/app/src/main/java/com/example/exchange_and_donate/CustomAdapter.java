package com.example.exchange_and_donate;

import android.annotation.SuppressLint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.exchange_and_donate.entities.Livre;

import java.util.ArrayList;

public class CustomAdapter extends RecyclerView.Adapter<CustomAdapter.MyViewHolder>
{
    ArrayList<Livre> bookData;
    ImageView image;
//    ArrayList<Jouet> toyData;
    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView title;
        TextView auteur;
//        TextView email;
        CustomAdapter customAdapter;
        public MyViewHolder(@NonNull View itemView, CustomAdapter adapter) {
            super(itemView);
            image = itemView.findViewById(R.id.image);
            title = itemView.findViewById(R.id.title);
            auteur = itemView.findViewById(R.id.auteur);
            customAdapter = adapter;
        }
    }

    public CustomAdapter(ArrayList<Livre> bookData)
    {
        this.bookData = bookData;
//        this.toyData = toyData;
    }


    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new MyViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.bookline,parent,false),this);
    }

    @Override
    public void onBindViewHolder(@NonNull final MyViewHolder holder, @SuppressLint("RecyclerView") int position)
    {
        holder.title.setText(bookData.get(position).getTitre());
        holder.auteur.setText(bookData.get(position).getAuteur());

    }



    @Override
    public int getItemCount()
    {
        return bookData.size();
    }
}