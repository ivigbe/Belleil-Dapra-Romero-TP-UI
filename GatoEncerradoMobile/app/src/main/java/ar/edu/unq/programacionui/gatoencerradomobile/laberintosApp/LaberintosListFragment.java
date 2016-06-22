package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import ar.edu.unq.programacionui.gatoencerradomobile.adapters.LaberintoAdapter;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.domain.Laberinto;
import ar.edu.unq.programacionui.gatoencerradomobile.laberintos.services.LaberintosService;

import ar.edu.unq.programacionui.gatoencerradomobile.R;
import retrofit.Call;
import retrofit.Callback;
import retrofit.GsonConverterFactory;
import retrofit.Response;
import retrofit.Retrofit;

public class LaberintosListFragment extends ListFragment implements View.OnClickListener {

    private Callbacks mCallbacks = sDummyCallbacks;

    private LaberintosService laberintosService;

    public LaberintosListFragment() {
        // Required empty public constructor
    }
    public interface Callbacks {
        void onItemSelected(Laberinto laberinto);
    }

    private static Callbacks sDummyCallbacks = new Callbacks() {
        @Override
        public void onItemSelected(Laberinto laberinto) {
        }
    };


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String BASE_URL = "http://192.168.0.21:9000/laberintos/";

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        laberintosService = retrofit.create(LaberintosService.class);
    }

    private void obtenerLaberintos(){

        final Call<List<Laberinto>> laberintoCall = laberintosService.getLaberintos("1");

        laberintoCall.enqueue(new Callback<List<Laberinto>>() {
            @Override
            public void onResponse(Response<List<Laberinto>> response, Retrofit retrofit) {
                List<Laberinto> laberintos = response.body();/*
                ListView laberintosView = (ListView) findViewById(R.id.list_laberintos);
                View headerList = (View) getLayoutInflater().inflate(R.layout.list_header_row, null);
                laberintosView.addHeaderView(headerList);
                laberintosView.setAdapter(new LaberintoAdapter(getApplicationContext(), laberintos));

                laberintosView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        TextView tv = (TextView) findViewById(R.id.text_laberinto_row);
                        Toast.makeText(getApplicationContext(), tv.getText(), Toast.LENGTH_SHORT).show();
                    }*/

                setListAdapter(new LaberintoAdapter(
                        getActivity(),
                        laberintos));
                }

            @Override
            public void onFailure(Throwable t) {
                t.printStackTrace();
                Log.e("LaberintosApp", t.getMessage());
            }
        });

    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_laberintos_list, container, false);

        return v;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (!(context instanceof Callbacks)) {
            throw new IllegalStateException("Activity must implement fragment's callbacks.");
        }

        mCallbacks = (Callbacks) context;
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mCallbacks = sDummyCallbacks;
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        super.onListItemClick(listView, view, position, id);

        Laberinto laberinto = (Laberinto) listView.getAdapter().getItem(position);
        Toast.makeText(getContext(), laberinto.getNombreLaberinto(), Toast.LENGTH_LONG).show();

        mCallbacks.onItemSelected(laberinto);
    }

    @Override
    public void onClick(View v) {
        obtenerLaberintos();
    }
}
