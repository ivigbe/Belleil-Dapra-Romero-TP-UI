package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import ar.edu.unq.programacionui.gatoencerradomobile.R;

public class LaberintoDetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_laberintos_detail);

        Toolbar toolbar = (Toolbar) findViewById(R.id.detail_toolbar);
        setSupportActionBar(toolbar);

        if (savedInstanceState == null) {
            // Create the detail fragment and add it to the activity
            // using a fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putSerializable(LaberintoDetailFragment.ARG_ITEM_ID,
                    getIntent().getSerializableExtra(LaberintoDetailFragment.ARG_ITEM_ID));
            LaberintoDetailFragment fragment = new LaberintoDetailFragment();
            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.laberinto_detail_container, fragment)
                    .commit();
        }
    }
}
