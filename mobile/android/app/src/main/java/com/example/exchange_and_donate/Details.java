package com.example.exchange_and_donate;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.exchange_and_donate.entities.Livre;

import static com.example.exchange_and_donate.Products.Extra_Message_Key;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class Details extends AppCompatActivity {
    final String URI="http://10.0.2.2:8080/livre/";
    Livre l;
    RequestQueue requestQueue;
    ArrayList<Livre> arr;
    TextView titres;
    TextView auteurs;
    TextView maisons;
    TextView etats;
    TextView categories;
    TextView uploadeds;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.detail);
        titres = findViewById(R.id.titreInfo);
        auteurs = findViewById(R.id.auteurInfo);
        maisons = findViewById(R.id.maisonInfo);
        etats = findViewById(R.id.etatInfo);
        categories = findViewById(R.id.categorieInfo);
        uploadeds = findViewById(R.id.uploadedInfo);

        l = new Livre();
        arr = new ArrayList<>();
        Intent i = getIntent();
        String id = i.getStringExtra(Extra_Message_Key);
        requestQueue = Volley.newRequestQueue(this);
        getBook(id);

//        titre.setText(arr.get(0).getTitre());
//        auteur.setText(arr.get(0).getAuteur());
//        maison.setText(arr.get(0).getId());
//        etat.setText(arr.get(0).getEtat_livre());
//        categorie.setText(arr.get(0).getCategorie_livre());
//        uploaded.setText(arr.get(0).getUploaded_by());
        //Toast.makeText(getApplicationContext(),l.getAuteur(), Toast.LENGTH_LONG).show();
    }

    void getBook(String id){
        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.GET, URI+id,null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {

                    JSONObject object = response;

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
                    titres.setText(titre);
                auteurs.setText(auteur);
                maisons.setText(maison_edition);
                etats.setText(etat_livre);
                categories.setText(categorie_livre);
                uploadeds.setText(uploaded_by);
                    //l = new Livre(id,titre,auteur,maison_edition,etat_livre,categorie_livre,uploaded_by,donate);
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(Details.this,error.getMessage(),Toast.LENGTH_LONG).show();
                    }
                });
        requestQueue.add(stringRequest);

    }
}
