package ar.edu.unq.programacionui.gatoencerradomobile.laberintosApp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.widget.AdapterView;
import android.widget.Button;
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

public class LaberintosListFragment extends ListFragment implements View.OnClickListener{

    private Callbacks mCallbacks = sDummyCallbacks;

    private LaberintosService laberintosService;

    public LaberintosListFragment() {
        // Required empty public constructor
    }

    @Override
    public void onClick(View v) {
        irAInventario();
    }

    private void irAInventario(){

        Intent intent = new Intent(getContext(), InventarioListActivity.class);
        startActivity(intent);
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
    public Animation onCreateAnimation(int transit, boolean enter, int nextAnim) {
        return super.onCreateAnimation(transit, enter, nextAnim);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        String BASE_URL = "http://192.168.0.21:9500/laberintosMobile";

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        laberintosService = retrofit.create(LaberintosService.class);

        obtenerLaberintos();
    }

    private void obtenerLaberintos(){

        final Call<List<Laberinto>> laberintoCall = laberintosService.getLaberintosMobile("1");

        laberintoCall.enqueue(new Callback<List<Laberinto>>() {
            @Override
            public void onResponse(Response<List<Laberinto>> response, Retrofit retrofit) {
                List<Laberinto> laberintos = response.body();
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

        Button aInventario = (Button) v.findViewById(R.id.boton_ver_inventario);

        return v;
    }

    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (!(activity instanceof Callbacks)) {
            throw new IllegalStateException("Activity must implement fragment's callbacks.");
        }

        mCallbacks = (Callbacks) activity;
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
}
