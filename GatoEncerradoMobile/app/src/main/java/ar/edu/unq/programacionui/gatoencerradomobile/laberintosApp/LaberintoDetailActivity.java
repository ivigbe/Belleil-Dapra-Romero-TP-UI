package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;

import ar.edu.unq.programacionui.gatoencerradomobile.R;

public class LaberintoDetailActivity extends AppCompatActivity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_laberintos_detail);

        if (savedInstanceState == null) {
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

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home) {
            navigateUpTo(new Intent(this, LaberintosListActivity.class));
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
