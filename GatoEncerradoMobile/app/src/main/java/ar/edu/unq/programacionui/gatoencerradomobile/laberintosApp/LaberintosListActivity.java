package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;

public class LaberintosListActivity extends AppCompatActivity
        implements LaberintosListFragment.Callbacks {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_laberintos_list);

        Toolbar toolbar = (Toolbar) findViewById(R.id.list_toolbar);
        setSupportActionBar(toolbar);
    }

    @Override
    public void onItemSelected(Laberinto laberinto) {
        Intent detailIntent = new Intent(this, LaberintoDetailActivity.class);
        Log.w("Laberintos", laberinto.getNombreLaberinto());
        detailIntent.putExtra(LaberintoDetailFragment.ARG_ITEM_ID, laberinto);
        startActivity(detailIntent);
        }
}