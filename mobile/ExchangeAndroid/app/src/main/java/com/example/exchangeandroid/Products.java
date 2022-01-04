package com.example.exchangeandroid;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import com.example.exchangeandroid.entities.Livre;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class Products extends AppCompatActivity {
    RecyclerView recycler_view;
    CustomAdapter adapter;
    ArrayList<Livre> livre;
    RequestQueue requestQueue;
    //    ArrayList<Integer> images;
    final String URI="http://10.0.2.2:8080/livre/";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_liste);
        livre = new ArrayList<>();
        requestQueue = Volley.newRequestQueue(this);
        loadlist();


        recycler_view = findViewById(R.id.recycler_view);
        adapter = new CustomAdapter(livre);
        recycler_view.setAdapter(adapter);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);
        recycler_view.setLayoutManager(layoutManager);
        recycler_view.setHasFixedSize(true);
    }

    private void loadlist() {
        livre = new ArrayList<>();
        JsonArrayRequest stringRequest = new JsonArrayRequest(Request.Method.GET, URI,
                null, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                JSONArray array = response;
                for(int i =0;i<array.length();i++){
                    JSONObject object = null;
                    try {
                        object = array.getJSONObject(i);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String id = null;
                    try {
                        id = object.getString("id");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String titre = null;
                    try {
                        titre = object.getString("titre");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String auteur = null;
                    try {
                        auteur = object.getString("auteur");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String maison_edition = null;
                    try {
                        maison_edition = object.getString("maison_edition");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String etat_livre = null;
                    try {
                        etat_livre = object.getString("etat_livre");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String categorie_livre = null;
                    try {
                        categorie_livre = object.getString("categorie_livre");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    String uploaded_by = null;
                    try {
                        uploaded_by = object.getString("uploaded_by");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    Boolean donate = null;
                    try {
                        donate = object.getBoolean("donate");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    livre.add(new Livre(id,titre,auteur,maison_edition,etat_livre,categorie_livre,uploaded_by,donate));
                }
                adapter.notifyDataSetChanged();
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(Products.this,error.getMessage(),Toast.LENGTH_LONG).show();
                    }
                });
        requestQueue.add(stringRequest);
    }
}
