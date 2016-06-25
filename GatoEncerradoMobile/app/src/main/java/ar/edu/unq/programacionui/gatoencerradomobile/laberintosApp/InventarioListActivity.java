package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import ar.edu.unq.programacionui.gatoencerradomobile.adapters.InventarioAdapter;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Item;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.services.LaberintosService;
import retrofit.Call;
import retrofit.Callback;
import retrofit.GsonConverterFactory;
import retrofit.Response;
import retrofit.Retrofit;

public class InventarioListActivity extends AppCompatActivity{

    private LaberintosService laberintosService;

    private InventarioAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inventario_list);

        String BASE_URL = "http://192.168.0.21:9500/inventario";

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        laberintosService = retrofit.create(LaberintosService.class);

        final ListView list = (ListView) findViewById(R.id.list_inventario);

        obtenerInventario(list);
    }

    private void obtenerInventario(ListView list){

        final ListView listV = list;

        final Call<ArrayList<Item>> inventarioCall = laberintosService.getInventario("1");

        inventarioCall.enqueue(new Callback<ArrayList<Item>>() {
            @Override
            public void onResponse(Response<ArrayList<Item>> response, Retrofit retrofit) {
                ArrayList<Item> inventario = response.body();
                adapter = new InventarioAdapter(getApplicationContext(), inventario);
                listV.setAdapter(adapter);
            }

            @Override
            public void onFailure(Throwable t) {
                t.printStackTrace();
                Log.e("LaberintosApp", t.getMessage());
            }
        });
    }
}
