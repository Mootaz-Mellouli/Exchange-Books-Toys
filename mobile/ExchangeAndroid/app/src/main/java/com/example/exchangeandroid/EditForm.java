package com.example.exchangeandroid;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import static com.example.exchangeandroid.Details.EDIT_ID;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class EditForm extends AppCompatActivity implements AdapterView.OnItemSelectedListener {
    final String URI="http://10.0.2.2:8080/livre/";
    Spinner spinner ;
    EditText titles;
    EditText auteurs;
    EditText maisons;
    RadioGroup etats;
    RequestQueue requestQueue;
    TextView heading;
    Button editBook;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.edit_form);
        requestQueue = Volley.newRequestQueue(this);
        Intent i = getIntent();
        String id = i.getStringExtra(EDIT_ID);
        spinner=findViewById(R.id.categoryBooke);
        titles = findViewById(R.id.bookTitlee);
        auteurs = findViewById(R.id.BookAuthore);
        maisons = findViewById(R.id.BookPublishingHousee);
        etats = findViewById(R.id.radioGroup_charactere);
        editBook = findViewById(R.id.editBook);
        getBook(id);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,R.array.categoryBook, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner.setOnItemSelectedListener(this);
        editBook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                updateBook(id);
            }
        });
    }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }

    public void updateBook(String id){
        StringRequest putRequest = new StringRequest(Request.Method.PUT, URI+id,
                new Response.Listener<String>()
                {
                    @Override
                    public void onResponse(String response) {
                        // response
                        Log.d("Response", response);
                        Intent i = new Intent(EditForm.this, Products.class);
                        startActivity(i);
                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        // error
                        Log.d("Error.Response", error.getMessage());
                    }
                }
        ) {

            @Override
            protected Map<String, String> getParams()
            {
                Map<String, String> params = new HashMap<String, String>();
                params.put("titre", titles.getText().toString());
                params.put("auteur", auteurs.getText().toString());
                params.put("maison_edition", maisons.getText().toString());
                return params;
            }

        };

        requestQueue.add(putRequest);
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
                titles.setText(titre);

                auteurs.setText(auteur);
                maisons.setText(maison_edition);
                //l = new Livre(id,titre,auteur,maison_edition,etat_livre,categorie_livre,uploaded_by,donate);
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(EditForm.this,error.getMessage(),Toast.LENGTH_LONG).show();
                    }
                });
        requestQueue.add(stringRequest);

    }
}