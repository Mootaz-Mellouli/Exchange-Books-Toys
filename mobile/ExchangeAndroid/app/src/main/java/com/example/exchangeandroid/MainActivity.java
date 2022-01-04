package com.example.exchangeandroid;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    Button addbook ;
    Button donatetoy ;
    Button donatebook ;
    Button addtoy ;
    Button showlist ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        addbook=findViewById(R.id.btnAddBook);
        addtoy=findViewById(R.id.btnaddtoy);
        donatebook=findViewById(R.id.donatebook);
        donatetoy=findViewById(R.id.btnaddtoy);
        showlist=findViewById(R.id.btnshow);
    }
    public void ajouterBook (View v)
    {
        addbook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this,addBookForm.class);
                startActivity(intent);
            }
        });
    }
    public void donatebook (View v)
    {
        donatebook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this,addBookForm.class);
                startActivity(intent);
            }
        });
    }
    public void viewList (View v)
    {
        showlist.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this,ProductListe.class);
                startActivity(intent);
            }
        });
    }
    public void addtoy (View v)
    {
        addtoy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this,addToyForm.class);
                startActivity(intent);
            }
        });
    }
    public void donatetoy (View v)
    {
        donatetoy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this,addToyForm.class);
                startActivity(intent);
            }
        });
    }
}